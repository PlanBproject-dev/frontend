import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginService {
  /// 구글 로그인 후 구글 ID 토큰 반환 (서버가 검증해서 PlanB 토큰 발급)
  Future<String> login() async {
    final account = await GoogleSignIn.instance.authenticate();
    final idToken = account.authentication.idToken;
    if (idToken == null) {
      // serverClientId 설정이 잘못됐을 때 주로 발생
      throw StateError('구글 ID 토큰을 받지 못했어요');
    }
    return idToken;
  }

  /// 구글 로그인 상태 해제 (다음 로그인 때 계정 선택 화면 표시)
  Future<void> logout() => GoogleSignIn.instance.signOut();

  /// 사용자가 로그인을 취소했는지 여부
  static bool isCanceled(Object e) =>
      e is GoogleSignInException && e.code == GoogleSignInExceptionCode.canceled;
}

final googleLoginServiceProvider = Provider((ref) => GoogleLoginService());