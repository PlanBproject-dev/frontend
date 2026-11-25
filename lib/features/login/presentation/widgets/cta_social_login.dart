import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

enum SocialLoginType {
  kakao,
  google,
}

class CtaSocialLogin extends StatelessWidget {
  const CtaSocialLogin({
    super.key,
    required this.type,
    required this.onPressed,
  });

  final SocialLoginType type;       // kakao, google
  final VoidCallback? onPressed;    // 탭 콜백

  // 카카오 브랜드 컬러 (디자인 시스템 토큰에 없는 값. 이 위젯 내부에서만 사용)
  static const Color _kakaoYellow = Color(0xFFFFEB00);

  @override
  Widget build(BuildContext context) {
    final (Color background, BorderSide border, String logoPath, String text) = switch (type) {
      SocialLoginType.kakao => (
          _kakaoYellow,
          BorderSide.none,
          'assets/logos/logo_kakao_talk_32px.svg',
          '카카오톡으로 로그인',
        ),
      SocialLoginType.google => (
          AppColors.white,
          const BorderSide(color: AppColors.gray100),
          'assets/logos/logo_google_32px.svg',
          'Google로 로그인',
        ),
    };

    return SizedBox(
      width: double.infinity,
      height: 54,

      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: border,
        ),
        // 탭할 때 나타나는 물결 효과가 둥근 모서리 밖으로 안 나가게
        clipBehavior: Clip.antiAlias,

        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            // 로고는 왼쪽 고정, 텍스트는 버튼 전체 기준 가운데 정렬
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(logoPath, width: 32, height: 32),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Text(
                    text,
                    style: AppTextStyles.labelSemiBold16.copyWith(
                      color: AppColors.black,
                      fontFeatures: const [FontFeature('case')], // 피그마의 "case" 1
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}