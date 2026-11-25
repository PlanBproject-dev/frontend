import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_b/features/login/data/kakao_login_service.dart';
import 'package:plan_b/features/login/data/google_login_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plan_b/features/login/presentation/providers/login_controller.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/login/presentation/widgets/cta_social_login.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/background/bg_top_gradient.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  static const double _logoWidth = 155;
  static const double _logoHeight = 60;
  static const double _logoToIntroGap = 33;   // 로고 ~ 소개 문구 간격
  static const double _introToCtaGap = 163;   // 소개 문구 ~ 로그인 버튼 간격
  static const double _ctaGap = 16;           // 로그인 버튼 사이 간격

  static const String _intro = '여행의 복잡한 과정은 줄여주는,\n'
      '당신만을 위한 여행 준비 파트너';

  bool _isLoading = false;

  Future<void> _login({
    required String label,                       // 로그용 ('카카오', '구글')
    required Future<void> Function() action,
    required bool Function(Object e) isCanceled,
  }) async {
    if (_isLoading) return; // 중복 탭 방지
    setState(() => _isLoading = true);

    try {
      await action();
      // 성공하면 라우터 가드가 홈/온보딩으로 이동시킴
    } catch (e, st) {
      if (isCanceled(e)) return; // 사용자가 직접 취소한 경우는 안내하지 않음

      debugPrint('$label 로그인 실패: $e\n$st');
      if (mounted) {
        showToast(
          context,
          text: '로그인에 실패했어요.\n잠시 후 다시 시도해 주세요.\n${_errorDetail(e)}',
          type: ToastType.warning,
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// 실패 원인 표시: 서버 에러면 상태 코드, SDK 에러면 에러 코드
  static String _errorDetail(Object e) {
    if (e is ApiException) {
      final status = e.statusCode?.toString() ?? '응답 없음';
      return '(서버 $status: ${e.message})';
    }
    if (e is PlatformException) return '(SDK ${e.code})';
    if (e is GoogleSignInException) return '(SDK ${e.code.name})';
    return '(${e.runtimeType})';
  }

  void _loginWithKakao() => _login(
        label: '카카오',
        action: ref.read(loginControllerProvider).loginWithKakao,
        isCanceled: KakaoLoginService.isCanceled,
      );

  void _loginWithGoogle() => _login(
        label: '구글',
        action: ref.read(loginControllerProvider).loginWithGoogle,
        isCanceled: GoogleLoginService.isCanceled,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSolidBasic,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 배경: 하단 ellipse + 상단 gradient
          const BgBottomEllipse(),
          const BgTopGradient(),

          // 콘텐츠: 피그마상 화면 전체(상태바 포함) 기준 세로 중앙 정렬. (화면이 낮으면 세로 스크롤 적용.)
          LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 로고 + 소개 문구
                        SvgPicture.asset(
                          'assets/logos/logo_planb_lg.svg',
                          width: _logoWidth,
                          height: _logoHeight,
                        ),
                        const SizedBox(height: _logoToIntroGap),
                        Text(
                          _intro,
                          style: AppTextStyles.titleMedium18
                              .copyWith(color: AppColors.gray500),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: _introToCtaGap),

                        // 소셜 로그인 버튼
                        Column(
                          spacing: _ctaGap,
                          children: [
                            CtaSocialLogin(
                              type: SocialLoginType.kakao,
                              onPressed: _isLoading ? null : _loginWithKakao,
                            ),
                            CtaSocialLogin(
                              type: SocialLoginType.google,
                              onPressed: _isLoading ? null : _loginWithGoogle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}