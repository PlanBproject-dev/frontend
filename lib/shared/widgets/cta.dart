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
    this.isExpanded = true,
  });

  final String text;  // cta 버튼 텍스트
  final VoidCallback? onPressed;  // 탭 콜백 (isActive가 false면 호출되지 않음)
  final CtaVariant variant; // primary, secondary
  final bool isActive;  // 활성화, 비활성화 여부
  final bool isExpanded;  // true: 부모 너비를 꽉 채움 / false: 텍스트 너비 + 좌우 패딩만큼만 차지

  @override
  Widget build(BuildContext context) {
    final (
      Color background,
      BorderSide border,
      TextStyle textStyle,
    ) = switch ((variant, isActive)) {
        (CtaVariant.primary, true) => (
          AppColors.blue800,
          BorderSide.none,
          AppTextStyles.labelSemiBold16.copyWith(color: AppColors.white),
          ),
        (CtaVariant.secondary, true) => (
          AppColors.white,
          const BorderSide(color: AppColors.gray100),
          AppTextStyles.labelRegular16.copyWith(color: AppColors.gray500),
          ),
        // isActive=false인 경우: primary와 secondary 모두 동일한 비활성 스타일 적용
        (_, false) => (
          AppColors.gray50,
          BorderSide.none,
          AppTextStyles.labelRegular16.copyWith(color: AppColors.gray200),
          ),
      };

      return SizedBox(
        width: isExpanded ? double.infinity : null, // true: 부모 너비를 꽉 채움 / false: 텍스트 너비 + 좌우 패딩만큼만 차지
        height: 54, // 고정값 54

        child: Material(
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: border,
          ),

          // cta 탭할 경우 나타나는 물결 효과가 둥근 모서리 밖으로 안 나가게 자름
          clipBehavior: Clip.antiAlias,

          // 탭을 감지하고 물결을 그림
          child: InkWell(
            onTap: isActive ? onPressed : null, // isActive가 false면 onPressed 호출되지 않음
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
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
        ),
      );
  }
}