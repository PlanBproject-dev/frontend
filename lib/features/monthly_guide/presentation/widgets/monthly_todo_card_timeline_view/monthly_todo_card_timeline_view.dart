import 'package:flutter/material.dart';

import 'package:plan_b/features/monthly_guide/data/models/timeline_period_status.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card_timeline_view/timeline_inactive_content.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card_timeline_view/timeline_indicator.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card_timeline_view/timeline_present_content.dart';

/// 전체 타임라인의 기간 한 줄 (monthly_todo_card_timeline_view)
/// - 이번 기간은 흰 카드, 지난&다가올 기간은 텍스트만 (투명도 70%)
class MonthlyTodoCardTimelineView extends StatelessWidget {
  const MonthlyTodoCardTimelineView({
    super.key,
    required this.period,
    required this.startDate,
    required this.endDate,
    this.isLast = false,
    this.carryoverItems = const [],
    this.budgetItem,
    this.reservationItems = const [],
  });

  final TimelinePeriodStatus period;   // 지난 / 이번 / 다가올 기간
  final DateTime startDate;
  final DateTime endDate;              // 기간 마지막 날 (포함)
  final bool isLast;                   // 타임라인 마지막 기간이면 세로선 없음
  final List<Widget> carryoverItems;   // 지난 기간에서 넘어온 항목 (이번 기간 전용)
  final Widget? budgetItem;            // 저축 목표 (lessThanMonth 기간이면 없음)
  final List<Widget> reservationItems; // 준비 항목

  static const double _indicatorGap = 12;
  static const double _bottomGap = 16;       // 다음 기간 줄까지 간격 (세로선은 이어짐)
  static const double _inactiveOpacity = 0.7;

  bool get _isPresent => period == TimelinePeriodStatus.present;

  /// 빈 섹션은 제외 (순서: 지난 항목 > 예산 목표 > 준비 항목)
  List<List<Widget>> get _sections => [
        if (carryoverItems.isNotEmpty) carryoverItems,
        if (budgetItem != null) [budgetItem!],
        if (reservationItems.isNotEmpty) reservationItems,
      ];

  static String _format(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${d.year}.${two(d.month)}.${two(d.day)}.';
  }

  String get _dateRange => _isPresent
      ? '${_format(startDate)}\n~ ${_format(endDate)}'
      : '${_format(startDate)} ~ ${_format(endDate)}';

  @override
  Widget build(BuildContext context) {
    // 세로선이 내용 높이만큼 늘어나도록 IntrinsicHeight + stretch
    final row = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: _indicatorGap,
        children: [
          TimelineIndicator(isActive: _isPresent, showLine: !isLast),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: _bottomGap),
              child: _isPresent
                  ? TimelinePresentContent(
                      dateRange: _dateRange,
                      sections: _sections,
                    )
                  : TimelineInactiveContent(
                      dateRange: _dateRange,
                      sections: _sections,
                    ),
            ),
          ),
        ],
      ),
    );

    return _isPresent ? row : Opacity(opacity: _inactiveOpacity, child: row);
  }
}