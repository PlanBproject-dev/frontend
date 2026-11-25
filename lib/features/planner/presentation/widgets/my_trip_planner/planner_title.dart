import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 여행 플랜 제목 (하단 실선)
class PlannerTitle extends StatelessWidget {
  const PlannerTitle({super.key, required this.title});

  final String title; // 일본 8월 여행 플랜

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray200)),
      ),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.titleSemiBold22.copyWith(color: AppColors.blue900),
      ),
    );
  }
}
