import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';

/// 로그인 방식(카카오, 구글 등)과 관계없는 세션 API
class SessionRepository {
  SessionRepository(this._dio);
  final Dio _dio;

  /// 서버에 로그아웃 알림 (리프레시 토큰 무효화 등)
  Future<void> logout() => _dio.post('/api/v1/auth/logout');

  /// 회원탈퇴 (응답 본문 없음, 실패 시 ApiException)
  /// 서버가 계정을 삭제한 뒤 늦게 응답해도 실패로 처리하지 않도록, 이 요청만 수신 시간 제한 해제했음.
  Future<void> withdraw() {
    return apiRequest<void>(
      () => _dio.post(
        '/api/v1/auth/withdraw',
        options: Options(receiveTimeout: Duration.zero), // 제한 없음
      ),
      (_) {},
    );
  }
}

final sessionRepositoryProvider =
    Provider((ref) => SessionRepository(ref.read(dioProvider)));
