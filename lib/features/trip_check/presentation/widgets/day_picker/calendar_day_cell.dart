import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 선택 기간 안에서 이 날짜의 위치
enum CalendarDayRange {
  none,   // 기간 밖
  single, // 시작일 = 종료일
  start,  // 시작일
  middle, // 시작일과 종료일 사이
  end,    // 종료일
}

class CalendarDayCell extends StatelessWidget {
  const CalendarDayCell({
    super.key,
    required this.day,
    this.isCurrentMonth = true,
    this.range = CalendarDayRange.none,
    this.onTap,
  });

  final int day;                 // 표시할 일(day)
  final bool isCurrentMonth;     // 현재 달 날짜인지 여부 (false면 이전/다음 달 날짜이므로 흐리게 표시)
  final CalendarDayRange range;  // 선택 기간 내 위치
  final VoidCallback? onTap;     // 탭 콜백. null이면 표시 전용(탭 불가)

  static const double _height = 36;
  static const Radius _radius = Radius.circular(6);

  @override
  Widget build(BuildContext context) {
    // 기간의 양 끝만 둥글게 radius 처리
    final BorderRadius borderRadius = switch (range) {
      CalendarDayRange.single => const BorderRadius.all(_radius),
      CalendarDayRange.start => const BorderRadius.horizontal(left: _radius),
      CalendarDayRange.end => const BorderRadius.horizontal(right: _radius),
      _ => BorderRadius.zero,
    };

    final cell = Container(
      height: _height,
      padding: const EdgeInsets.only(top: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: range == CalendarDayRange.none ? AppColors.white : AppColors.blue50,
        borderRadius: borderRadius,
      ),
      child: Text(
        '$day',
        style: AppTextStyles.bodyMedium14.copyWith(
          color: isCurrentMonth ? AppColors.gray700 : AppColors.gray200,
        ),
      ),
    );

    return Semantics(
      button: onTap != null,
      selected: range != CalendarDayRange.none, // 스크린 리더에 선택 상태 전달
      child: onTap == null
          ? cell
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: cell,
            ),
    );
  }
}