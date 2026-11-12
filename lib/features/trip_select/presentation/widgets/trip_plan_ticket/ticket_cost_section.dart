import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/ticket_palette.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/dashed_line.dart';

/// 항목명 + 비용 한 줄 (항목명이 길면 줄바꿈, 비용은 첫 줄에 고정)
class TicketCostRow extends StatelessWidget {
  const TicketCostRow({
    super.key,
    required this.leading,
    required this.item,
    required this.palette,
  });

  TicketCostRow.labeled({
    super.key,
    required String label,
    required this.item,
    required this.palette,
  }) : leading = Text(
          label,
          style: AppTextStyles.bodyMedium16.copyWith(color: palette.itemLabel),
        );

  final Widget leading;
  final TripPlanCostItem item;
  final TicketPalette palette;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading,
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            item.title,
            style: AppTextStyles.bodyMedium16.copyWith(color: palette.itemTitle),
          ),
        ),
        const SizedBox(width: 6),
        SizedBox(
          height: 24,
          child: Center(
            child: Text(
              item.cost,
              textAlign: TextAlign.right,
              style: AppTextStyles.bodyMedium14.copyWith(color: palette.itemCost),
            ),
          ),
        ),
      ],
    );
  }
}

/// 주요 일정 앞의 점
class TicketBulletDot extends StatelessWidget {
  const TicketBulletDot({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 24,
      child: Center(
        child: SvgPicture.asset(asset, width: 8, height: 8),
      ),
    );
  }
}

/// 하단에 점선이 있는 섹션
class TicketDashedSection extends StatelessWidget {
  const TicketDashedSection({
    super.key,
    required this.color,
    required this.spacing,
    required this.children,
  });

  final Color color;
  final double spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: spacing,
          children: children,
        ),
        const SizedBox(height: 20),
        DashedLine(color: color),
      ],
    );
  }
}