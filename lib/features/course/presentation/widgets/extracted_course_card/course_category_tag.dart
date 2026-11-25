// 추출된 코스 정보 카드에 들어갈 코스 카테고리 태그

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/course/data/models/course_category.dart';

class CourseCategoryTag extends StatelessWidget {
  const CourseCategoryTag({
    super.key,
    required this.category,
  });

  final CourseCategory category;

  static const double _radius = 4;
  static const double _paddingH = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: _paddingH),
      decoration: BoxDecoration(
        color: AppColors.blue50,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Text(
        category.label,
        style: AppTextStyles.labelSemiBold16.copyWith(color: AppColors.gray600),
        maxLines: 1,
      ),
    );
  }
}