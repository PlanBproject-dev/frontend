// 원형 로딩 링: 회색 트랙 위를 파란 호가 12시 방향부터 시계방향으로 채워 나감

import 'dart:math' show pi;

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class LoadingSpinner extends StatefulWidget {
  const LoadingSpinner({
    super.key,
    this.isComplete = false,
    this.onFilled,
    this.size = 280,
    this.strokeWidth = 8,
    this.trackColor = AppColors.gray50,
    this.arcColor = AppColors.blue500,
    this.fillDuration = const Duration(seconds: 2),
    this.finishDuration = const Duration(milliseconds: 300),
    this.holdProgress = 0.9,
    this.semanticsLabel,
  });

  final bool isComplete;         // true가 되면 남은 부분을 마저 채움 (작업 완료 시점에 true로)
  final VoidCallback? onFilled;  // 링이 100% 채워진 직후 호출
  final double size;             // 링 지름
  final double strokeWidth;      // 링 두께
  final Color trackColor;        // 바탕 트랙 색
  final Color arcColor;          // 채워지는 호 색
  final Duration fillDuration;   // 0% → holdProgress까지 걸리는 시간
  final Duration finishDuration; // 완료 후 holdProgress → 100%까지 걸리는 시간
  final double holdProgress;     // 완료 전까지 대기하는 진행률 (0~1)
  final String? semanticsLabel;  // 스크린 리더용 설명 (예: '여행 계획 분석 중')

  @override
  State<LoadingSpinner> createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<LoadingSpinner>
    with SingleTickerProviderStateMixin {
  // value = 진행률 (0: 안 보임, 1: 한 바퀴 꽉 참)
  late final AnimationController _controller = AnimationController(vsync: this);

  bool _isFinishing = false;

  @override
  void initState() {
    super.initState();
    _controller.animateTo(
      widget.holdProgress,
      duration: widget.fillDuration,
      curve: Curves.easeOut,
    );
    if (widget.isComplete) _finish();
  }

  @override
  void didUpdateWidget(covariant LoadingSpinner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isComplete && widget.isComplete) _finish();
  }

  /// 현재 위치에서 100%까지 마저 채운 뒤 onFilled 호출
  Future<void> _finish() async {
    if (_isFinishing) return;
    _isFinishing = true;
    await _controller.animateTo(
      1,
      duration: widget.finishDuration,
      curve: Curves.easeInOut,
    );
    if (mounted) widget.onFilled?.call();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: SizedBox.square(
        dimension: widget.size,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => CustomPaint(
            painter: _RingPainter(
              progress: _controller.value,
              strokeWidth: widget.strokeWidth,
              trackColor: widget.trackColor,
              arcColor: widget.arcColor,
            ),
          ),
        ),
      ),
    );
  }
}

/// 회색 트랙(원 전체) + 12시 방향에서 시계방향으로 progress만큼 채운 호
class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.trackColor,
    required this.arcColor,
  });

  final double progress; // 0 ~ 1
  final double strokeWidth;
  final Color trackColor;
  final Color arcColor;

  @override
  void paint(Canvas canvas, Size size) {
    // 선 두께의 절반만큼 안쪽으로 그려서 링이 영역 밖으로 잘리지 않도록
    final rect = (Offset.zero & size).deflate(strokeWidth / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // 바탕 트랙
    canvas.drawArc(rect, 0, 2 * pi, false, paint..color = trackColor);

    // 채워지는 호 (0%면 그리지 않음)
    if (progress <= 0) return;
    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, paint..color = arcColor);
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.arcColor != arcColor;
}