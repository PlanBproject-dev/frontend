// 여행 플랜 카드(티켓·영수증·플래너) 공통: 비용 줄 / 점 / 점선 섹션 / 총 예상 비용

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/shared/models/trip_plan_cost_item.dart';
import 'package:plan_b/shared/widgets/divider/dashed_line.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_card_palette.dart';

/// 항목명 + 비용 한 줄 (항목명이 길면 줄바꿈, 비용은 첫 줄에 고정)
class PlanCostRow extends StatelessWidget {
  const PlanCostRow({
    super.key,
    required this.leading,
    required this.item,
    required this.palette,
  });

  PlanCostRow.labeled({
    super.key,
    required String label,
    required this.item,
    required this.palette,
  }) : leading = Text(
          label,
          style: AppTextStyles.bodyMedium16.copyWith(color: palette.itemLabel),
        );

  final Widget leading;
  final TripPlanCostItem item;
  final PlanCardPalette palette;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading,
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            item.title,
            style: AppTextStyles.bodyMedium16.copyWith(color: palette.itemTitle),
          ),
        ),
        const SizedBox(width: 6),
        SizedBox(
          height: 24,
          child: Center(
            child: Text(
              item.cost,
              textAlign: TextAlign.right,
              style: AppTextStyles.bodyMedium14.copyWith(color: palette.itemCost),
            ),
          ),
        ),
      ],
    );
  }
}

/// 주요 일정 앞의 점
class PlanBulletDot extends StatelessWidget {
  const PlanBulletDot({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 24,
      child: Center(
        child: SvgPicture.asset(asset, width: 8, height: 8),
      ),
    );
  }
}

/// 하단에 점선이 있는 섹션
class PlanDashedSection extends StatelessWidget {
  const PlanDashedSection({
    super.key,
    required this.color,
    required this.spacing,
    required this.children,
    this.bottomGap = 20, // 콘텐츠 ~ 점선 간격 (티켓·영수증 20 / 플래너 기본 정보 16)
  });

  final Color color;
  final double spacing;
  final List<Widget> children;
  final double bottomGap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: spacing,
          children: children,
        ),
        SizedBox(height: bottomGap),
        DashedLine(color: color),
      ],
    );
  }
}

/// 총 예상 비용 (인당) 한 줄 (기존 ticket_body의 _TotalCostRow를 공용으로 분리)
class PlanTotalCostRow extends StatelessWidget {
  const PlanTotalCostRow({
    super.key,
    required this.totalCost,
    required this.palette,
  });

  final String totalCost;
  final PlanCardPalette palette;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '총 예상 비용 (인당)',
          style: AppTextStyles.titleSemiBold18.copyWith(color: palette.totalLabel),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            totalCost,
            textAlign: TextAlign.right,
            style: AppTextStyles.titleSemiBold18.copyWith(color: palette.totalValue),
          ),
        ),
      ],
    );
  }
}
