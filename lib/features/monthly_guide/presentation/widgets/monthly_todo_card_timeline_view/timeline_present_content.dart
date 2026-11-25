import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card_timeline_view/timeline_section_list.dart';

/// 이번 기간: 흰 카드
class TimelinePresentContent extends StatelessWidget {
  const TimelinePresentContent({
    super.key,
    required this.dateRange,
    required this.sections,
  });

  final String dateRange;
  final List<List<Widget>> sections;

  static const double _radius = 24;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: AppEffects.boxShadowLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20, // 날짜 ~ 섹션 간격
        children: [
          Text(
            dateRange,
            style: AppTextStyles.titleSemiBold20.copyWith(
              color: AppColors.black,
            ),
          ),
          if (sections.isNotEmpty)
            TimelineSectionList(
              sections: sections,
              sectionGap: 16,
              dividerPadding: 20,
              itemGap: 8,
            ),
        ],
      ),
    );
  }
}