// 홈 화면 상단바

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.onLogoTap,
    this.onNotificationTap,
  });

  final VoidCallback? onLogoTap;          // null이면 로고 탭 동작 없음
  final VoidCallback? onNotificationTap;  // 알림 버튼 탭

  static const double _height = 44; // 높이 고정 44

  @override
  Size get preferredSize => const Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false, // 상태바 영역만 피하도록
      child: SizedBox(
        height: _height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // planB 로고
              Semantics(
                button: onLogoTap != null,
                label: 'planB 홈',
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onLogoTap,
                  child: Container(
                    height: _height,
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/logos/logo_planb_sm.svg',
                    ),
                  ),
                ),
              ),

              // 알림 버튼
              Semantics(
                button: true,
                label: '알림',
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onNotificationTap,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.dimSurfaceLight,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/ic_notification_24px.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}