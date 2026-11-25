// 나의 여행 플래너 로딩 스켈레톤

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/shared/widgets/divider/dashed_line.dart';
import 'package:plan_b/shared/widgets/feedback/skeleton/skeleton_box.dart';

class MyTripPlannerSkeleton extends StatelessWidget {
  const MyTripPlannerSkeleton({super.key});

  static const double _cardHeight = 496;
  static const double _costBarHeight = 72;
  static const BorderRadius _cardRadius = BorderRadius.all(Radius.circular(32));
  static const BorderRadius _costBarRadius =
      BorderRadius.vertical(top: Radius.circular(32));

  // PlannerTotalCostBar와 같은 drop-shadow (0, 2, blur 2, #000 10%)
  static const List<BoxShadow> _costBarShadow = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 상단 카드
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: _cardRadius,
            boxShadow: AppEffects.boxShadowSm,
          ),
          child: SkeletonBox(
            height: _cardHeight,
            color: AppColors.dimSurfaceLight,
            borderRadius: _cardRadius,
          ),
        ),

        // 하단 총 예상 비용 바
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: _costBarRadius,
            boxShadow: _costBarShadow,
          ),
          child: ClipRRect(
            borderRadius: _costBarRadius, // 점선 양 끝이 라운드 밖으로 보이지 않도록
            child: Stack(
              children: [
                SkeletonBox(
                  height: _costBarHeight,
                  color: AppColors.dimSurfaceLight,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: DashedLine(color: AppColors.gray200),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}