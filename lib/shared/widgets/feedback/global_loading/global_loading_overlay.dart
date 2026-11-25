// 전역 로딩 화면: 화면 전체 딤 레이어 + 화면 중앙 스피너 + 로딩 문구
// 로딩 오버레이 아래의 터치와 스크린 리더 탐색을 막음

import 'dart:math' show pi;

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class GlobalLoadingOverlay extends StatelessWidget {
  const GlobalLoadingOverlay({super.key, this.text = '로딩 중...'});

  final String text;

  @override
  Widget build(BuildContext context) {
    return BlockSemantics( // 스크린 리더가 딤 아래 화면을 읽지 않도록
      child: AbsorbPointer( // 딤 아래 화면 터치 막음
        child: ColoredBox(
          color: AppColors.dimBackdrop, // 모달 배경 딤과 동일
          child: Center(
            // builder 영역에는 Material이 없어서 Text 기본 에러 스타일(노란 밑줄)이 적용되지 않도록 감쌈
            child: Material(
              type: MaterialType.transparency,
              child: Semantics(
                liveRegion: true, // 나타날 때 스크린 리더가 바로 읽음
                label: text,
                excludeSemantics: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16, // 스피너 ~ 문구 사이 간격
                  children: [
                    const _GlobalLoadingIndicator(),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium16.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 계속 회전하는 원형 스피너 (LoadingSpinner와 같은 트랙/호 색상)
class _GlobalLoadingIndicator extends StatefulWidget {
  const _GlobalLoadingIndicator();

  @override
  State<_GlobalLoadingIndicator> createState() => _GlobalLoadingIndicatorState();
}

class _GlobalLoadingIndicatorState extends State<_GlobalLoadingIndicator>
    with SingleTickerProviderStateMixin {
  static const double _size = 40;
  static const Duration _turnDuration = Duration(milliseconds: 900); // 한 바퀴

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: _turnDuration)..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: const CustomPaint(
        size: Size.square(_size),
        painter: _SpinnerPainter(),
      ),
    );
  }
}

/// 회색 트랙(원 전체) + 12시 방향에서 시작하는 1/4 파란 호
class _SpinnerPainter extends CustomPainter {
  const _SpinnerPainter();

  static const double _strokeWidth = 4;
  static const double _sweep = pi / 2; // 호 길이: 1/4 바퀴

  @override
  void paint(Canvas canvas, Size size) {
    // 선 두께의 절반만큼 안쪽으로 그려서 잘리지 않도록
    final rect = (Offset.zero & size).deflate(_strokeWidth / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, 2 * pi, false, paint..color = AppColors.gray50);
    canvas.drawArc(rect, -pi / 2, _sweep, false, paint..color = AppColors.blue500);
  }

  @override
  bool shouldRepaint(_SpinnerPainter oldDelegate) => false;
}