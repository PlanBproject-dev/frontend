// 여행까지 남은 날짜를 표시하는 태그
// - 남은 일수에 따라 D-n / D-Day / D+n 으로 표시

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class DDayTag extends StatelessWidget {
  const DDayTag({
    super.key,
    required this.daysLeft,
  });

  final int daysLeft; // 여행 시작일까지 남은 일수 (0: 당일, 음수: 지난 날)

  String get _label {
    if (daysLeft > 0) return 'D-$daysLeft';   // 여행 시작일 되기 전
    if (daysLeft == 0) return 'D-Day';        // 여행 시작 당일
    return 'D+${-daysLeft}';                  // 여행 시작일 지난 후
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.blue100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        _label,
        style: AppTextStyles.labelMedium14.copyWith(color: AppColors.blue800),
        maxLines: 1,
      ),
    );
  }
}