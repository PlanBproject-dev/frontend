import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_palette.dart';
import 'package:plan_b/shared/widgets/btn/btn_check.dart';

/// 티켓의 헤더
class TicketHeader extends StatelessWidget {
  const TicketHeader({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.palette,
    this.onSelectedChanged,
  });

  final TripPlan plan;
  final bool isSelected;
  final PlanCardPalette palette;
  final ValueChanged<bool>? onSelectedChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: palette.headerBg,
      padding: const EdgeInsets.fromLTRB(24, 14, 16, 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              color: palette.badgeBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'TOP ${plan.rank}',
              style: AppTextStyles.labelMedium16.copyWith(color: palette.badgeText),
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              plan.country,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.titleSemiBold20.copyWith(color: palette.country),
            ),
          ),
          // 선택은 btn_check 탭으로만 가능 (탭 영역 = 버튼 크기)
          BtnCheck(isSelected: isSelected, onChanged: onSelectedChanged),
        ],
      ),
    );
  }
}