// 텍스트 + 하단 밑줄로 구성된 보조 텍스트 버튼

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class BtnTextSecondary extends StatelessWidget {
  const BtnTextSecondary({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;              // 버튼 텍스트 (예: '여행 플랜 다시 선택하기')
  final VoidCallback? onPressed;  // 탭 콜백

  @override
  Widget build(BuildContext context) {
    const Color color = AppColors.gray300;

    return Semantics(
      button: true,
      enabled: onPressed != null, // onPressed가 null이면 비활성 버튼으로 읽힘
      label: text,
      onTap: onPressed, // excludeSemantics로 자식(GestureDetector)의 탭 동작이 빠지므로 직접 지정
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.only(bottom: 2), // 텍스트 <-> 밑줄 간격 2
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: color, width: 1), // 하단 밑줄 1px
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.labelMedium14.copyWith(color: color),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}