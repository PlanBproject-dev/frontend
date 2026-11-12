import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_palette.dart';

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
        summary,
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyMedium16.copyWith(color: palette.summaryBoxText),
      ),
    );
  }
}