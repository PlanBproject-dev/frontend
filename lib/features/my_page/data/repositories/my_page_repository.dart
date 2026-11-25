import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';
import 'package:plan_b/features/my_page/data/models/dto/nickname_update_request_dto.dart';
import 'package:plan_b/features/my_page/data/models/dto/me_response_dto.dart';
import 'package:plan_b/features/my_page/data/models/my_profile.dart';

class MyPageRepository {
  MyPageRepository(this._dio);
  final Dio _dio;

  /// 내 정보 조회 (닉네임, 이메일)
  Future<MyProfile> getMe() {
    return apiRequest(
      () => _dio.get('/api/v1/user/me'),
      (data) => MeResponseDto.fromJson(data as Map<String, dynamic>).toMyProfile(),
    );
  }

  /// 닉네임 변경
  Future<void> updateNickname(String nickname) {
    return apiRequest<void>(
      () => _dio.patch(
        '/api/v1/user/nickname',
        data: NicknameUpdateRequestDto(nickname: nickname).toJson(),
      ),
      (_) {},
    );
  }
}

final myPageRepositoryProvider =
    Provider((ref) => MyPageRepository(ref.read(dioProvider)));