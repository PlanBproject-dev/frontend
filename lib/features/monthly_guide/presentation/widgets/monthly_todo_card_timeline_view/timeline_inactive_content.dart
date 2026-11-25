import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card_timeline_view/timeline_section_list.dart';

/// 지난 / 다가올 기간: 카드 없이 한 줄 날짜 + 섹션 목록
class TimelineInactiveContent extends StatelessWidget {
  const TimelineInactiveContent({
    super.key,
    required this.dateRange,
    required this.sections,
  });

  final String dateRange;
  final List<List<Widget>> sections;

  // 이번 기간 카드에 비해, 지난&다가올 기간 카드는 너비가 좁음 -> 오른쪽을 비워 너비 비율 유지함.
  static const double _rightInset = 56;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: _rightInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12, // 날짜 ~ 섹션 간격
        children: [
          Text(
            dateRange,
            style: AppTextStyles.titleSemiBold16.copyWith(
              color: AppColors.gray500,
            ),
          ),
          if (sections.isNotEmpty)
            TimelineSectionList(
              sections: sections,
              sectionGap: 8,
              dividerPadding: 8,
            ),
        ],
      ),
    );
  }
}