// 여행 고르기 화면 하단 고정 cta 영역

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class SelectBottomBar extends StatelessWidget {
  const SelectBottomBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Color(0x14000000), offset: Offset(0, -15), blurRadius: 15),
        ],
      ),
      // 홈 인디케이터 영역까지 흰 배경
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
          child: child,
        ),
      ),
    );
  }
}