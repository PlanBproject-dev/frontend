import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_b/core/env.dart';
import 'package:plan_b/core/network/auth_interceptor.dart';
import 'package:plan_b/core/storage/token_storage.dart';
import 'package:plan_b/core/auth/auth_provider.dart';
import 'package:flutter/foundation.dart';

final dioProvider = Provider<Dio>((ref) {
  final baseOptions = BaseOptions(
    baseUrl: requireEnv('BASE_URL'),
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 60),
    headers: {'Content-Type': 'application/json'},
  );

  final dio = Dio(baseOptions);
  dio.interceptors.add(AuthInterceptor(
    storage: ref.read(tokenStorageProvider),
    baseOptions: baseOptions,
    // 리프레시 토큰까지 만료 → 로그아웃 상태로 → 라우터 가드가 로그인 화면으로 이동
    onSessionExpired: () => ref.read(authProvider.notifier).sessionExpired(),
  ));
  // 개발 중(디버그 빌드)에만 요청/응답 로그 출력
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
      requestHeader: false,  // 요청 헤더(Authorization) 숨김
      responseHeader: false, // 응답 헤더 숨김
      requestBody: true,
      responseBody: true,
    ));
  }

  return dio;
});