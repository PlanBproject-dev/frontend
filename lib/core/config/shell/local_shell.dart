// local_shell.dart
// - 로컬 내비게이션 바가 붙는 Shell
// - LocalNavTab 순서 = router.dart의 로컬 브랜치 순서

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/shared/widgets/nav/local_nav_bar.dart';

class LocalShell extends StatelessWidget {
  const LocalShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
          child: LocalNavBar(
            activeTab: LocalNavTab.values[navigationShell.currentIndex],
            onTabSelected: (tab) => navigationShell.goBranch(
              tab.index,
              initialLocation: tab.index == navigationShell.currentIndex,
            ),
          ),
        ),
      ),
    );
  }
}