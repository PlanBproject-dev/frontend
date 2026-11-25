import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/features/planner/data/models/planner_trip_plan.dart';
import 'package:plan_b/features/planner/presentation/widgets/my_trip_planner/planner_basic_info.dart';
import 'package:plan_b/features/planner/presentation/widgets/my_trip_planner/planner_highlights.dart';
import 'package:plan_b/features/planner/presentation/widgets/my_trip_planner/planner_title.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_card_palette.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_cost_section.dart';

/// 상단 흰 카드: 제목 / 기본 정보 / 주요 일정 / 숙소·항공 + 우측 상단 BEST PRICE 스티커
class PlannerCard extends StatelessWidget {
  const PlannerCard({
    super.key,
    required this.plan,
    required this.palette,
    required this.onCoursePressed,
  });

  final PlannerTripPlan plan;
  final PlanCardPalette palette;
  final VoidCallback onCoursePressed;

  static const double _radius = 32;
  static const String _stickerAsset = 'assets/graphics/graphic_price_sticker_lg.svg';

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: AppEffects.boxShadowSm,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Stack(
          children: [
            // 가격 스티커: 카드 우측 상단 기준 고정, 카드 밖은 잘림 (콘텐츠 뒤에 깔림)
            Positioned(
              top: -7,
              right: -41,
              child: IgnorePointer(
                child: SvgPicture.asset(_stickerAsset, width: 172, height: 172),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 28, 36, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 20,
                children: [
                  PlannerTitle(title: plan.title),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 16,
                    children: [
                      PlannerBasicInfo(plan: plan, palette: palette),
                      PlannerHighlights(
                        highlights: plan.highlights,
                        palette: palette,
                        onCoursePressed: onCoursePressed,
                      ),
                      // 숙소 / 항공 (하단 점선 없음)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 8,
                        children: [
                          PlanCostRow.labeled(label: '숙소', item: plan.accommodation, palette: palette),
                          PlanCostRow.labeled(label: '항공', item: plan.flight, palette: palette),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
