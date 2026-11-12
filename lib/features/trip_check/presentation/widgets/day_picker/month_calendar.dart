import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/calendar_day_cell.dart';

/// 드롭다운 안의 월별 캘린더
class MonthCalendar extends StatelessWidget {
  const MonthCalendar({
    super.key,
    required this.visibleMonth,
    required this.start,
    required this.end,
    required this.onPrev,
    required this.onNext,
    required this.onDayTap,
  });

  final DateTime visibleMonth;           // 보여줄 달 (1일 기준)
  final DateTime? start;                 // 선택된 시작일
  final DateTime? end;                   // 선택된 종료일. null이면 종료일 선택 대기 중
  final VoidCallback onPrev;             // 이전 달 버튼 탭
  final VoidCallback onNext;             // 다음 달 버튼 탭
  final ValueChanged<DateTime> onDayTap; // 날짜 탭

  static const List<String> _weekdays = ['월', '화', '수', '목', '금', '토', '일'];

  CalendarDayRange _rangeOf(DateTime day) {
    final s = start;
    if (s == null) return CalendarDayRange.none;
    final e = end ?? s;

    final bool isStart = DateUtils.isSameDay(day, s);
    final bool isEnd = DateUtils.isSameDay(day, e);
    if (isStart && isEnd) return CalendarDayRange.single;
    if (isStart) return CalendarDayRange.start;
    if (isEnd) return CalendarDayRange.end;
    if (day.isAfter(s) && day.isBefore(e)) return CalendarDayRange.middle;
    return CalendarDayRange.none;
  }

  @override
  Widget build(BuildContext context) {
    final int year = visibleMonth.year;
    final int month = visibleMonth.month;

    // 월요일 시작 기준으로 앞쪽에 채울 이전 달 날짜 수
    final int leading = DateTime(year, month).weekday - 1;
    final int daysInMonth = DateUtils.getDaysInMonth(year, month);
    final int weeks = ((leading + daysInMonth) / 7).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 헤더: 이전 달 / 연월 / 다음 달
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavButton(
              iconPath: 'assets/icons/ic_chevron_left_16px_gray.svg',
              onTap: onPrev,
            ),
            Text(
              '$year년 $month월',
              style: AppTextStyles.bodySemiBold16.copyWith(color: AppColors.black),
            ),
            _NavButton(
              iconPath: 'assets/icons/ic_chevron_right_16px_gray.svg',
              onTap: onNext,
            ),
          ],
        ),
        const SizedBox(height: 16),

        // 요일
        Row(
          children: [
            for (final weekday in _weekdays)
              Expanded(
                child: SizedBox(
                  height: 28,
                  child: Center(
                    child: Text(
                      weekday,
                      style: AppTextStyles.labelMedium12.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        // 날짜
        for (int week = 0; week < weeks; week++)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                for (int i = 0; i < 7; i++)
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        // DateTime이 범위를 넘는 일자를 이전/다음 달로 자동 보정
                        final DateTime day =
                            DateTime(year, month, 1 - leading + week * 7 + i);
                        final bool isCurrentMonth = day.month == month;

                        return CalendarDayCell(
                          day: day.day,
                          isCurrentMonth: isCurrentMonth,
                          // 이전/다음 달 날짜는 표시만 하고 선택 불가
                          range: isCurrentMonth
                              ? _rangeOf(day)
                              : CalendarDayRange.none,
                          onTap: isCurrentMonth ? () => onDayTap(day) : null,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

/// 헤더의 좌우 chevron 버튼
class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.iconPath,
    required this.onTap,
  });

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: AppColors.bgSolidBasic,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(iconPath, width: 16, height: 16),
      ),
    );
  }
}