import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 선택 시 좌측 상단 하이라이트 ellipse (Stack 안에서 영역 좌측 상단 기준으로 배치)
/// 티켓: top -167 / 영수증: top -281
class PlanHighlightEllipse extends StatelessWidget {
  const PlanHighlightEllipse({super.key, this.top = -167});

  final double top;

  static const String _asset = 'assets/backgrounds/bg_ticket_ellipse.svg';

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -296,
      top: top,
      width: 594,
      height: 580,
      child: IgnorePointer(
        child: SvgPicture.asset(_asset, fit: BoxFit.fill),
      ),
    );
  }
}