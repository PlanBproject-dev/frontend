// POST /api/v1/plans/goal, PATCH /api/v1/plans/goal/{planId} 요청 바디

import 'package:plan_b/features/trip_check/data/models/dto/common_travel_plan_dto.dart';
import 'package:plan_b/features/trip_check/data/models/options/meal_budget.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/shared/models/destination.dart';

class GoalPlanRequestDto {
  const GoalPlanRequestDto({required this.draft, required this.isDraft});

  final TripCheckDraft draft;
  final bool isDraft; // true: 임시저장, false: 최종 제출

  Map<String, dynamic> toJson() {
    final destination = draft.destination;
    final mealBudget = draft.mealBudget;

    return {
      'common': CommonTravelPlanDto(draft: draft, isDraft: isDraft).toJson(),
      if (destination != null) 'destination': _destination(destination),
      if (mealBudget != null) 'foodBudgetRange': _foodBudgetRange(mealBudget),
    };
  }

  /// 1인당 한 끼 식비 구간
  static String _foodBudgetRange(MealBudget budget) => switch (budget) {
        MealBudget.upTo10k => 'UNDER_1',
        MealBudget.upTo30k => 'UNDER_3',
        MealBudget.upTo50k => 'UNDER_5',
        MealBudget.upTo100k => 'UNDER_10',
        MealBudget.over100k => 'OVER_10',
      };

  /// 서버 여행지 enum (nhaTrang -> NHA_TRANG)
  /// Destination의 @JsonEnum(fieldRename: screamingSnake)와 같은 규칙
  static String _destination(Destination destination) => destination.name
      .replaceAllMapped(RegExp('[A-Z]'), (m) => '_${m[0]}')
      .toUpperCase();
}