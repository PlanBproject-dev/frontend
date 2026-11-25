// GET /api/v1/user/me 응답의 data

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/my_page/data/models/my_profile.dart';

part 'me_response_dto.freezed.dart';
part 'me_response_dto.g.dart';

@freezed
class MeResponseDto with _$MeResponseDto {
  const factory MeResponseDto({
    int? userId,
    String? email,
    String? nickname,
    String? profileImageUrl, // 이건 아직 화면에서 사용 안 함
  }) = _MeResponseDto;
  factory MeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MeResponseDtoFromJson(json);
}

extension MeResponseDtoMapper on MeResponseDto {
  MyProfile toMyProfile() => MyProfile(
        name: nickname ?? '',
        email: email ?? '',
      );
}