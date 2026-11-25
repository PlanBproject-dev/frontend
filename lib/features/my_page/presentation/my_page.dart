// 마이페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/my_page/data/models/my_profile.dart';
import 'package:plan_b/features/my_page/presentation/providers/my_profile_provider.dart';
import 'package:plan_b/features/my_page/presentation/providers/push_notification_provider.dart';
import 'package:plan_b/features/login/presentation/providers/login_controller.dart';
import 'package:plan_b/shared/providers/global_loading_provider.dart';
import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
import 'package:plan_b/features/my_page/presentation/widgets/app_settings/app_settings_section.dart';
import 'package:plan_b/features/my_page/presentation/widgets/my_page_modals.dart';
import 'package:plan_b/features/my_page/presentation/widgets/profile_section/profile_section.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/feedback/global_loading/show_global_loading.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  static const double _profileTopGap = 24;    // 헤더 ~ 프로필 간격
  static const double _settingsTopGap = 70;   // 프로필 ~ 앱 설정 간격
  static const double _contentBottomGap = 40; // 마지막 항목 ~ 화면 하단 여백

  /// 로그아웃: 확인 모달 > (확인 시) 서버 로그아웃 + 토큰 삭제
  /// 로그아웃 상태가 되면 라우터 redirect가 로그인 화면으로 이동시킴
  Future<void> _onLogoutTap(BuildContext context, WidgetRef ref) async {
    final bool confirmed = await showLogoutModal(context);
    if (!confirmed || !context.mounted) return; // 돌아가기: 모달만 닫힘

    await ref
        .read(globalLoadingProvider.notifier)
        .run(() => ref.read(loginControllerProvider).logout());
  }

  /// 회원탈퇴: 경고 모달 -> (확인 시) 서버 탈퇴 -> 성공 시 라우터가 로그인 화면으로 이동
  /// 실패 시 로그인 상태 유지 + 토스트 알림.
  Future<void> _onDeleteAccountTap(BuildContext context, WidgetRef ref) async {
    final bool confirmed = await showDeleteAccountModal(context);
    if (!confirmed || !context.mounted) return; // 돌아가기 (모달만 닫힘)

    try {
      await ref
          .read(globalLoadingProvider.notifier)
          .run(() => ref.read(loginControllerProvider).withdraw());
    } catch (e) {
      if (!context.mounted) return; // 세션 만료로 이미 로그인 화면으로 간 경우
      showToast(
        context,
        text: e is ApiException ? e.message : '회원탈퇴에 실패했어요.\n다시 시도해주세요',
        type: ToastType.warning,
      );
    }
  }

  /// 이름 변경: 서버 저장 > 실패 시 토스트. 위젯에는 성공 여부 반환
  Future<bool> _onNameSubmitted(
    BuildContext context,
    WidgetRef ref,
    String name,
  ) async {
    try {
      await ref.read(myProfileProvider.notifier).updateName(name);
      return true;
    } catch (e) {
      if (context.mounted) {
        showToast(
          context,
          text: e is ApiException ? e.message : '이름을 변경하지 못했어요',
          type: ToastType.warning,
        );
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MyProfile> asyncProfile = ref.watch(myProfileProvider);
    final bool isPushEnabled = ref.watch(pushNotificationProvider);

    return AppPage(
      backgroundColor: AppColors.bgSolidBasic,
      isScrollable: true,
      header: const TitleHeader(title: '마이페이지'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: _profileTopGap),

          // 프로필 (이름 + 이메일)
          asyncProfile.when(
            // 다시 시도할 때 이전 에러 대신 로딩을 보여주기 위함 (기본값 true면 에러 화면이 그대로 남음)
            skipLoadingOnRefresh: false,
            loading: () => const ShowGlobalLoading(),
            // 조회 실패: 다시 시도하면 /user/me 재조회
            error: (_, _) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '프로필을 불러오지 못했어요.',
                  style: AppTextStyles.bodyMedium16.copyWith(color: AppColors.gray400),
                ),
                TextButton(
                  onPressed: () => ref.invalidate(myProfileProvider),
                  child: Text(
                    '다시 시도',
                    style: AppTextStyles.labelMedium14.copyWith(color: AppColors.blue500),
                  ),
                ),
              ],
            ),
            data: (profile) => ProfileSection(
              name: profile.name,
              email: profile.email,
              onNameSubmitted: (name) => _onNameSubmitted(context, ref, name),
            ),
          ),
          const SizedBox(height: _settingsTopGap),

          // 앱 설정 (푸시 알림 / 로그아웃 / 회원탈퇴)
          AppSettingsSection(
            isPushEnabled: isPushEnabled,
            onPushChanged: ref.read(pushNotificationProvider.notifier).setEnabled,
            onLogoutTap: () => _onLogoutTap(context, ref),
            onDeleteAccountTap: () => _onDeleteAccountTap(context, ref),
          ),
          const SizedBox(height: _contentBottomGap),
        ],
      ),
    );
  }
}