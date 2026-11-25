// 마이페이지 사용자 프로필 조회 + 이름 변경
// 홈, 여행 고르기 화면도 이 provider의 이름을 사용해 헤더에 노출한다.

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/auth/auth_provider.dart';
import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/features/my_page/data/models/dto/nickname_update_request_dto.dart';
import 'package:plan_b/features/my_page/data/models/my_profile.dart';
import 'package:plan_b/features/my_page/data/repositories/my_page_repository.dart';

class MyProfileNotifier extends AsyncNotifier<MyProfile> {
  @override
  Future<MyProfile> build() async {
    // 로그인 상태가 바뀌면 다시 읽음 (로그아웃 > 다른 계정 로그인 시 이전 이름이 남지 않도록)
    final bool isLoggedIn =
        ref.watch(authProvider.select((auth) => auth.isLoggedIn));

    // 로그아웃 상태에서는 토큰이 없어 401이 나므로 조회하지 않음
    if (!isLoggedIn) return const MyProfile(name: '', email: '');

    return ref.read(myPageRepositoryProvider).getMe();
  }

  /// 이름 변경: 화면 먼저 반영 > 서버 요청 (실패 시 되돌림)
  Future<void> updateName(String name) async {
    final MyProfile? current = state.valueOrNull;
    // 프로필 조회 실패/로딩 중: 성공으로 처리되지 않도록 실패로 알림
    if (current == null) {
      throw ApiException('프로필을 불러오지 못해 이름을 변경할 수 없어요.');
    }

    final String? error = NicknameUpdateRequestDto.validate(name);
    if (error != null) throw ApiException(error);

    state = AsyncData(current.copyWith(name: name));

    try {
      await ref.read(myPageRepositoryProvider).updateNickname(name);
    } catch (_) {
      state = AsyncData(current); // 롤백
      rethrow;
    }
  }
}

final myProfileProvider =
    AsyncNotifierProvider<MyProfileNotifier, MyProfile>(MyProfileNotifier.new);