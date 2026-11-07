import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

enum CtaVariant {
  primary,
  secondary,
}

class Cta extends StatelessWidget {
  // 생성자
  const Cta({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = CtaVariant.primary,
    this.isActive = true,
  });

  final String text;
  final VoidCallback? onPressed; // 탭 콜백 (isActive가 false면 호출되지 않음)
  final CtaVariant variant;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final (Color background, BorderSide border, TextStyle textStyle) = 
      switch ((variant, isActive)) {
        (CtaVariant.primary, true) => (
          AppColors.blue800,
          BorderSide.none,
          AppTextStyles.labelSemiBold16.copyWith(color: AppColors.white),
          ),
        (CtaVariant.secondary, true) => (
          AppColors.white,
          const BorderSide(color: AppColors.gray100),
          AppTextStyles.labelSemiBold16.copyWith(color: AppColors.gray500),
          ),
        // isActive=false인 경우: primary와 secondary 모두 동일한 비활성 스타일 적용
        (_, false) => (
          AppColors.gray50,
          BorderSide.none,
          AppTextStyles.labelRegular16.copyWith(color: AppColors.gray200),
          ),
      };

      return SizedBox(
        width: double.infinity,
        height: 54,
        child: Material(
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: border,
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: isActive ? onPressed : null, // isActive가 false면 onPressed 호출되지 않음
            child: Center(
              child: Text(
                text,
                style: textStyle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
  }
}