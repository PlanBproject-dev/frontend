import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';
import 'package:plan_b/features/login/data/models/jwt_login_response.dart';

class LoginRepository {
  LoginRepository(this._dio);
  final Dio _dio;

  /// 카카오 액세스 토큰 -> PlanB 토큰
  Future<JwtLoginResponse> loginWithKakao(String kakaoAccessToken) =>
      _socialLogin('/api/v1/auth/login/kakao', kakaoAccessToken);

  /// 구글 ID 토큰 -> PlanB 토큰
  Future<JwtLoginResponse> loginWithGoogle(String googleIdToken) =>
      _socialLogin('/api/v1/auth/login/google', googleIdToken);

  Future<JwtLoginResponse> _socialLogin(String path, String token) async {
    try {
      final res = await _dio.post(path, data: {'token': token});
      final body = res.data as Map<String, dynamic>;
      // 응답이 감싸져 있으면 data를, 아니면 body 그대로 사용
      final json = body['data'] is Map<String, dynamic>
          ? body['data'] as Map<String, dynamic>
          : body;
      return JwtLoginResponse.fromJson(json);
    } on DioException catch (e) {
      final body = e.response?.data;
      // message가 문자열일 때만 사용 (배열 등 다른 형태면 기본 메시지)
      final message = body is Map && body['message'] is String
          ? body['message'] as String
          : null;
      throw ApiException(message ?? '로그인에 실패했어요', statusCode: e.response?.statusCode);
    }
  }
}

final loginRepositoryProvider =
    Provider((ref) => LoginRepository(ref.read(dioProvider)));