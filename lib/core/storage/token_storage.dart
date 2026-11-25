import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();
  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';

  /// 서버가 'Bearer xxx' 형태로 줄 때를 대비해 접두어 제거
  /// (요청 헤더에는 인터셉터가 'Bearer '를 붙임)
  static String stripBearer(String token) =>
      token.startsWith('Bearer ') ? token.substring(7) : token;

  Future<String?> readAccessToken() async {
    final saved = await _storage.read(key: _accessKey);
    return saved == null ? null : stripBearer(saved); // 이미 'Bearer'째로 저장된 토큰도 처리
  }

  Future<String?> readRefreshToken() async {
    final saved = await _storage.read(key: _refreshKey);
    return saved == null ? null : stripBearer(saved);
  }

  Future<void> saveAccessToken(String token) =>
    _storage.write(key: _accessKey, value: stripBearer(token));

  Future<void> saveTokens({required String access, required String refresh}) async {
    await _storage.write(key: _accessKey, value: stripBearer(access));
    await _storage.write(key: _refreshKey, value: stripBearer(refresh));
  }

  Future<void> clear() => _storage.deleteAll();

  /// 앱 시작 시 로그인 상태로 복원해도 되는지
  /// 액세스·리프레시 토큰이 둘 다 있어야 true
  /// (저장 도중 실패 등으로 하나만 남은 불완전한 세션은 지우고 로그인 화면부터 시작)
  Future<bool> hasCompleteSession() async {
    final access = await readAccessToken();
    final refresh = await readRefreshToken();
    if (access != null && refresh != null) return true;
    if (access != null || refresh != null) await clear();
    return false;
  }
}

// 앱 전체에서 Riverpod을 통해 TokenStorage를 꺼내 쓰게 한다
final tokenStorageProvider = Provider((ref) => TokenStorage());