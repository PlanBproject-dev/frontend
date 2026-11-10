import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class GlobalTab extends StatelessWidget {
  const GlobalTab({
    super.key,
    required this.tabName,
    required this.activeIconPath,
    required this.inactiveIconPath,
    required this.isActive,
    this.onTap,
  });

  final String tabName;           // 탭 이름
  final String activeIconPath;    // 활성 상태 아이콘
  final String inactiveIconPath;  // 비활성 상태 아이콘
  final bool isActive;            // 현재 선택된 탭인지 여부
  final VoidCallback? onTap;      // null이면 표시 전용(탭 불가)

  static const double _iconSize = 24;   // 탭 아이콘 사이즈: 24

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isActive,   // 스크린 리더에 선택 상태 전달
      label: tabName,
      excludeSemantics: true,   // 내부 텍스트가 중복으로 읽히지 않게
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,   // 탭 영역 전체
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                isActive ? activeIconPath : inactiveIconPath,
                width: _iconSize,
                height: _iconSize,
              ),
              const SizedBox(height: 2,),
              Text(
                tabName,
                style: isActive
                  ? AppTextStyles.labelSemiBold12.copyWith(
                    color: AppColors.gray500,
                  )
                  : AppTextStyles.labelMedium12.copyWith(
                    color: AppColors.gray300,
                  ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}