import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 맞춤 여행 체크 입력 필드 라벨
/// - 맞춤 여행 체크 플로우의 입력 화면들에서 공통으로 사용
class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key, this.caption});

  final String text;
  final String? caption;  // null이면 라벨만 표시

  static const double _gap = 8;     // 라벨 ~ 안내 문구 최소 가로 간격
  static const double _runGap = 4;  // 안내 문구가 다음 줄로 내려갔을 때 세로 간격

  @override
  Widget build(BuildContext context) {
    final label = Text(
      text,
      style: AppTextStyles.bodySemiBold16.copyWith(color: AppColors.blue700),
    );

    if (caption == null) return label;

    return Wrap(
      alignment: WrapAlignment.spaceBetween,      // 한 줄일 때: 라벨 왼쪽 끝 / 안내 문구 오른쪽 끝
      crossAxisAlignment: WrapCrossAlignment.center, // 높이가 다른 두 텍스트를 세로 가운데 정렬
      spacing: _gap,
      runSpacing: _runGap,
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