// 화면 하단에 붙는 radial ellipse 배경 (bg_bottom_ellipse.svg)
// - BgBottomEllipse와 같은 SVG지만, 위에서부터가 아니라 화면 아래 기준으로 배치
// - 이 위젯이 Positioned를 반환하기 때문에, 반드시 Stack의 직계 자식으로 사용해야 함.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BgBottomAnchoredEllipse extends StatelessWidget {
  const BgBottomAnchoredEllipse({super.key});

  static const double _bottom = -263; // 화면 아래로 넘치는 만큼
  static const double _height = 952;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: _bottom,
      height: _height,
      child: IgnorePointer(
        child: OverflowBox(
          alignment: Alignment.bottomCenter,
          maxWidth: double.infinity,
          child: SvgPicture.asset('assets/backgrounds/bg_bottom_ellipse.svg'),
        ),
      ),
    );
  }
}