import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/shared/widgets/divider/dashed_line.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_card_palette.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_cost_section.dart';

/// 하단 총 예상 비용 바 (상단 라운드 32 + 상단 점선)
class PlannerTotalCostBar extends StatelessWidget {
  const PlannerTotalCostBar({
    super.key,
    required this.totalCost,
    required this.palette,
  });

  final String totalCost;
  final PlanCardPalette palette;

  static const BorderRadius _radius = BorderRadius.vertical(top: Radius.circular(32));

  // Figma의 drop-shadow (0, 2, blur 2, #000 10%): 토큰에 없는 값이라 여기서만 정의
  static const List<BoxShadow> _shadow = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(borderRadius: _radius, boxShadow: _shadow),
      child: ClipRRect(
        borderRadius: _radius,
        child: ColoredBox(
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DashedLine(color: palette.dashed),
              Padding(
                padding: const EdgeInsets.all(24),
                child: PlanTotalCostRow(totalCost: totalCost, palette: palette),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
