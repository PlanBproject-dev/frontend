// 화면 상단 radial gradient 배경 (bg_top_gradient.svg)
// - 이 위젯이 Positioned를 반환하기 때문에, 반드시 Stack의 직계 자식으로 사용해야 함.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BgTopGradient extends StatelessWidget {
  const BgTopGradient({super.key});

  static const double _height = 588;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: _height,
      child: IgnorePointer(
        child: SvgPicture.asset(
          'assets/backgrounds/bg_top_gradient.svg',
          fit: BoxFit.fill, // 화면 너비에 맞춰 가로로 늘림
        ),
      ),
    );
  }
}