import 'package:flutter/material.dart';

import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_guide_summary/summary_box.dart';

/// 월별 가이드 상단: 여행까지 남은 기간 + 목표 총 예산
/// - 기본은 박스 140 고정 (총 286임)
/// - 화면이 286보다 좁으면 두 박스가 남은 너비를 반씩 나눠 채운다.
class MonthlyGuideSummary extends StatelessWidget {
  const MonthlyGuideSummary({
    super.key,
    required this.dDayLabel,
    required this.totalBudgetLabel,
  });

  final String dDayLabel;        // D-92
  final String totalBudgetLabel; // 약 235만원

  static const String _budgetTooltip =
      '예상 비용 범위의 중간 기준으로\n목표 예산을 추천해요.';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        // Flexible: 공간이 충분하면 SummaryBox 원래 너비(140), 부족하면 나눠 받은 너비로 줄어듦
        Flexible(
          child: SummaryBox(label: '여행까지 남은 기간', value: dDayLabel),
        ),
        Flexible(
          child: SummaryBox(
            label: '목표 총 예산',
            value: totalBudgetLabel,
            tooltipMessage: _budgetTooltip,
          ),
        ),
      ],
    );
  }
}