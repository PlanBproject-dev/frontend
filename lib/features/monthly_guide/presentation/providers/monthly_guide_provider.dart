// 플랜 id로 월별 여행 준비 가이드 조회 + 할 일 완료 체크

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/features/home/data/models/trip_plan_summary.dart';
import 'package:plan_b/features/home/data/models/trip_time_status.dart';
import 'package:plan_b/features/home/presentation/providers/home_plans_provider.dart';
import 'package:plan_b/features/monthly_guide/data/repositories/monthly_guide_repository.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_guide.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_guide_not_provided_exception.dart';
import 'package:plan_b/features/monthly_guide/presentation/providers/guide_creator_provider.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';
import 'package:plan_b/features/monthly_guide/data/models/dto/travel_guide_response_dto.dart';

/// 홈에서 선택한 플랜(confirmedPlanId)의 월별 가이드 id (가이드가 없으면 null)
/// - autoDispose 아님: 의존하는 두 provider도 유지되는 provider라서, read로 읽어도 중간에 폐기되지 않도록
final selectedTravelGuideIdProvider = FutureProvider<int?>((ref) async {
  final String? planId = ref.watch(selectedPlanIdProvider);
  if (planId == null) return null;

  final List<TripPlanSummary> plans = await ref.watch(homePlansProvider.future);
  return plans.where((plan) => plan.id == planId).firstOrNull?.travelGuideId;
});

class MonthlyGuideNotifier
    extends AutoDisposeFamilyAsyncNotifier<MonthlyGuide, String> {
  DateTime? _fetchedDate; // 마지막으로 조회한 날짜

  /// 요청 중인 할 일 id (같은 항목을 연달아 눌러 요청이 겹치지 않도록)
  final Set<String> _pendingTodoIds = {};

  /// build가 다시 실행되거나 폐기될 때마다 바뀌는 값
  /// (요청 중에 새로 조회했다면 실패해도 되돌리지 않기 위해)
  int _generation = 0;

  @override
  Future<MonthlyGuide> build(String planId) async {
    ref.onDispose(() => _generation++); // 다시 조회 / 폐기 시 이전 요청의 되돌리기 무효화

    // 가이드 id 확보 (없으면 생성)
    final int guideId = await _resolveGuideId(planId);
    final MonthlyGuideRepository repository = ref.read(monthlyGuideRepositoryProvider);

    // 타임라인 조회를 먼저 시작해서 월별 조회와 동시에 진행
    // 타임라인이 실패해도 월별 보기는 보여주도록 null로 처리
    final Future<AllTimelineGuideResponseDto?> timelineRequest = repository
        .getTimeline(guideId)
        .then<AllTimelineGuideResponseDto?>((timeline) => timeline)
        .catchError((Object e) {
      debugPrint('전체 타임라인 조회 실패 (이번 기간만 표시): $e');
      return null;
    });

    final MonthlyGuide guide =
        await repository.getGuide(guideId: guideId, planId: planId);
    final AllTimelineGuideResponseDto? timeline = await timelineRequest;
    _fetchedDate = _today();

    if (timeline == null) return guide;

    // 타임라인 변환이 실패해도(기간 날짜 누락 등) 월별 보기는 보여주도록 이번 기간만 반환
    try {
      return guide.withTimeline(
        timeline.toMonthlyGuidePeriods(totalCost: guide.totalBudget),
      );
    } catch (e) {
      debugPrint('전체 타임라인 변환 실패 (이번 기간만 표시): $e');
      return guide;
    }
  }

  /// 가이드 id 확보: 홈 목록에 있으면 사용, 없으면(생성 실패 / 기존 플랜) 생성
  /// - 가이드가 없고 시작일이 오늘이거나 지난 플랜은 생성하지 않고 MonthlyGuideNotProvidedException
  Future<int> _resolveGuideId(String planId) async {
    // watch가 아닌 read (homePlansProvider가 갱신돼도 가이드를 다시 불러오지 않도록)
    final int? savedId = await ref.read(selectedTravelGuideIdProvider.future);
    if (savedId != null) return savedId;

    // 이미 시작한 여행은 월별로 준비할 기간이 없어서 가이드를 만들지 않음
    if (await _hasTripStarted(planId)) {
      throw const MonthlyGuideNotProvidedException();
    }

    final int? confirmedPlanId = int.tryParse(planId);
    if (confirmedPlanId == null) throw StateError('확정된 플랜 id가 아님: $planId');

    try {
      // homePlansProvider 갱신은 GuideCreator가 성공/실패와 관계없이 처리
      return await ref.read(guideCreatorProvider).ensureGuide(confirmedPlanId);
    } on ApiException catch (e) {
      // 이미 생성된 가이드(중복 생성 충돌): 갱신된 홈 목록에서 기존 id를 다시 찾음
      if (e.statusCode != 409) rethrow;

      final int? existingId = await ref.read(selectedTravelGuideIdProvider.future);
      if (existingId == null) rethrow;
      return existingId;
    }
  }

  /// 시작일이 오늘이거나 지난 플랜인지 (진행 중 / 지난 여행)
  Future<bool> _hasTripStarted(String planId) async {
    final List<TripPlanSummary> plans = await ref.read(homePlansProvider.future);
    final TripPlanSummary? plan =
        plans.where((plan) => plan.id == planId).firstOrNull;
    return plan != null && plan.status != TripTimeStatus.upcoming;
  }

  /// 할 일 완료 체크 토글 (준비 항목 / 저축 목표 공통)
  /// - 화면을 먼저 바꾸고 서버에 저장. 실패하면 이 항목만 되돌린 뒤 예외를 다시 던짐 (페이지에서 토스트)
  Future<void> toggleTodo(String todoId) async {
    final MonthlyGuide? guide = state.valueOrNull;
    if (guide == null || _pendingTodoIds.contains(todoId)) return;

    // 저장할 API가 없는 id면 화면도 바꾸지 않음 (서버와 어긋나지 않도록)
    final Future<void> Function()? save = _saveRequestOf(todoId);
    if (save == null) return;

    // 월별 / 타임라인 어느 보기에서 체크해도 같은 할 일이 바뀌도록 전체 기간에서 찾음
    state = AsyncData(guide.toggleTodo(todoId));

    final int generation = _generation;
    _pendingTodoIds.add(todoId);
    try {
      await save();
    } catch (_) {
      // 그 사이 다른 항목이 바뀌었을 수 있어 스냅샷 대신 이 항목만 다시 뒤집음
      // 요청 중에 새로 조회했거나 화면을 나갔다면 서버 값이 기준이므로 되돌리지 않음
      final MonthlyGuide? current = state.valueOrNull;
      if (generation == _generation && current != null) {
        state = AsyncData(current.toggleTodo(todoId));
      }
      rethrow;
    } finally {
      _pendingTodoIds.remove(todoId);
    }
  }

  /// 할 일 id의 접두어로 부를 체크 API 고르기
  Future<void> Function()? _saveRequestOf(String todoId) {
    final MonthlyGuideRepository repository = ref.read(monthlyGuideRepositoryProvider);

    final int? todoPeriodId = todoPeriodIdOf(todoId);
    if (todoPeriodId != null) return () => repository.toggleTodo(todoPeriodId);

    final int? savingId = savingIdOf(todoId);
    if (savingId != null) return () => repository.toggleSaving(savingId);

    return null;
  }

  /// 마지막 조회 이후 날짜가 바뀌었으면 다시 조회 (D-day, 이번 기간이 바뀌었을 수 있음)
  void refreshIfDayChanged() {
    final DateTime? fetched = _fetchedDate;
    if (fetched == null || fetched == _today()) return;
    ref.invalidateSelf();
  }

  /// 시간을 버린 오늘 날짜
  static DateTime _today() {
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}

final monthlyGuideProvider = AsyncNotifierProvider.autoDispose
    .family<MonthlyGuideNotifier, MonthlyGuide, String>(MonthlyGuideNotifier.new);