// 원형 그라데이션 로딩 링
// - 6시 방향에서 시작해 시계방향으로 갈수록 진해지는 링이 계속 천천히 회전
// - 끝나는 시점을 알 수 없는 긴 작업(예: AI 여행 플랜 생성)을 기다릴 때 사용한다.

import 'dart:math' show pi;

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class GradientLoadingSpinner extends StatefulWidget {
  const GradientLoadingSpinner({
    super.key,
    this.size = 280,
    this.strokeWidth = 8,
    this.turnDuration = const Duration(milliseconds: 3000),
    this.semanticsLabel,
  });

  final double size;            // 링 지름 (LoadingSpinner와 동일)
  final double strokeWidth;     // 링 두께 (LoadingSpinner와 동일)
  final Duration turnDuration;  // 한 바퀴 도는 시간 (클수록 천천히)
  final String? semanticsLabel; // 스크린 리더용 설명

  @override
  State<GradientLoadingSpinner> createState() => _GradientLoadingSpinnerState();
}

class _GradientLoadingSpinnerState extends State<GradientLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.turnDuration)..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: RotationTransition(
        turns: _controller, // 0 -> 1 반복: 시계방향 회전
        child: CustomPaint(
          size: Size.square(widget.size),
          painter: _GradientRingPainter(strokeWidth: widget.strokeWidth),
        ),
      ),
    );
  }
}

/// angular gradient 링
class _GradientRingPainter extends CustomPainter {
  const _GradientRingPainter({required this.strokeWidth});

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    // 선 두께의 절반만큼 안쪽으로 그려서 링이 영역 밖으로 잘리지 않도록
    final rect = (Offset.zero & size).deflate(strokeWidth / 2);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = SweepGradient(
        colors: [
          AppColors.blue500.withAlpha(0), // 시작: 투명
          AppColors.blue200,
          AppColors.blue500,              // 끝: 가장 진함
        ],
        stops: const [0, 0.5, 1],
        transform: const GradientRotation(pi / 2), // 시작점을 6시 방향으로
      ).createShader(Offset.zero & size);

    canvas.drawArc(rect, 0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(_GradientRingPainter oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth;
}