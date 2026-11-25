import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/my_page/presentation/widgets/app_settings/setting_list_item.dart';
import 'package:plan_b/shared/widgets/btn/btn_toggle.dart';

/// 마이페이지 앱 설정 목록
class AppSettingsSection extends StatelessWidget {
  const AppSettingsSection({
    super.key,
    required this.isPushEnabled,
    required this.onPushChanged,
    required this.onLogoutTap,
    required this.onDeleteAccountTap,
  });

  final bool isPushEnabled;
  final ValueChanged<bool> onPushChanged;
  final VoidCallback onLogoutTap;
  final VoidCallback onDeleteAccountTap;

  static const double _titleGap = 16; // 제목 ~ 목록 간격

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _titleGap,
      children: [
        Text(
          '앱 설정',
          style: AppTextStyles.titleSemiBold20.copyWith(color: AppColors.gray600),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 푸시 알림: 토글만 탭 가능
            SettingListItem(
              label: '푸시 알림 설정',
              trailing: BtnToggle(
                isOn: isPushEnabled,
                onChanged: onPushChanged,
              ),
            ),
            SettingListItem(label: '로그아웃', onTap: onLogoutTap),
            SettingListItem(label: '회원탈퇴', onTap: onDeleteAccountTap),
          ],
        ),
      ],
    );
  }
}