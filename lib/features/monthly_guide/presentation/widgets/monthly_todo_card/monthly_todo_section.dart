import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 카드 안의 섹션: 섹션 제목 + 할 일 항목 목록
class MonthlyTodoSection extends StatelessWidget {
  const MonthlyTodoSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<Widget> items; // MonthlyViewItem 목록

  static const double _gap = 6; // 제목~항목, 항목~항목 간격 동일

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _gap,
      children: [
        Text(
          title,
          style: AppTextStyles.labelSemiBold14.copyWith(
            color: AppColors.white,
          ),
        ),
        ...items,
      ],
    );
  }
}