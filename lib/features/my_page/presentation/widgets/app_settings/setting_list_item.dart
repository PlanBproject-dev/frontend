import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 설정 목록의 한 줄 (하단 구분선 포함)
class SettingListItem extends StatelessWidget {
  const SettingListItem({
    super.key,
    required this.label,
    this.trailing,
    this.onTap,
  });

  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;

  static const double _height = 64;

  @override
  Widget build(BuildContext context) {
    final Widget item = Container(
      height: _height,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray100)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.bodySemiBold16.copyWith(
                color: AppColors.gray800,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );

    if (onTap == null) return item;

    return Semantics(
      button: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: item,
      ),
    );
  }
}