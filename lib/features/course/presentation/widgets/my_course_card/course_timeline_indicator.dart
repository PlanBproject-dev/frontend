// 일일 코스의 개별 리스트 아이템의 왼쪽 코스 인디케이터 부분위젯

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class CourseTimelineIndicator extends StatelessWidget {
  const CourseTimelineIndicator({
    super.key,
    required this.dotTop,
    required this.showTopLine,
    required this.showBottomLine,
  });

  final double dotTop;
  final bool showTopLine;
  final bool showBottomLine;

  static const double width = 6;
  static const double dotSize = 6;
  static const double _dotLineGap = 2; // 점과 연결선 사이 간격
  static const double _lineWidth = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          // 위쪽: 연결선 또는 빈 여백
          if (showTopLine) ...[
            SizedBox(height: dotTop - _dotLineGap, child: const _TimelineLine()),
            const SizedBox(height: _dotLineGap),
          ] else
            SizedBox(height: dotTop),

          // 점
          Container(
            width: dotSize,
            height: dotSize,
            decoration: const BoxDecoration(
              color: AppColors.blue300,
              shape: BoxShape.circle,
            ),
          ),

          // 아래쪽: 항목 아래 끝까지 이어지는 연결선
          if (showBottomLine) ...[
            const SizedBox(height: _dotLineGap),
            const Expanded(child: _TimelineLine()),
          ],
        ],
      ),
    );
  }
}

/// 세로 연결선
class _TimelineLine extends StatelessWidget {
  const _TimelineLine();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: CourseTimelineIndicator._lineWidth,
        color: AppColors.gray50,
      ),
    );
  }
}