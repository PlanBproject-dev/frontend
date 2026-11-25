import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_todo_type.dart';
import 'package:plan_b/features/monthly_guide/data/models/timeline_period_status.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_view_item/btn_monthly_check.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/timeline_view_item/timeline_view_item_content.dart';

/// 전체 타임라인의 할 일 항목 (timeline_view_item)
class TimelineViewItem extends StatelessWidget {
  const TimelineViewItem({
    super.key,
    required this.type,
    required this.title,
    required this.period,
    this.caption,
    this.budgetStatus,
    this.isCompleted = false,
    this.isCarriedOver = false,
    this.onCompletedChanged,
  });

  final MonthlyTodoType type;
  final String title;
  final TimelinePeriodStatus period;
  final String? caption;       // reservation 전용 설명
  final String? budgetStatus;  // budget 전용 누적 금액 문구
  final bool isCompleted;      // 완료 여부
  final bool isCarriedOver;    // 지난 기간에서 넘어온 항목인지 (budget이면 제목만 표시)
  final ValueChanged<bool>? onCompletedChanged; // 체크 버튼 탭 콜백 (null이거나 지난 기간이면 표시 전용)

  static const double _radius = 16;
  static const double _checkTextGap = 10;
  static const double _horizontalPadding = 16;
  static const double _verticalPadding = 12;

  bool get _isPresent => period == TimelinePeriodStatus.present;
  bool get _isCarriedOverBudget =>
      type == MonthlyTodoType.budget && isCarriedOver;

  /// 지난 기간 항목은 체크 변경 불가 (표시 전용)
  bool get _isCheckable => period != TimelinePeriodStatus.previous;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _isPresent ? _horizontalPadding : 0,
        vertical: _verticalPadding,
      ),
      decoration: _isPresent
          ? BoxDecoration(
              color: AppColors.bgSolidBasic,
              borderRadius: BorderRadius.circular(_radius),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: _checkTextGap,
        children: [
          BtnMonthlyCheck(
            isSelected: isCompleted,
            onChanged: _isCheckable ? onCompletedChanged : null,
          ),
          Expanded(
            child: TimelineViewItemContent(
              type: type,
              title: title,
              caption: caption,
              budgetStatus: budgetStatus,
              showBudgetStatus: !_isCarriedOverBudget,
            ),
          ),
        ],
      ),
    );
  }
}