// global_shell.dart
// - 글로벌 내비게이션 바가 붙는 Shell

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/shared/widgets/nav/global_nav_bar.dart';

class GlobalShell extends StatelessWidget {
  const GlobalShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  // router.dart의 브랜치 순서와 반드시 같아야 함
  static const List<GlobalNavTab> _branchTabs = [
    GlobalNavTab.home,
    GlobalNavTab.myPage,
  ];

  void _onTabSelected(BuildContext context, GlobalNavTab tab) {
    if (tab == GlobalNavTab.createPlan) {
      context.push(AppRoutes.tripType);
      return;
    }

    final index = _branchTabs.indexOf(tab);
    navigationShell.goBranch(
      index,
      // 현재 탭을 다시 누르면 해당 탭의 첫 화면으로
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: GlobalNavBar(
        activeTab: _branchTabs[navigationShell.currentIndex],
        onTabSelected: (tab) => _onTabSelected(context, tab),
      ),
    );
  }
}