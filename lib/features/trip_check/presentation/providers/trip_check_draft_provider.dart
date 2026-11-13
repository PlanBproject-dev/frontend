// 맞춤 여행 체크 플로우 전체가 공유하는 입력 상태
// - 초기화: 인트로(TripCheckPage) 진입 시 reset() 호출한다

import 'package:flutter/material.dart' show DateTimeRange;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/data/models/companion_type.dart';
import 'package:plan_b/features/trip_check/data/models/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/travel_style.dart';
import 'package:plan_b/features/trip_check/data/models/accommodation_type.dart';
import 'package:plan_b/features/trip_check/data/models/flight_preference.dart';
import 'package:plan_b/features/trip_check/data/models/meal_budget.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/segmented_chip.dart';

class TripCheckDraftNotifier extends Notifier<TripCheckDraft> {
  @override
  TripCheckDraft build() => const TripCheckDraft();

  /// 플로우 시작 시 전체 초기화
  void reset() => state = const TripCheckDraft();

  /// Step 1: 여행 계획 기준 선택
  /// 기준이 바뀌면 이후 단계 입력은 다른 플로우 값이므로 함께 초기화
  void selectTripType(TripSelectionType type) {
    if (state.tripType == type) return;
    state = TripCheckDraft(tripType: type);
  }

  // 기본 정보

  // 여행지: 목표 기준 플로우에서만 사용
  void setDestination(String destination) =>
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