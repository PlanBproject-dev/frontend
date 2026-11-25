// 나의 여행 코스: 일일 코스 카드 목록 로딩 스켈레톤

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/shared/widgets/feedback/skeleton/skeleton_box.dart';

class MyCourseListSkeleton extends StatelessWidget {
  const MyCourseListSkeleton({super.key});

  static const int _count = 4;  // 스켈레톤 카드 4개
  static const double _cardHeight = 134;
  static const BorderRadius _radius = BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12, // 카드 사이 간격 (MyCourseList와 동일)
      children: [
        for (int i = 0; i < _count; i++)
          const SkeletonBox(
            height: _cardHeight,
            color: AppColors.dimSurfaceLight,
            borderRadius: _radius,
          ),
      ],
    );
  }
}