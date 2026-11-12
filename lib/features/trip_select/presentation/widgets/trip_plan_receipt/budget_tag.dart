import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/data/models/budget_level.dart';

class BudgetTag extends StatelessWidget {
  const BudgetTag({
    super.key,
    required this.level,
  });

  final BudgetLevel level; // high, medium, low

  @override
  Widget build(BuildContext context) {
    final (String label, Color background, Color textColor) = switch (level) {
      BudgetLevel.high => ('고예산', AppColors.blue800, AppColors.white),
      BudgetLevel.medium => ('중예산', AppColors.blue500, AppColors.white),
      BudgetLevel.low => ('저예산', AppColors.blue100, AppColors.blue800),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      color: background,
      child: Text(
        label,
        style: AppTextStyles.labelSemiBold14.copyWith(color: textColor),
      ),
    );
  }
}