import 'package:flutter/material.dart';

import 'package:plan_b/features/monthly_guide/data/models/monthly_guide.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_todo.dart';
import 'package:plan_b/features/monthly_guide/data/models/timeline_period_status.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card_timeline_view/monthly_todo_card_timeline_view.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/timeline_view_item/timeline_view_item.dart';

/// 전체 타임라인 보기: 확정일부터 출발 전까지 모든 기간을 시간순으로 표시
/// - 처음 들어오면 이번 기간 카드가 화면 가운데 오도록 스크롤
/// - 지난 기간은 완료한 항목만 표시 (못 한 항목은 이번 기간의 '지난 항목'으로 넘어온다.)
class MonthlyTimelineView extends StatefulWidget {
  const MonthlyTimelineView({
    super.key,
    required this.guide,
    required this.onTodoToggled,
  });

  final MonthlyGuide guide;
  final ValueChanged<String> onTodoToggled; // 체크한 할 일 id 전달

  @override
  State<MonthlyTimelineView> createState() => _MonthlyTimelineViewState();
}

class _MonthlyTimelineViewState extends State<MonthlyTimelineView> {
  static const double _rowGap = 12; // 기간 줄 사이 간격

  final GlobalKey _presentKey = GlobalKey(); // 이번 기간 카드 위치를 찾기 위한 키

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToPresent());
  }

  /// 이번 기간 카드를 감싼 스크롤 영역의 가운데로 들어오게 한다
  void _scrollToPresent() {
    final BuildContext? presentContext = _presentKey.currentContext;
    if (!mounted || presentContext == null) return;
    Scrollable.ensureVisible(presentContext, alignment: 0.5);
  }

  TimelinePeriodStatus _statusOf(int index) {
    final int current = widget.guide.currentIndex;
    if (index < current) return TimelinePeriodStatus.previous;
    if (index == current) return TimelinePeriodStatus.present;
    return TimelinePeriodStatus.upcoming;
  }

  @override
  Widget build(BuildContext context) {
    final List<MonthlyGuidePeriod> periods = widget.guide.periods;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _rowGap,
      children: [
        for (final (i, period) in periods.indexed)
          _buildPeriod(
            period,
            status: _statusOf(i),
            isLast: i == periods.length - 1,
          ),
      ],
    );
  }

  Widget _buildPeriod(
    MonthlyGuidePeriod period, {
    required TimelinePeriodStatus status,
    required bool isLast,
  }) {
    // 지난 기간은 완료한 항목만, 이번 기간&다가올 기간은 전부
    bool isVisible(MonthlyTodo todo) =>
        status != TimelinePeriodStatus.previous || todo.isCompleted;

    final MonthlyTodo? budget = period.budgetTodo;

    return MonthlyTodoCardTimelineView(
      key: status == TimelinePeriodStatus.present ? _presentKey : null,
      period: status,
      startDate: period.startDate,
      endDate: period.endDate,
      isLast: isLast,
      carryoverItems: [
        for (final todo in period.carryoverTodos.where(isVisible))
          _buildItem(todo, status, isCarriedOver: true),
      ],
      budgetItem: budget != null && isVisible(budget)
          ? _buildItem(budget, status)
          : null,
      reservationItems: [
        for (final todo in period.reservationTodos.where(isVisible))
          _buildItem(todo, status),
      ],
    );
  }

  Widget _buildItem(
    MonthlyTodo todo,
    TimelinePeriodStatus status, {
    bool isCarriedOver = false,
  }) {
    return TimelineViewItem(
      key: ValueKey(todo.id),
      type: todo.type,
      title: todo.title,
      period: status,
      caption: todo.caption,
      budgetStatus: todo.budgetStatus,
      isCompleted: todo.isCompleted,
      isCarriedOver: isCarriedOver,
      // 지난 기간 항목은 TimelineViewItem 안에서 체크가 막힘
      onCompletedChanged: (_) => widget.onTodoToggled(todo.id),
    );
  }
}