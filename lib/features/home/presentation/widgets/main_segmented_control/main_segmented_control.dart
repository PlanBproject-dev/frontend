// 홈 화면) 다가오는 여행 / 지난 여행 전환 세그먼트

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/home/presentation/widgets/main_segmented_control/main_segmented_item.dart';

/// 세그먼트 항목
enum MainSegment {
  upcomingTrip('다가오는 여행'),
  pastTrip('지난 여행');

  const MainSegment(this.label);

  final String label;
}

class MainSegmentedControl extends StatelessWidget {
  const MainSegmentedControl({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final MainSegment selected;                  // 현재 선택된 항목
  final ValueChanged<MainSegment> onSelected;  // 항목을 누르면 해당 항목 전달

  static const BorderRadius radius = BorderRadius.all(Radius.circular(999));
  static const Duration duration = Duration(milliseconds: 200); // 전환 시간
  static const Curve curve = Curves.easeOutCubic;                // 전환 곡선

  static const double _padding = 4; // 바탕 안쪽 여백
  static const double _gap = 4;     // 칸 사이 간격

  @override
  Widget build(BuildContext context) {
    const segments = MainSegment.values;

    return Container(
      width: double.infinity, // 부모 너비를 꽉 채우도록
      padding: const EdgeInsets.all(_padding),
      decoration: const BoxDecoration(
        color: AppColors.gray50,
        borderRadius: radius,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 칸 하나의 너비 = (전체 너비 - 칸 사이 간격 합) / 칸 개수
          final itemWidth =
              (constraints.maxWidth - _gap * (segments.length - 1)) / segments.length;

          return Stack(
            children: [
              // 흰 배경 인디케이터: 선택된 칸 위치로 이동
              AnimatedPositioned(
                duration: duration,
                curve: curve,
                left: selected.index * (itemWidth + _gap),
                top: 0,
                bottom: 0,
                width: itemWidth,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: radius,
                  ),
                ),
              ),

              // 칸들 (글자 + 탭 영역)
              Row(
                children: [
                  for (final segment in segments) ...[
                    if (segment.index > 0) const SizedBox(width: _gap),
                    Expanded(
                      child: MainSegmentedItem(
                        text: segment.label,
                        isSelected: segment == selected,
                        onTap: () => onSelected(segment),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}