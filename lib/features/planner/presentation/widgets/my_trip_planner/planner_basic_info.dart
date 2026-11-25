import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/planner/data/models/planner_trip_plan.dart';
import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_card_palette.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_cost_section.dart';

/// 여행 기본 정보: 시기 / 인원 / (지갑 기준: 예산, 여행 목표 기준: 식사) + 하단 점선
class PlannerBasicInfo extends StatelessWidget {
  const PlannerBasicInfo({
    super.key,
    required this.plan,
    required this.palette,
  });

  final PlannerTripPlan plan;
  final PlanCardPalette palette;

  @override
  Widget build(BuildContext context) {
    final String conditionLabel = switch (plan.tripType) {
      TripSelectionType.budget => '예산',
      TripSelectionType.goal => '식사',
    };

    return PlanDashedSection(
      color: palette.dashed,
      spacing: 2,
      bottomGap: 16,
      children: [
        _InfoRow(label: '시기', value: plan.period),
        _InfoRow(label: '인원', value: plan.people),
        _InfoRow(label: conditionLabel, value: plan.condition),
      ],
    );
  }
}

/// 라벨 + 값 한 줄 (값이 길면 줄바꿈)
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium14.copyWith(color: AppColors.gray400),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium14.copyWith(color: AppColors.gray700),
          ),
        ),
      ],
    );
  }
}
