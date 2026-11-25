import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

/// 타임라인 카드 안의 섹션 목록 (지난 항목 / 예산 목표 / 준비 항목)
class TimelineSectionList extends StatelessWidget {
  const TimelineSectionList({
    super.key,
    required this.sections,
    required this.sectionGap,
    required this.dividerPadding,
    this.itemGap = 0,
  });

  final List<List<Widget>> sections; // 섹션별 항목 위젯 목록
  final double sectionGap;           // 구분선 ~ 다음 섹션 간격
  final double dividerPadding;       // 섹션 마지막 항목 ~ 구분선 간격
  final double itemGap;              // 섹션 안 항목 사이 간격

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: sectionGap,
      children: [
        for (final (i, items) in sections.indexed)
          _buildSection(items, hasDivider: i < sections.length - 1),
      ],
    );
  }

  Widget _buildSection(List<Widget> items, {required bool hasDivider}) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: itemGap,
      children: items,
    );

    if (!hasDivider) return content;

    return Container(
      padding: EdgeInsets.only(bottom: dividerPadding),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray200)),
      ),
      child: content,
    );
  }
}