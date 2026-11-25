// 맞춤 여행 체크 플로우 전체가 공유하는 입력 상태
// - 초기화: 인트로(TripCheckPage)에서 시작 버튼을 누를 때 reset() 호출한다

import 'package:flutter/material.dart' show DateTimeRange;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/auth/auth_provider.dart';
import 'package:plan_b/features/trip_check/data/models/dto/wallet_plan_request_dto.dart';
import 'package:plan_b/features/trip_check/data/models/dto/goal_plan_request_dto.dart';
import 'package:plan_b/features/trip_check/data/repositories/trip_check_repository.dart';

import 'package:plan_b/shared/models/destination.dart';
import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/data/models/options/companion_type.dart';
import 'package:plan_b/features/trip_check/data/models/options/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/options/travel_style.dart';
import 'package:plan_b/features/trip_check/data/models/options/accommodation_type.dart';
import 'package:plan_b/features/trip_check/data/models/options/flight_preference.dart';
import 'package:plan_b/features/trip_check/data/models/options/meal_budget.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/segmented_chip.dart';

class TripCheckDraftNotifier extends Notifier<TripCheckDraft> {
  // 저장 요청 대기열: 앞 요청이 끝나야 다음 요청 시작 (화면이 바뀌어도 유지됨)
  Future<void> _saveQueue = Future<void>.value();

  // 플로우 번호: 새 플로우가 시작되면 증가 -> 이전 플로우의 늦은 응답은 반영하지 않는다
  int _flowId = 0;

  // true면 다음 저장 때 기존 planId를 수정하지 않고 새 플랜을 생성한다(POST)
  // 서버는 최종 제출된 플랜의 수정을 막고 있어서(404 '임시 저장된 계획이 아닙니다' 라고 뜬다), 여행 고르기에서 조건을 다시 선택할 때 사용함.
  bool _createNewPlan = false;

  // 마지막으로 최종 제출(isDraft: false)에 성공한 입력값 (planId 포함)
  // - null이 아니면 지금 planId는 최종 제출된 플랜이라 수정(PATCH)할 수 없음
  //   - 입력값이 그대로면: 저장 요청 생략 (추천 생성 재시도 시 저장 성공 상태 유지)
  //   - 입력값이 바뀌었으면: 새 플랜 생성(POST)
  TripCheckDraft? _submittedDraft;

  /// 여행 고르기 -> '여행 조건 다시 선택'
  /// 입력값은 그대로 두고, 다음 저장부터 새 플랜으로 생성한다
  void startReselect() => _createNewPlan = true;

  /// 새 플로우 시작: 이전 플로우의 늦은 응답 무시 + 저장 관련 상태 초기화
  void _startNewFlow() {
    _flowId++;
    _createNewPlan = false;
    _submittedDraft = null;
  }

  @override
  TripCheckDraft build() {
    // 로그아웃/다른 계정 로그인 시 이전 계정의 입력값이 남지 않도록 초기화
    ref.watch(authProvider.select((auth) => auth.isLoggedIn));
    _startNewFlow(); // 이전 플로우의 늦은 저장 응답도 무시됨
    return const TripCheckDraft();
  }

  /// 플로우 시작 시 전체 초기화
  void reset() {
    _startNewFlow();
    state = const TripCheckDraft();
  }

  /// 저장된 조건으로 복원 (플래너 '여행 플랜 다시 선택하기' -> 여행 고르기 재진입)
  void restore(TripCheckDraft draft) {
    _startNewFlow();
    state = draft;
  }

  /// Step 1: 여행 계획 기준 선택
  /// 기준이 바뀌면 이후 단계 입력은 다른 플로우 값이므로 함께 초기화
  void selectTripType(TripSelectionType type) {
    if (state.tripType == type) return;
    _startNewFlow();
    state = TripCheckDraft(tripType: type);
  }

  // 기본 정보

  // 여행지: 목표 기준 플로우에서만 사용
  void setDestination(Destination destination) =>
      state = state.copyWith(destination: destination);

  void setTravelPeriod(DateTimeRange period) =>
      state = state.copyWith(travelPeriod: period);

  void setPeopleCount(int? count) =>
      state = state.copyWith(peopleCount: count);

  /// null이면 선택 해제
  void setCompanionType(CompanionType? type) =>
      state = state.copyWith(companionType: type);

  // 지갑 기준 플로우
  void setMaxBudget(BudgetRange budget) =>
      state = state.copyWith(maxBudget: budget);

  /// 지갑 기준 플랜 저장
  /// - planId 없음 -> 생성(POST) / 있음 -> 수정(PATCH)
  /// - 최종 제출된 플랜: 입력값이 그대로면 요청 생략, 바뀌었으면 새 플랜 생성
  /// - isDraft: true -> 단계별 임시저장 / false -> 최종 제출
  /// - 실패 시 ApiException을 그대로 던짐 (화면에서 처리)
  Future<void> saveWalletPlan({required bool isDraft}) {
    return _enqueueSave(isDraft: isDraft, (planId) async {
      final repository = ref.read(tripCheckRepositoryProvider);
      final request = WalletPlanRequestDto(draft: state, isDraft: isDraft);
      final res = planId == null
          ? await repository.createWalletPlan(request)
          : await repository.updateWalletPlan(planId, request);
      return res.planId;
    });
  }

  /// 목표 기준 플랜 저장 (동작은 saveWalletPlan과 같음)
  Future<void> saveGoalPlan({required bool isDraft}) {
    return _enqueueSave(isDraft: isDraft, (planId) async {
      final repository = ref.read(tripCheckRepositoryProvider);
      final request = GoalPlanRequestDto(draft: state, isDraft: isDraft);
      final res = planId == null
          ? await repository.createGoalPlan(request)
          : await repository.updateGoalPlan(planId, request);
      return res.planId;
    });
  }

  /// 저장 요청을 대기열에 넣어 한 번에 하나씩 순서대로 처리 (지갑/목표 공통)
  Future<void> _enqueueSave(
    Future<int> Function(int? planId) send, {
    required bool isDraft,
  }) {
    final flowId = _flowId;
    final run = _saveQueue.then((_) async {
      if (flowId != _flowId) return;

      final submitted = _submittedDraft;

      // 최종 제출된 뒤로 입력값이 그대로면 다시 보낼 필요 없음
      // (예: 추천 생성만 실패해서 분석을 다시 시도 -> 저장 성공 상태를 유지하고 추천만 다시 요청)
      if (!_createNewPlan && submitted != null && submitted == state) return;

      // 새 플랜 생성(POST)
      // - 여행 고르기에서 조건을 다시 선택한 경우
      // - 최종 제출된 플랜의 입력값이 바뀐 경우 (최종 제출된 플랜은 수정 불가)
      final createNew = _createNewPlan || submitted != null;

      final sent = state; // 이번 요청에 실린 입력값
      final planId = await send(createNew ? null : sent.planId);
      if (flowId != _flowId) return;

      // 저장 성공: 새 플랜 생성 완료(실패하면 플래그가 남아 다음 저장 때 다시 생성 시도)
      _createNewPlan = false;
      // 최종 제출이면 보낸 입력값을 기억, 임시저장이면 아직 수정 가능한 플랜
      _submittedDraft = isDraft ? null : sent.copyWith(planId: planId);

      // 요청 중 사용자가 값을 바꿨을 수 있으니 현재 state에 planId만 반영
      state = state.copyWith(planId: planId);
    });
    // 앞 요청이 실패해도 다음 요청은 진행되도록 대기열에는 에러를 남기지 않음
    _saveQueue = run.catchError((Object _) {});
    return run;
  }

  // 목표 기준 플로우
  void setMealBudget(MealBudget budget) =>
      state = state.copyWith(mealBudget: budget);

  // 세부 취향

  /// 여행 스타일 선택/해제
  /// 최대 개수를 넘겨 새로 선택하려 하면 바꾸지 않고 false 반환
  bool toggleTravelStyle(TravelStyle style) {
    final current = state.travelStyles;
    if (current.contains(style)) {
      state = state.copyWith(travelStyles: {...current}..remove(style));
      return true;
    }
    if (current.length >= TravelStyle.maxSelection) return false;
    state = state.copyWith(travelStyles: {...current, style});
    return true;
  }

  /// 숙소 유형 선택/해제
  /// 최대 개수를 넘겨 새로 선택하려 하면 바꾸지 않고 false 반환
  bool toggleAccommodationType(AccommodationType type) {
    final current = state.accommodationTypes;
    if (current.contains(type)) {
      state = state.copyWith(accommodationTypes: {...current}..remove(type));
      return true;
    }
    if (current.length >= AccommodationType.maxSelection) return false;
    state = state.copyWith(accommodationTypes: {...current, type});
    return true;
  }

  /// 항공권 유형: 항목별로 왼쪽/오른쪽 선택
  void setFlightPreference(FlightPreference preference, SegmentedChipSide side) =>
      state = state.copyWith(
        flightPreferences: {...state.flightPreferences, preference: side},
      );
}

final tripCheckDraftProvider =
    NotifierProvider<TripCheckDraftNotifier, TripCheckDraft>(
  TripCheckDraftNotifier.new,
);