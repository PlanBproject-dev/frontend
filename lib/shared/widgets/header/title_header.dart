import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

enum TitleHeaderSize { lg, md }
enum TitleHeaderAlign { start, center }

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.size = TitleHeaderSize.lg,
    this.align = TitleHeaderAlign.start,
  });

  final String title;
  final String? subtitle;     // null이면 소제목 없이 제목만 표시하도록
  final TitleHeaderSize size; // lg: 24px 제목 크기, md: 22px 제목 크기.
  final TitleHeaderAlign align; // start: 왼쪽 정렬 / center: 가운데 정렬

  @override
  Widget build(BuildContext context) {
    final titleStyle = switch (size) {
      TitleHeaderSize.lg => AppTextStyles.titleBold24,
      TitleHeaderSize.md => AppTextStyles.titleBold22,
    };

    final textAlign = switch (align) {
      TitleHeaderAlign.start => TextAlign.start,
      TitleHeaderAlign.center => TextAlign.center,
    };

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,   // 제목-소제목 간의 간격
          children: [
            Text(
              title,
              style: titleStyle.copyWith(color: AppColors.black),
              textAlign: textAlign,
            ),
            // 소제목 있을 경우
            if (subtitle != null)
              Text(
                subtitle!,
                style: AppTextStyles.titleMedium18.copyWith(
                  color: AppColors.gray600,
                ),
                textAlign: textAlign,
              ),
          ],
        ),
      ),
    );
  }
}