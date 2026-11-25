// 화면 상단 radial ellipse 배경 (bg_top_ellipse.svg)
// - 이 위젯이 Positioned를 반환하기 때문에, 반드시 Stack의 직계 자식으로 사용해야 함.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BgTopEllipse extends StatelessWidget {
  const BgTopEllipse({super.key, this.top = defaultTop});

  static const double defaultTop = -101;
  static const double _height = 596;

  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      height: _height,
      child: IgnorePointer(
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxWidth: double.infinity,
          child: SvgPicture.asset('assets/backgrounds/bg_top_ellipse.svg'),
        ),
      ),
    );
  }
}