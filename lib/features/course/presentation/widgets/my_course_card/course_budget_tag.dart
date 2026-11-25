import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 일일 코스 카드 하단 '예상 비용' 태그
class CourseBudgetTag extends StatelessWidget {
  const CourseBudgetTag({
    super.key,
    required this.text,
    this.isHighlighted = false,
  });

  final String text;
  final bool isHighlighted;

  static const double _radius = 4;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.blue50 : AppColors.gray50,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          text,
          style: AppTextStyles.labelMedium14.copyWith(
            color: isHighlighted ? AppColors.gray700 : AppColors.gray600,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}