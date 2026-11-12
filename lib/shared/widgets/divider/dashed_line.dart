import 'package:flutter/material.dart';

/// 가로 점선
class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
    required this.color,
    this.thickness = 1,
    this.dash = 2,
    this.gap = 2,
  });

  final Color color;
  final double thickness;
  final double dash; // 점 길이
  final double gap;  // 점 사이 간격

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: thickness,
      width: double.infinity,
      child: CustomPaint(
        painter: _DashedLinePainter(color: color, dash: dash, gap: gap),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.color,
    required this.dash,
    required this.gap,
  });

  final Color color;
  final double dash;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;
    final double y = size.height / 2;

    for (double x = 0; x < size.width; x += dash + gap) {
      final double end = x + dash > size.width ? size.width : x + dash;
      canvas.drawLine(Offset(x, y), Offset(end, y), paint);
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter old) =>
      old.color != color || old.dash != dash || old.gap != gap;
}