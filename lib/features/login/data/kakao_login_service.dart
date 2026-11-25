import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginService {
  /// 카카오 로그인 후 카카오 액세스 토큰 반환
  Future<String> login() async {
    final token = await _loginWithTalkOrAccount();
    return token.accessToken;
  }

  /// 카카오 SDK 토큰 삭제 (다음 로그인 때 다시 인증)
  Future<void> logout() async {
    await UserApi.instance.logout();
  }

  Future<OAuthToken> _loginWithTalkOrAccount() async {
    if (await isKakaoTalkInstalled()) {
      try {
        return await UserApi.instance.loginWithKakaoTalk();
      } catch (e) {
        // 사용자가 직접 취소했으면 계정 로그인으로 넘어가지 않고 중단
        if (isCanceled(e)) rethrow;
        // 카카오톡에 연결된 계정이 없는 경우 등 -> 카카오계정 로그인으로 시도
      }
    }
    return UserApi.instance.loginWithKakaoAccount();
  }

  /// 사용자가 로그인을 취소했는지 (취소는 에러 메시지를 띄우지 않기 위해)
  static bool isCanceled(Object e) => e is PlatformException && e.code == 'CANCELED';
}

final kakaoLoginServiceProvider = Provider((ref) => KakaoLoginService());