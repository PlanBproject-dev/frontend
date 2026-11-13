// 화면 하단 radial ellipse 배경 (bg_bottom_ellipse.svg)
// - 이 위젯이 Positioned를 반환하기 때문에, 반드시 Stack의 직계 자식으로 사용해야 함.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BgBottomEllipse extends StatelessWidget {
  const BgBottomEllipse({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 155,
      left: 0,
      right: 0,
      bottom: 0,
      child: IgnorePointer(
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxWidth: double.infinity,   // 화면보다 넓은 SVG를 줄이지 않고 원본 크기로
          maxHeight: double.infinity,
          child: SvgPicture.asset('assets/backgrounds/bg_bottom_ellipse.svg'),
        ),
      ),
    );
  }
}