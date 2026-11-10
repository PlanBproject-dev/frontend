import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/shared/widgets/nav/local_tab.dart';

/// 로컬 탭 정의
enum LocalNavTab {
  myPlanner(
    label: '여행 플래너',
    activeIconPath: 'assets/icons/ic_planner_24px_darkgray.svg',
    inactiveIconPath: 'assets/icons/ic_planner_24px_gray.svg',
  ),
  monthlyGuide(
    label: '월별 여행 준비',
    activeIconPath: 'assets/icons/ic_monthly_24px_darkgray.svg',
    inactiveIconPath: 'assets/icons/ic_monthly_24px_gray.svg',
  ),
  tripCourse(
    label: '여행 코스',
    activeIconPath: 'assets/icons/ic_course_24px_darkgray.svg',
    inactiveIconPath: 'assets/icons/ic_course_24px_gray.svg',
  );

  const LocalNavTab({
    required this.label,
    required this.activeIconPath,
    required this.inactiveIconPath,
  });

  final String label;
  final String activeIconPath;
  final String inactiveIconPath;
}

class LocalNavBar extends StatelessWidget {
  const LocalNavBar({
    super.key,
    required this.activeTab,
    required this.onTabSelected,
  });

  final LocalNavTab activeTab;                    // 현재 선택된 탭
  final ValueChanged<LocalNavTab> onTabSelected;  // 탭을 누르면 해당 탭 전달

  static const BorderRadius _radius = BorderRadius.all(Radius.circular(999));
  static const double _gap = 6; // 탭 사이 간격

  // 활성화된 탭 배경이 이동하는 모션
  static const Duration _slideDuration = Duration(milliseconds: 250);
  static const Curve _slideCurve = Curves.easeOutCubic;

  @override
  Widget build(BuildContext context) {
    const tabs = LocalNavTab.values;

    // 그림자는 ClipRRect 바깥에 그려야 잘리지 않음
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: _radius,
        boxShadow: AppEffects.boxDimmedLightLgShadow,
      ),
      child: ClipRRect(
        borderRadius: _radius, // 블러가 캡슐 모양 안에서만 적용되도록
        child: BackdropFilter(
          filter: AppEffects.boxDimmedLightLgBlur,
          child: Container(
            color: AppColors.dimSurfaceLight,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: LayoutBuilder(
              builder: (context, constraints) {

                final tabWidth = 
                  (constraints.maxWidth - _gap * (tabs.length - 1)) /
                    tabs.length;
                  
                return Stack(
                  children: [
                      // 활성 배경: 선택된 탭 위치로 미끄러지듯 이동
                      AnimatedPositioned(
                        duration: _slideDuration,
                        curve: _slideCurve,
                        left: activeTab.index * (tabWidth + _gap),
                        top: 0,
                        bottom: 0,
                        width: tabWidth,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: _radius,
                          ),
                        ),
                      ),

                      // 탭 (아이콘 + 텍스트): 배경 위에 그려짐
                      Row(
                        spacing: _gap,
                        children: [
                          for (final tab in tabs)
                            Expanded(
                              child: LocalTab(
                                tabName: tab.label,
                                activeIconPath: tab.activeIconPath,
                                inactiveIconPath: tab.inactiveIconPath,
                                isActive: tab == activeTab,
                                onTap: () => onTabSelected(tab),
                              ),
                            ),
                        ],
                      ),
                    ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}