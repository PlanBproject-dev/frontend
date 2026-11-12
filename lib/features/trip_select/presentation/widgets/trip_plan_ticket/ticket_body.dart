import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/ticket_cost_section.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/ticket_palette.dart';

/// 본문: 닫힘(태그) / 열림(플랜 요약) + 우측 상단 가격 스티커
class TicketBody extends StatelessWidget {
  const TicketBody({
    super.key,
    required this.plan,
    required this.isOpen,
    required this.palette,
  });

  final TripPlan plan;
  final bool isOpen;
  final TicketPalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: palette.bodyBg,
      child: Stack(
        children: [
          // 가격 스티커: 본문 우측 상단 기준 고정 (콘텐츠 뒤에 깔림)
          Positioned(
            top: 5,
            right: 15,
            child: SvgPicture.asset(palette.stickerAsset, width: 86, height: 86),
          ),
          isOpen
              ? _OpenContent(plan: plan, palette: palette)
              : _ClosedContent(tags: plan.tags, palette: palette),
        ],
      ),
    );
  }
}

/// 닫힘: #태그 목록
class _ClosedContent extends StatelessWidget {
  const _ClosedContent({required this.tags, required this.palette});

  final List<String> tags;
  final TicketPalette palette;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = AppTextStyles.labelMedium16.copyWith(color: palette.tag);

    return SizedBox(
      width: double.infinity,
      height: 96,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipRect(
            child: SizedBox(
              width: 160,
              child: Wrap(
                spacing: 8,
                runSpacing: 2,
                children: [
                  for (final tag in tags)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('#', style: style),
                        const SizedBox(width: 2),
                        Text(tag, style: style),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 열림: 여행 플랜 요약
class _OpenContent extends StatelessWidget {
  const _OpenContent({required this.plan, required this.palette});

  final TripPlan plan;
  final TicketPalette palette;

  @override
  Widget build(BuildContext context) {
    final p = palette;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: p.openContentSpacing,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              _SummaryTitle(palette: p),

              // 주요 일정
              TicketDashedSection(
                color: p.dashed,
                spacing: 6,
                children: [
                  for (final item in plan.highlights)
                    TicketCostRow(
                      leading: TicketBulletDot(asset: p.dotAsset),
                      item: item,
                      palette: p,
                    ),
                ],
              ),

              // 숙소 / 항공
              TicketDashedSection(
                color: p.dashed,
                spacing: 8,
                children: [
                  TicketCostRow.labeled(label: '숙소', item: plan.accommodation, palette: p),
                  TicketCostRow.labeled(label: '항공', item: plan.flight, palette: p),
                ],
              ),

              _TotalCostRow(totalCost: plan.totalCost, palette: p),
            ],
          ),
          _SummaryBox(summary: plan.summary, palette: p),
        ],
      ),
    );
  }
}

/// '여행 플랜 요약' 타이틀 (하단 실선)
class _SummaryTitle extends StatelessWidget {
  const _SummaryTitle({required this.palette});

  final TicketPalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: palette.summaryTitleBorder)),
      ),
      child: Text(
        '여행 플랜 요약',
        textAlign: TextAlign.center,
        style: AppTextStyles.titleSemiBold18.copyWith(color: palette.summaryTitle),
      ),
    );
  }
}

/// 총 예상 비용 (인당)
class _TotalCostRow extends StatelessWidget {
  const _TotalCostRow({required this.totalCost, required this.palette});

  final String totalCost;
  final TicketPalette palette;

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

/// 한 줄 요약 박스
class _SummaryBox extends StatelessWidget {
  const _SummaryBox({required this.summary, required this.palette});

  final String summary;
  final TicketPalette palette;

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