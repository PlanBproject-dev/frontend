import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_login_response.freezed.dart';
part 'jwt_login_response.g.dart';

/// 소셜로그인 (카카오, 구글) 응답
@freezed
class JwtLoginResponse with _$JwtLoginResponse {
  const factory JwtLoginResponse({
    required String jwtAccessToken,
    required String jwtRefreshToken,
    @Default(false) bool newUser, // true면 첫 로그인 -> 온보딩으로
    int? userId,
    String? email,
    String? nickname,
    String? profileImageUrl,
  }) = _JwtLoginResponse;

  factory JwtLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtLoginResponseFromJson(json);
}