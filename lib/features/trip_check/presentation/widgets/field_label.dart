import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 맞춤 여행 체크 입력 필드 라벨
/// - 맞춤 여행 체크 플로우의 입력 화면들에서 공통으로 사용
class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key, this.caption});

  final String text;
  final String? caption;  // null이면 라벨만 표시

  @override
  Widget build(BuildContext context) {
    final label = Text(
      text,
      style: AppTextStyles.bodySemiBold16.copyWith(color: AppColors.blue700),
    );

    if (caption == null) return label;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        label,
        Text(
          caption!,
          style: AppTextStyles.captionMedium14.copyWith(color: AppColors.gray400),
        ),
      ],
    );
  }
}