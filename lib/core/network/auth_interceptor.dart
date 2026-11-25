import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:plan_b/core/storage/token_storage.dart';

class AuthInterceptor extends QueuedInterceptor { // Interceptor → QueuedInterceptor (함정 2)
  AuthInterceptor({
    required this.storage,
    required BaseOptions baseOptions,
    this.onSessionExpired,
  }) : _plainDio = Dio(baseOptions); // 인터셉터 없는 별도 Dio

  final TokenStorage storage;
  final Dio _plainDio;
  final void Function()? onSessionExpired; // 로그인 화면 이동 등 (나중에 연결)

  static const _reissuePath = '/api/v1/auth/token/reissue';

  // 요청 직전: 토큰 붙이기
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.readAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  // 에러 발생: 401이면 재발급 후 재시도
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final req = err.requestOptions;
    final is401 = err.response?.statusCode == 401;
    final alreadyRetried = req.extra['retried'] == true;

    if (!is401 || alreadyRetried) {
      return handler.next(err); // 401이 아니거나 이미 한 번 재시도했으면 그냥 에러로 넘김
    }

    // 앞선 요청이 이미 재발급했으면 그 토큰을 재사용
    final usedToken =
        (req.headers['Authorization'] as String?)?.replaceFirst('Bearer ', '');
    final savedToken = await storage.readAccessToken();

    final String newToken;
    if (savedToken != null && savedToken != usedToken) {
      newToken = savedToken;
    } else {
      switch (await _reissue()) {
        case _ReissueSuccess(:final token):
          newToken = token;

        // 리프레시 토큰이 없거나 서버가 무효라고 응답 -> 토큰 삭제 후 로그아웃
        // 삭제가 실패해도 세션 만료 처리와 에러 전달은 반드시 진행 (handler를 호출하지 않으면 요청이 멈춤)
        case _ReissueInvalid():
          try {
            await storage.clear();
          } catch (e) {
            debugPrint('세션 만료 후 토큰 삭제 실패: $e');
          }
          onSessionExpired?.call();
          return handler.next(err);

        // 일시적인 실패(타임아웃, 네트워크 끊김, 5xx 등) -> 토큰은 그대로 두고 에러만 전달
        // 다음 요청에서 401이 나면 다시 재발급을 시도할 수 있음
        case _ReissueTransientFailure():
          return handler.next(err);
      }
    }

    // 실패했던 요청을 새 토큰으로 다시 보내기
    try {
      req.headers['Authorization'] = 'Bearer $newToken';
      req.extra['retried'] = true;
      final response = await _plainDio.fetch(req);
      handler.resolve(response); // 원래 호출한 쪽은 이 성공 응답을 받음
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  /// 리프레시 토큰으로 액세스 토큰 재발급
  /// - 성공: 새 토큰 저장 후 반환
  /// - 무효: 리프레시 토큰이 없거나, 서버가 400/401/403으로 거절 (다시 로그인 필요)
  /// - 일시 실패: 그 외 모든 실패 (토큰을 지우면 안 됨)
  Future<_ReissueResult> _reissue() async {
    final refreshToken = await storage.readRefreshToken();
    if (refreshToken == null) return const _ReissueInvalid();

    try {
      final res = await _plainDio.post(
        _reissuePath,
        data: {'refreshToken': refreshToken},
      );
      final data = res.data;
      final token = data is Map
          ? (data['access_token'] ?? data['data']?['access_token']) as String?
          : null;

      // 200인데 토큰이 없으면 서버 응답 이상 → 로그아웃시키지 않고 일시 실패로 처리
      if (token == null) return const _ReissueTransientFailure();

      // 응답이 'Bearer xxx' 형태여도 저장할 때와 같은 정규화된 토큰으로 바로 재전송
      final normalized = TokenStorage.stripBearer(token);
      await storage.saveAccessToken(normalized);
      return _ReissueSuccess(normalized);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 400 || status == 401 || status == 403) {
        return const _ReissueInvalid();
      }
      return const _ReissueTransientFailure();
    } catch (_) {
      return const _ReissueTransientFailure();
    }
  }
}

/// 재발급 결과
sealed class _ReissueResult {
  const _ReissueResult();
}

class _ReissueSuccess extends _ReissueResult {
  const _ReissueSuccess(this.token);
  final String token;
}

class _ReissueInvalid extends _ReissueResult {
  const _ReissueInvalid();
}

class _ReissueTransientFailure extends _ReissueResult {
  const _ReissueTransientFailure();
}
