// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeResponseDtoImpl _$$MeResponseDtoImplFromJson(Map<String, dynamic> json) =>
    _$MeResponseDtoImpl(
      userId: (json['userId'] as num?)?.toInt(),
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$MeResponseDtoImplToJson(_$MeResponseDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
    };
