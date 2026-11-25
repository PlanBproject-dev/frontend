// 일일 코스 카드 우측 상단 radial 하이라이트
// bg_top_right_highlight_ellipse.svg를 사용.
// - 이 위젯이 Positioned를 반환하기 때문에, 반드시 Stack의 직계 자식으로 사용해야 함.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseHighlightEllipse extends StatelessWidget {
  const CourseHighlightEllipse({super.key});

  static const String _asset =
      'assets/backgrounds/bg_top_right_highlight_ellipse.svg';
  static const double _width = 614;
  static const double _height = 401;

  @override
  Widget build(BuildContext context) {
    // 타원 중심을 카드 우측 상단 모서리에 맞춤: 카드 너비가 바뀌어도 위치를 유지.
    return Positioned(
      top: -_height / 2,
      right: -_width / 2,
      width: _width,
      height: _height,
      child: IgnorePointer(
        child: SvgPicture.asset(_asset, fit: BoxFit.fill),
      ),
    );
  }
}