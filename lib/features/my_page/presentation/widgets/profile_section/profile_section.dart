import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/my_page/presentation/widgets/name_text_field/name_text_field.dart';
import 'package:plan_b/features/my_page/presentation/widgets/profile_section/profile_avatar.dart';

/// 마이페이지 프로필: 프로필 이미지 + 이름 편집 필드 + 이메일
class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.name,
    required this.email,
    this.onNameSubmitted,
  });

  final String name;
  final String email;
  final Future<bool> Function(String name)? onNameSubmitted; // 이름 변경 저장 시

  static const double _avatarGap = 16;     // 프로필 이미지 ~ 텍스트 간격
  static const double _avatarTopInset = 4; // 프로필 이미지를 이름 줄에 맞추는 상단 여백
  static const double _textGap = 4;        // 이름 ~ 이메일 간격

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: _avatarGap,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: _avatarTopInset),
          child: ProfileAvatar(),
        ),

        // 이름 + 이메일: 남은 너비를 모두 차지 (이름 편집 필드가 fill로 채움)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: _textGap,
            children: [
              NameTextField(
                name: name,
                onSubmitted: onNameSubmitted,
              ),
              Text(
                email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyMedium14.copyWith(
                  color: AppColors.gray400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}