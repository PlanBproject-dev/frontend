import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// "목표 누적" 라벨 + 누적 금액
/// - 월별 보기 / 전체 타임라인의 budget 항목 공용으로 사용.
class MonthlyBudgetStatus extends StatelessWidget {
  const MonthlyBudgetStatus({super.key, required this.status});

  final String status; // 예: "120만원 / 235만원"

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '목표 누적',
          style: AppTextStyles.captionMedium12.copyWith(
            color: AppColors.gray500,
          ),
        ),
        Text(
          status,
          style: AppTextStyles.captionMedium12.copyWith(
            color: AppColors.gray800,
          ),
        ),
      ],
    );
  }
}