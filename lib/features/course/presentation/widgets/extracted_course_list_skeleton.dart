// 코스 정보 추출 화면) 추출된 코스 카드 목록 로딩 스켈레톤

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/shared/widgets/feedback/skeleton/skeleton_box.dart';

class ExtractedCourseListSkeleton extends StatelessWidget {
  const ExtractedCourseListSkeleton({super.key});

  static const int _count = 3;  // 스켈레톤 카드 3개 표시
  static const double _cardHeight = 192;
  static const BorderRadius _radius = BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16, // 카드 사이 간격 (ExtractedCourseList와 동일)
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