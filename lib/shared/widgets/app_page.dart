/**
 * app_page.dart
 * - 앱 공통 페이지 틀
 * - 기본 좌우 24px 패딩 적용 + safe area
 */

import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.body,
    this.appBar,
    this.bottomCta,
    this.horizontalPadding = 24,
    this.backgroundColor = Colors.white,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomCta;     // 화면 하단 고정되는 cta 영역
  final double horizontalPadding; // 좌우 패딩 24px, 별도의 레이아웃이 필요한 화면은 직접 레이아웃 구성
  final Color? backgroundColor;    // 배경색 기본값 흰색 (지정하지 않을 경우)

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: horizontalPadding);

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
      bottomNavigationBar: bottomCta == null
        ? null
        : SafeArea(
          child: Padding(padding: padding, child: bottomCta),
        )
    );
  }
}