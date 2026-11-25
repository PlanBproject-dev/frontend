import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/data/models/budget_level.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_tags.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_receipt/budget_tag.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_receipt/receipt_palette.dart';
import 'package:plan_b/shared/widgets/btn/btn_check.dart';

/// 상단: 예산 태그 + btn_check / 총 예상 비용 / #태그 (열림 시 하단 실선)
class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({
    super.key,
    required this.plan,
    required this.budgetLevel,
    required this.isSelected,
    required this.isOpen,
    required this.palette,
    this.onSelectedChanged,
  });

  final TripPlan plan;
  final BudgetLevel budgetLevel;
  final bool isSelected;
  final bool isOpen;
  final ReceiptPalette palette;
  final ValueChanged<bool>? onSelectedChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: isOpen ? 24 : 0),
      decoration: isOpen
          ? BoxDecoration(
              border: Border(bottom: BorderSide(color: palette.base.summaryTitleBorder)),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 24,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BudgetTag(level: budgetLevel),
              // 선택은 btn_check 탭으로만 가능 (탭 영역 = 버튼 크기)
              BtnCheck(
                isSelected: isSelected,
                onChanged: onSelectedChanged,
                selectedColor: ReceiptPalette.checkSelected,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 4,
                children: [
                  Text(
                    '총 예상 비용 (인당)',
                    style: AppTextStyles.titleSemiBold16.copyWith(color: palette.totalLabel),
                  ),
                  Text(
                    plan.totalCost,
                    style: AppTextStyles.titleBold24.copyWith(color: palette.totalValue),
                  ),
                ],
              ),
              PlanTags(tags: plan.tags, color: palette.base.tag, runSpacing: 8),
            ],
          ),
        ],
      ),
    );
  }
}