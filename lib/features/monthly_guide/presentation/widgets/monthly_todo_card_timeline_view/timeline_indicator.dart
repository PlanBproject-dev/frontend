import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';

/// 전체 타임라인 왼쪽 표시줄 (기간 노드 + 다음 기간으로 이어지는 세로선)
class TimelineIndicator extends StatelessWidget {
  const TimelineIndicator({
    super.key,
    required this.isActive,
    this.showLine = true,
  });

  final bool isActive; // 이번 기간이면 채워진 노드
  final bool showLine; // 마지막 기간이면 세로선 없음

  static const double width = 24;
  static const double _nodeSize = 24;
  static const double _nodeLineGap = 8;
  static const double _lineWidth = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SvgPicture.asset(
            isActive
                ? 'assets/graphics/graphic_timeline_node_active.svg'
                : 'assets/graphics/graphic_timeline_node_inactive.svg',
            width: _nodeSize,
            height: _nodeSize,
          ),
          if (showLine) ...[
            const SizedBox(height: _nodeLineGap),
            Expanded(
              child: Container(width: _lineWidth, color: AppColors.blue400),
            ),
          ],
        ],
      ),
    );
  }
}