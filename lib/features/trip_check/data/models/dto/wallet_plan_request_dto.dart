// POST /api/v1/plans/wallet, PATCH /api/v1/plans/wallet/{planId} 요청 바디

import 'package:plan_b/features/trip_check/data/models/options/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/dto/common_travel_plan_dto.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';

class WalletPlanRequestDto {
  const WalletPlanRequestDto({required this.draft, required this.isDraft});

  final TripCheckDraft draft;
  final bool isDraft; // true: 임시저장, false: 최종 제출

  Map<String, dynamic> toJson() {
    final budget = draft.maxBudget;

    return {
      'common': CommonTravelPlanDto(
        draft: draft,
        isDraft: isDraft,
      ).toJson(),
      if (budget != null) 'budgetRange': _budget(budget),
    };
  }

  static String _budget(BudgetRange budget) => switch (budget) {
        BudgetRange.upTo100 => 'UNDER_100',
        BudgetRange.upTo200 => 'UNDER_200',
        BudgetRange.upTo300 => 'UNDER_300',
        BudgetRange.upTo400 => 'UNDER_400',
        BudgetRange.over400 => 'OVER_400',
      };
}