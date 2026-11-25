import 'package:flutter/material.dart';

import 'package:plan_b/features/monthly_guide/data/models/monthly_guide.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_todo.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_guide_summary/monthly_guide_summary.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_card.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_view_item/monthly_view_item.dart';

/// 월별 보기: 상단 요약 + 현재 기간 카드
class MonthlyMonthView extends StatelessWidget {
  const MonthlyMonthView({
    super.key,
    required this.guide,
    required this.onTodoToggled,
  });

  final MonthlyGuide guide;
  final ValueChanged<String> onTodoToggled; // 체크한 할 일 id 전달

  @override
  Widget build(BuildContext context) {
    final MonthlyGuidePeriod period = guide.currentPeriod;

    return Column(
      spacing: 12, // 요약 ~ 카드 간격
      children: [
        MonthlyGuideSummary(
          dDayLabel: guide.dDayLabel,
          totalBudgetLabel: guide.totalBudgetLabel,
        ),
        MonthlyTodoCard(
          period: period.type,
          dateRange: period.dateRangeLabel,
          remainingMonths: period.remainingMonths,
          // 넘어온 저축 목표는 제목만 표시되도록 isCarriedOver: true
          carryoverItems: [
            for (final todo in period.carryoverTodos)
              _buildItem(todo, isCarriedOver: true),
          ],
          budgetItem:
              period.budgetTodo == null ? null : _buildItem(period.budgetTodo!),
          reservationItems: [
            for (final todo in period.reservationTodos) _buildItem(todo),
          ],
        ),
      ],
    );
  }

  Widget _buildItem(MonthlyTodo todo, {bool isCarriedOver = false}) {
    return MonthlyViewItem(
      key: ValueKey(todo.id),
      type: todo.type,
      title: todo.title,
      caption: todo.caption,
      budgetStatus: todo.budgetStatus,
      isCompleted: todo.isCompleted,
      isCarriedOver: isCarriedOver,
      onCompletedChanged: (_) => onTodoToggled(todo.id),
    );
  }
}