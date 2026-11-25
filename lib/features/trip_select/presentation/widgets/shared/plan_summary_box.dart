import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/core/utils/text_wrap.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_card_palette.dart';

/// 한 줄 요약 박스
class PlanSummaryBox extends StatelessWidget {
  const PlanSummaryBox({
    super.key,
    required this.summary,
    required this.palette,
  });

  final String summary;
  final PlanCardPalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: palette.summaryBoxBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        summary.keepWord, // 단어 단위 줄바꿈 (한글이 단어 중간에서 잘리지 않게)
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyMedium16.copyWith(color: palette.summaryBoxText),
      ),
    );
  }
}