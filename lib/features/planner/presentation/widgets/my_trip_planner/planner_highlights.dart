import 'package:flutter/material.dart';

import 'package:plan_b/shared/models/trip_plan_cost_item.dart';
import 'package:plan_b/shared/widgets/btn/btn.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_card_palette.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_cost_section.dart';

/// 주요 일정 + '더 자세한 여행 코스 보기' 버튼 + 하단 점선
class PlannerHighlights extends StatelessWidget {
  const PlannerHighlights({
    super.key,
    required this.highlights,
    required this.palette,
    required this.onCoursePressed,
  });

  final List<TripPlanCostItem> highlights;
  final PlanCardPalette palette;
  final VoidCallback onCoursePressed; // 여행 코스 화면 이동

  @override
  Widget build(BuildContext context) {
    return PlanDashedSection(
      color: palette.dashed,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 6,
          children: [
            for (final item in highlights)
              PlanCostRow(
                leading: PlanBulletDot(asset: palette.dotAsset),
                item: item,
                palette: palette,
              ),
          ],
        ),
        Btn(
          text: '더 자세한 여행 코스 보기',
          iconPosition: BtnIconPosition.trailing,
          onPressed: onCoursePressed,
        ),
      ],
    );
  }
}
