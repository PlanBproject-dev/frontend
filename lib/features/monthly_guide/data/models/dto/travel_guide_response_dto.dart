import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/monthly_guide/data/models/monthly_guide.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_guide_not_provided_exception.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_period_type.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_todo.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_todo_type.dart';
import 'package:plan_b/core/utils/cost_format.dart';

part 'travel_guide_response_dto.freezed.dart';
part 'travel_guide_response_dto.g.dart';

/// GET /api/v1/guides/{guideId}
@freezed
class TravelGuideResponseDto with _$TravelGuideResponseDto {
  const factory TravelGuideResponseDto({
    int? dDay,                      // 여행 시작일까지 남은 일수
    num? totalCost,                 // 목표 총 예산
    int? remainingMonths,           // 이번 기간 포함 남은 기간 수
    num? monthlySavingAmount,       // 월 저축 목표 금액
    num? accumulatedSavingAmount,   // 누적 저축 목표 금액
    TravelGuidePeriodDto? period,   // 이번 기간
  }) = _TravelGuideResponseDto;

  factory TravelGuideResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TravelGuideResponseDtoFromJson(json);
}

/// 기간 1개 (이번 기간)
@freezed
class TravelGuidePeriodDto with _$TravelGuidePeriodDto {
  const factory TravelGuidePeriodDto({
    String? periodStart,
    String? periodEnd,
    TravelGuideSavingDto? saving, // 저축 목표 (마지막 자투리 기간이면 없음)
    @Default([]) List<TravelGuideTodoDto> todos,
  }) = _TravelGuidePeriodDto;

  factory TravelGuidePeriodDto.fromJson(Map<String, dynamic> json) =>
      _$TravelGuidePeriodDtoFromJson(json);
}

/// 기간별 저축 목표
@freezed
class TravelGuideSavingDto with _$TravelGuideSavingDto {
  const factory TravelGuideSavingDto({
    required int savingId, // 저축 체크 API(PATCH /guides/savings/{savingId})용
    String? periodStart,
    String? periodEnd,
    num? amount,
    @Default(false) bool isCompleted,
  }) = _TravelGuideSavingDto;

  factory TravelGuideSavingDto.fromJson(Map<String, dynamic> json) =>
      _$TravelGuideSavingDtoFromJson(json);
}

/// 준비 항목 1개
@freezed
class TravelGuideTodoDto with _$TravelGuideTodoDto {
  const factory TravelGuideTodoDto({
    required int todoPeriodId, // Todo 체크 API(PATCH /guides/todos/{todoPeriodId})용
    @Default(false) bool isCarriedOver, // true: 지난 기간에서 못 한 항목이 이번 기간으로 이월됨
    int? todoId,
    int? recommendationDetailId,
    String? detailType, // COURSE / LODGING / FLIGHT
    String? content,
    num? cost,
    @Default(false) bool isCompleted,
  }) = _TravelGuideTodoDto;

  factory TravelGuideTodoDto.fromJson(Map<String, dynamic> json) =>
      _$TravelGuideTodoDtoFromJson(json);
}

/// GET /api/v1/guides/{guideId}/timeline
@freezed
class AllTimelineGuideResponseDto with _$AllTimelineGuideResponseDto {
  const factory AllTimelineGuideResponseDto({
    @Default([]) List<TravelGuidePeriodDto> periods, // 확정일 ~ 출발 전 전체 기간
  }) = _AllTimelineGuideResponseDto;

  factory AllTimelineGuideResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AllTimelineGuideResponseDtoFromJson(json);
}

/// 화면 모델 할 일 id <-> 서버 todoPeriodId
const String _todoIdPrefix = 'todo-';

String todoIdOf(int todoPeriodId) => '$_todoIdPrefix$todoPeriodId';

/// 준비 항목 id가 아니면(저축 목표 등) null
int? todoPeriodIdOf(String todoId) => todoId.startsWith(_todoIdPrefix)
    ? int.tryParse(todoId.substring(_todoIdPrefix.length))
    : null;

/// 화면 모델 저축 목표 id <-> 서버 savingId
const String _savingIdPrefix = 'saving-';

String budgetTodoIdOf(int savingId) => '$_savingIdPrefix$savingId';

/// 저축 목표 id가 아니면(준비 항목 등) null
int? savingIdOf(String todoId) => todoId.startsWith(_savingIdPrefix)
    ? int.tryParse(todoId.substring(_savingIdPrefix.length))
    : null;

// 서버 -> UI 모양 변환

extension TravelGuideResponseDtoMapper on TravelGuideResponseDto {
  /// 조회 API는 이번 기간 하나만 주므로 periods에 이번 기간만 담음 (전체 기간은 타임라인 조회 후 MonthlyGuide.withTimeline으로 합침)
  /// - 이번 기간이 비어 있으면(이미 시작한 여행 등) MonthlyGuideNotProvidedException
  MonthlyGuide toMonthlyGuide(String planId) {
    final TravelGuidePeriodDto? current = period;
    if (current == null || current.hasNothingToPrepare) {
      throw const MonthlyGuideNotProvidedException();
    }

    return MonthlyGuide(
      planId: planId,
      daysLeft: dDay ?? 0,
      totalBudget: (totalCost ?? 0).round(),
      currentIndex: 0,
      periods: [
        current.toMonthlyGuidePeriod(
          remainingMonths: remainingMonths ?? 0,
          accumulatedSavingAmount: accumulatedSavingAmount,
          totalCost: totalCost,
          fallbackSavingAmount: monthlySavingAmount,
        ),
      ],
    );
  }
}

extension AllTimelineGuideResponseDtoMapper on AllTimelineGuideResponseDto {
  /// 전체 기간 (시간순)
  /// - 응답에 기간별 누적액, 남은 기간 수가 없어서 직접 계산
  /// - totalCost: 누적액 문구(N만원 / 총액)에 쓰는 총 예산 (월별 조회 응답 값)
  List<MonthlyGuidePeriod> toMonthlyGuidePeriods({required num totalCost}) {
    // 순서가 보장되지 않을 수 있어 시작일 기준 정렬 ("2026-11-22" 형식이라 문자열 비교로 충분)
    final List<TravelGuidePeriodDto> sorted = [...periods]
      ..sort((a, b) => (a.periodStart ?? '').compareTo(b.periodStart ?? ''));

    final List<MonthlyGuidePeriod> result = [];
    num accumulated = 0;
    for (final (i, period) in sorted.indexed) {
      accumulated += period.saving?.amount ?? 0;
      result.add(period.toMonthlyGuidePeriod(
        remainingMonths: sorted.length - i, // 이 기간 포함 남은 기간 수
        accumulatedSavingAmount: accumulated,
        totalCost: totalCost,
      ));
    }
    return result;
  }
}

extension TravelGuidePeriodDtoMapper on TravelGuidePeriodDto {
  /// 준비할 게 없는 기간: 저축 목표가 없고, 준비 항목이 없거나 전부 무료(0원, 화면에서 숨김)
  bool get hasNothingToPrepare =>
      saving == null && todos.every((todo) => todo.isFree);

  /// 기간 1개 -> 화면 모델 (월별 & 타임라인 공통)
  MonthlyGuidePeriod toMonthlyGuidePeriod({
    required int remainingMonths,
    required num? accumulatedSavingAmount,
    required num? totalCost,
    num? fallbackSavingAmount, // saving.amount가 없을 때 쓸 월 저축 목표
  }) {
    final DateTime? start = DateTime.tryParse(periodStart ?? '');
    final DateTime? end = DateTime.tryParse(periodEnd ?? '');
    if (start == null || end == null) {
      throw StateError('가이드 기간 날짜 형식 오류: $periodStart ~ $periodEnd');
    }

    final TravelGuideSavingDto? goal = saving;

    return MonthlyGuidePeriod(
      // 저축 목표가 없으면 마지막 자투리 기간 (lessThanMonth는 예산 목표를 숨김)
      type: goal == null ? MonthlyPeriodType.lessThanMonth : MonthlyPeriodType.regular,
      startDate: start,
      endDate: end,
      remainingMonths: remainingMonths,
      // 지난 기간에서 넘어온 준비 항목 (isCarriedOver: true)
      // 무료(0원) 항목은 준비할 게 없으므로 제외
      carryoverTodos: [
        for (final todo in todos)
          if (todo.isCarriedOver && !todo.isFree) todo.toMonthlyTodo(),
      ],
      budgetTodo: goal == null
          ? null
          : MonthlyTodo(
              id: budgetTodoIdOf(goal.savingId),
              type: MonthlyTodoType.budget,
              title: '${_man(goal.amount ?? fallbackSavingAmount)}만원 모으기',
              budgetStatus:
                  '${_man(accumulatedSavingAmount)}만원 / ${_man(totalCost)}만원',
              isCompleted: goal.isCompleted,
            ),
      reservationTodos: [
        for (final todo in todos)
          if (!todo.isCarriedOver && !todo.isFree) todo.toMonthlyTodo(),
      ],
    );
  }
}

extension TravelGuideTodoDtoMapper on TravelGuideTodoDto {
  /// 무료(0원) 항목: 준비할 게 없어서 월별 가이드에 노출하지 않음
  bool get isFree => cost == 0;

  MonthlyTodo toMonthlyTodo() => MonthlyTodo(
        id: todoIdOf(todoPeriodId),
        type: MonthlyTodoType.reservation,
        title: _title(),
        caption: _costCaption(cost),
        isCompleted: isCompleted,
      );

  /// 준비 항목 설명: '약 N만원 내외' / '1만원 이하' / '비용 알 수 없음'
  /// (0원은 목록에서 제외되므로 여기 오지 않음)
  static String _costCaption(num? cost) {
    if (cost == null || cost <= CostFormat.tenThousand) {
      return CostFormat.single(cost);
    }
    return '${CostFormat.single(cost)} 내외';
  }

  /// 준비 항목 제목
  /// - COURSE: content가 장소/활동 이름이라 그대로 사용
  /// - LODGING: content가 숙소 종류 코드(HOSTEL 등)라 '호스텔 예약' 형태로
  /// - FLIGHT: content가 없어서(null) 고정 문구
  String _title() => switch (detailType) {
        'LODGING' => '${_lodgingTypeLabel(content) ?? '숙소'} 예약',
        'FLIGHT' => '항공권 예매',
        _ => content ?? '',
      };
}

/// 숙소 종류 코드 → 표시 이름 (모르는 코드면 null)
String? _lodgingTypeLabel(String? type) => switch (type) {
      'HOTEL' => '호텔',
      'HOSTEL' => '호스텔',
      'RENTAL' => '펜션',
      'GUESTHOUSE' => '게스트하우스',
      'RESORT' => '리조트',
      'POOL_VILLA' => '풀빌라',
      _ => null,
    };

/// 원 -> 만원 (반올림)
int _man(num? won) => ((won ?? 0) / 10000).round();