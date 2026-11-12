import 'package:flutter/material.dart';

import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_palette.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_cost_section.dart';

/// 열림: 주요 일정(하단 점선) + 숙소/항공
class ReceiptDetails extends StatelessWidget {
  const ReceiptDetails({
    super.key,
    required this.plan,
    required this.palette,
  });

  final TripPlan plan;
  final PlanCardPalette palette;

  @override
  Widget build(BuildContext context) {
    final p = palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 20,
      children: [
        // 주요 일정
        PlanDashedSection(
          color: p.dashed,
          spacing: 6,
          children: [
            for (final item in plan.highlights)
              PlanCostRow(
                leading: PlanBulletDot(asset: p.dotAsset),
                item: item,
                palette: p,
              ),
          ],
        ),

        // 숙소 / 항공 (영수증은 하단 점선 없음)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            PlanCostRow.labeled(label: '숙소', item: plan.accommodation, palette: p),
            PlanCostRow.labeled(label: '항공', item: plan.flight, palette: p),
          ],
        ),
      ],
    );
  }
}