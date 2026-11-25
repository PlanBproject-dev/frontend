import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 카드 상단: 기간 날짜 + 타이틀
class MonthlyTodoCardHeader extends StatelessWidget {
  const MonthlyTodoCardHeader({
    super.key,
    required this.dateRange,
    required this.title,
  });

  final String dateRange; // 예: "2026.05.06. ~ 2026.06.05."
  final String title;     // 예: "여행까지 3개월 남았어요"

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        Text(
          dateRange,
          textAlign: TextAlign.center,
          style: AppTextStyles.labelSemiBold16.copyWith(
            color: AppColors.blue100,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.titleBold22.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}