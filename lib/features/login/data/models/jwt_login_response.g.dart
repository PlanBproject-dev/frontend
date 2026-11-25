// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JwtLoginResponseImpl _$$JwtLoginResponseImplFromJson(
  Map<String, dynamic> json,
) => _$JwtLoginResponseImpl(
  jwtAccessToken: json['jwtAccessToken'] as String,
  jwtRefreshToken: json['jwtRefreshToken'] as String,
  newUser: json['newUser'] as bool? ?? false,
  userId: (json['userId'] as num?)?.toInt(),
  email: json['email'] as String?,
  nickname: json['nickname'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
);

Map<String, dynamic> _$$JwtLoginResponseImplToJson(
  _$JwtLoginResponseImpl instance,
) => <String, dynamic>{
  'jwtAccessToken': instance.jwtAccessToken,
  'jwtRefreshToken': instance.jwtRefreshToken,
  'newUser': instance.newUser,
  'userId': instance.userId,
  'email': instance.email,
  'nickname': instance.nickname,
  'profileImageUrl': instance.profileImageUrl,
};
