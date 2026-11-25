import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_todo_type.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_view_item/monthly_budget_status.dart';

/// 전체 타임라인 할 일 항목의 텍스트 영역
class TimelineViewItemContent extends StatelessWidget {
  const TimelineViewItemContent({
    super.key,
    required this.type,
    required this.title,
    this.caption,
    this.budgetStatus,
    this.showBudgetStatus = true,
  });

  final MonthlyTodoType type;
  final String title;
  final String? caption;       // reservation 전용
  final String? budgetStatus;  // budget 전용
  final bool showBudgetStatus; // budget 전용, 목표 누적 줄 표시 여부 (이월된 항목은 표시 안 함)

  static const double _titleTopPadding = 2;
  static const double _captionTopPadding = 6;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      MonthlyTodoType.reservation => _buildReservation(),
      MonthlyTodoType.budget => _buildBudget(),
    };
  }

  Text get _title => Text(
        title,
        style: AppTextStyles.titleSemiBold16.copyWith(
          color: AppColors.gray700,
        ),
      );

  /// 제목(남는 너비 전부) + 설명(오른쪽, 내용 너비만큼)
  Widget _buildReservation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: _titleTopPadding),
            child: _title,
          ),
        ),
        if (caption != null)
          Padding(
            padding: const EdgeInsets.only(top: _captionTopPadding),
            child: Text(
              caption!,
              style: AppTextStyles.captionMedium12.copyWith(
                color: AppColors.gray500,
              ),
            ),
          ),
      ],
    );
  }

  /// 제목 + 목표 누적 (이월된 예산 모으기 목표는 제목만)
  Widget _buildBudget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _titleTopPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          _title,
          if (showBudgetStatus && budgetStatus != null)
            MonthlyBudgetStatus(status: budgetStatus!),
        ],
      ),
    );
  }
}