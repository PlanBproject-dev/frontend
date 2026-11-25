// global_nav_bar.dart
// - 앱 하단 글로벌 내비게이션 바 (홈 /새 플랜 생성 / 마이페이지)
// - 라우터 직접 호출X, 선택 상태와 탭 콜백만 받아서 Shell 화면에서 StatefulNavigationShell과 연결.

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/shared/widgets/nav/global_tab.dart';


/// 글로벌 탭 정의
enum GlobalNavTab {
  home(
    label: '홈',
    activeIconPath: 'assets/icons/ic_home_24px_darkgray.svg',
    inactiveIconPath: 'assets/icons/ic_home_24px_gray.svg',
  ),
  createPlan(
    label: '새 플랜 생성',
    activeIconPath: 'assets/icons/ic_add_24px_darkgray.svg',
    inactiveIconPath: 'assets/icons/ic_add_24px_gray.svg',
  ),
  myPage(
    label: '마이페이지',
    activeIconPath: 'assets/icons/ic_person_24px_darkgray.svg',
    inactiveIconPath: 'assets/icons/ic_person_24px_gray.svg',
  );

  const GlobalNavTab({
    required this.label,
    required this.activeIconPath,
    required this.inactiveIconPath,
  });

  final String label;
  final String activeIconPath;
  final String inactiveIconPath;
}

class GlobalNavBar extends StatelessWidget {
  const GlobalNavBar({
    super.key,
    required this.activeTab,
    required this.onTabSelected,
  });

  final GlobalNavTab activeTab;   // 현재 선택된 탭
  final ValueChanged<GlobalNavTab> onTabSelected;   // 탭을 누르면 해당 탭 전달

  static const double _height = 58;   // 탭바 높이

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,

      // 상단 구분선 border: foreGroundDecoration으로 그려서 레이아웃 높이(58)을 차지하지 않도록
      foregroundDecoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.gray50, width: 1)),
      ),

      child: SafeArea(
        top: false,
        child: SizedBox(
          height: _height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                for (final tab in GlobalNavTab.values)
                  Expanded(
                    child: GlobalTab(
                      tabName: tab.label,
                      activeIconPath: tab.activeIconPath,
                      inactiveIconPath: tab.inactiveIconPath,
                      isActive: tab == activeTab,
                      onTap: () => onTabSelected(tab),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}