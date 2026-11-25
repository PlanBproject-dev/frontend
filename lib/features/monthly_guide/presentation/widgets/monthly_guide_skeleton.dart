// 월별 여행 준비 가이드 로딩 스켈레톤

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_card.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_card_frame.dart';
import 'package:plan_b/shared/widgets/feedback/skeleton/skeleton_box.dart';

class MonthlyGuideSkeleton extends StatelessWidget {
  const MonthlyGuideSkeleton({super.key});

  static const double _summaryBoxWidth = 140;
  static const double _summaryBoxHeight = 78;
  static const BorderRadius _summaryRadius = BorderRadius.all(Radius.circular(24));
  static const double _cardRadius = 100;
  static const double _cardBorderWidth = 32; // MonthlyTodoCardFrame 바깥 테두리 두께

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 12, // 요약 ~ 카드 간격 (MonthlyMonthView와 동일)
      children: [
        // 요약 박스 2개 (MonthlyGuideSummary와 같은 배치: 좁은 화면에서는 반씩 나눠 줄어듦)
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            Flexible(
              child: SkeletonBox(
                width: _summaryBoxWidth,
                height: _summaryBoxHeight,
                color: AppColors.dimSurfaceLight,
                borderRadius: _summaryRadius,
              ),
            ),
            Flexible(
              child: SkeletonBox(
                width: _summaryBoxWidth,
                height: _summaryBoxHeight,
                color: AppColors.dimSurfaceLight,
                borderRadius: _summaryRadius,
              ),
            ),
          ],
        ),

        // 월별 카드: 배경은 카드 전체, shimmer는 테두리 안쪽에서만
        SizedBox(
          width: double.infinity,
          height: MonthlyTodoCard.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              SkeletonBox(
                borderRadius: BorderRadius.all(Radius.circular(_cardRadius)),
                shimmerPadding: EdgeInsets.all(_cardBorderWidth),
                // 테두리 안쪽 라운드
                shimmerBorderRadius: BorderRadius.all(
                  Radius.circular(_cardRadius - _cardBorderWidth),
                ),
              ),
              MonthlyTodoCardFrame(radius: _cardRadius),
            ],
          ),
        ),
      ],
    );
  }
}