import 'package:flutter/material.dart';

import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_card_palette.dart';

/// 월별 여행준비 가이드) 카드 맨 위에 덮는 테두리 + 안쪽 그림자 레이어.
class MonthlyTodoCardFrame extends StatelessWidget {
  const MonthlyTodoCardFrame({super.key, required this.radius});

  final double radius;

  @override
  Widget build(BuildContext context) {
    // 장식 레이어라 터치를 막지 않도록
    return IgnorePointer(
      child: CustomPaint(
        painter: _FramePainter(radius: radius),
        size: Size.infinite,
      ),
    );
  }
}

class _FramePainter extends CustomPainter {
  const _FramePainter({required this.radius});

  final double radius;

  static const double _borderWidth = 32;
  static const double _highlightWidth = 5;
  static const double _shadowSigma = 10;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final outer = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    canvas.save();
    canvas.clipRRect(outer);

    // 1. 바깥 반투명 흰 테두리
    canvas.drawDRRect(
      outer,
      outer.deflate(_borderWidth),
      Paint()..color = MonthlyTodoCardPalette.frameBorder,
    );

    // 2. 안쪽 어두운 그림자: 카드 바깥 영역을 블러 처리해 안쪽으로 번지게 함
    final shadowPath = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(_shadowSigma * 4))
      ..addRRect(outer);
    canvas.drawPath(
      shadowPath,
      Paint()
        ..color = MonthlyTodoCardPalette.innerShadow
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, _shadowSigma),
    );

    // 3. 안쪽 흰 하이라이트 선
    canvas.drawDRRect(
      outer,
      outer.deflate(_highlightWidth),
      Paint()..color = MonthlyTodoCardPalette.innerHighlight,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _FramePainter oldDelegate) =>
      oldDelegate.radius != radius;
}