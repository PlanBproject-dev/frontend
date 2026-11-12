import 'package:flutter/material.dart';

import 'package:plan_b/features/trip_select/data/models/budget_level.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_footer.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_highlight_ellipse.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_summary_box.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_receipt/receipt_details.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_receipt/receipt_edge.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_receipt/receipt_palette.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_receipt/receipt_summary.dart';

class TripPlanReceipt extends StatefulWidget {
  const TripPlanReceipt({
    super.key,
    required this.plan,
    required this.budgetLevel,
    required this.isSelected,
    this.onSelectedChanged,
    this.initiallyOpen = false,
  });

  final TripPlan plan;
  final BudgetLevel budgetLevel; // 고/중/저예산 태그
  final bool isSelected;         // 선택 여부 (부모가 관리)
  final ValueChanged<bool>? onSelectedChanged; // btn_check 탭 시에만 호출. null이면 선택 불가(표시 전용)
  final bool initiallyOpen;      // 처음에 상세가 열린 상태로 보여줄지

  @override
  State<TripPlanReceipt> createState() => _TripPlanReceiptState();
}

class _TripPlanReceiptState extends State<TripPlanReceipt> {
  late bool _isOpen = widget.initiallyOpen;

  void _toggleOpen() => setState(() => _isOpen = !_isOpen);

  @override
  Widget build(BuildContext context) {
    final bool selected = widget.isSelected;
    final ReceiptPalette palette = ReceiptPalette.of(selected);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 본문 (ellipse는 콘텐츠 뒤에 깔림, 본문 밖은 잘림)
        Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              color: palette.base.bodyBg,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: ReceiptPalette.openContentSpacing,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      ReceiptSummary(
                        plan: widget.plan,
                        budgetLevel: widget.budgetLevel,
                        isSelected: selected,
                        isOpen: _isOpen,
                        palette: palette,
                        onSelectedChanged: widget.onSelectedChanged,
                      ),
                      if (_isOpen) ReceiptDetails(plan: widget.plan, palette: palette.base),
                    ],
                  ),
                  if (_isOpen)
                    PlanSummaryBox(summary: widget.plan.summary, palette: palette.base),
                ],
              ),
            ),
            if (selected) const PlanHighlightEllipse(top: -281),
          ],
        ),

        // 상세보기 / 닫기 (컨테이너 전체가 탭 영역, 탭 모션 없음)
        PlanCardFooter(
          isOpen: _isOpen,
          palette: palette.base,
          onTap: _toggleOpen,
          verticalPadding: 10,
        ),

        // 하단 톱니 가장자리
        ReceiptEdge(color: palette.base.footerBg),
      ],
    );
  }
}