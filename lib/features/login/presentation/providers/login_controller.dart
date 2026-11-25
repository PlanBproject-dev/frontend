import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/auth/auth_provider.dart';
import 'package:plan_b/features/login/data/kakao_login_service.dart';
import 'package:plan_b/features/login/data/google_login_service.dart';
import 'package:plan_b/features/login/data/login_repository.dart';
import 'package:plan_b/features/login/data/models/jwt_login_response.dart';

class LoginController {
  LoginController(this._ref);
  final Ref _ref;

  Future<void> loginWithKakao() async {
    final kakaoToken = await _ref.read(kakaoLoginServiceProvider).login();
    final res =
        await _ref.read(loginRepositoryProvider).loginWithKakao(kakaoToken);
    await _startSession(res);
  }

  Future<void> loginWithGoogle() async {
    final idToken = await _ref.read(googleLoginServiceProvider).login();
    final res =
        await _ref.read(loginRepositoryProvider).loginWithGoogle(idToken);
    await _startSession(res);
  }

  /// 토큰 저장 및 로그인 상태로 변경
  /// 로그인 상태가 되면 myProfileProvider가 /user/me로 유저 프로필을 조회함
  Future<void> _startSession(JwtLoginResponse res) async {
    await _ref.read(authProvider.notifier).signIn(
          accessToken: res.jwtAccessToken,
          refreshToken: res.jwtRefreshToken,
          isNewUser: res.newUser,
        );
  }

  /// 로그아웃: 소셜 SDK 로그아웃(실패해도 무시) > PlanB 로그아웃
  /// 어떤 방식으로 로그인했는지 저장하지 않으므로 둘 다 시도.
  Future<void> logout() async {
    await _logoutSocialSdks();
    await _ref.read(authProvider.notifier).logout();
  }

  /// 회원탈퇴: PlanB 서버 탈퇴 -> (성공 시) 소셜 SDK 로그아웃(실패해도 무시)
  Future<void> withdraw() async {
    await _ref.read(authProvider.notifier).withdraw();
    await _logoutSocialSdks();
  }

  /// 카카오/구글 SDK 로그아웃. 로그인하지 않은 쪽은 에러가 나므로 무시
  Future<void> _logoutSocialSdks() async {
    await Future.wait([
      _ignoreError(() => _ref.read(kakaoLoginServiceProvider).logout()),
      _ignoreError(() => _ref.read(googleLoginServiceProvider).logout()),
    ]);
  }

  static Future<void> _ignoreError(Future<void> Function() task) async {
    try {
      await task();
    } catch (_) {}
  }
}

final loginControllerProvider = Provider((ref) => LoginController(ref));