import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_todo_type.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_view_item/btn_monthly_check.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_view_item/monthly_view_item_content.dart';

/// 월별 여행 준비 가이드의 할 일 항목
class MonthlyViewItem extends StatelessWidget {
  const MonthlyViewItem({
    super.key,
    required this.type,
    required this.title,
    this.caption,
    this.budgetStatus,
    this.isCompleted = false,
    this.isCarriedOver = false,
    this.onCompletedChanged,
  });

  final MonthlyTodoType type;
  final String title;
  final String? caption;       // reservation 전용 설명
  final String? budgetStatus;  // budget 전용 누적 금액 문구
  final bool isCompleted;      // 완료 여부
  final bool isCarriedOver;    // "지난 기간"에서 넘어온 저축 목표인지 (budget 전용)
  final ValueChanged<bool>? onCompletedChanged; // 체크 버튼 탭 콜백

  static const double _radius = 24;
  static const double _checkTextGap = 10;
  static const EdgeInsets _padding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);

  /// 이월된 저축 목표는 제목만 보여주고 체크 버튼과 세로 가운데 정렬
  bool get _isCarriedOverBudget =>
      type == MonthlyTodoType.budget && isCarriedOver;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: isCompleted ? AppColors.white : AppColors.white75,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Row(
        crossAxisAlignment: _isCarriedOverBudget
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        spacing: _checkTextGap,
        children: [
          BtnMonthlyCheck(
            isSelected: isCompleted,
            onChanged: onCompletedChanged,
          ),
          Expanded(
            child: MonthlyViewItemContent(
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