import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_footer.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_palette.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_highlight_ellipse.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/ticket_body.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/ticket_header.dart';

class TripPlanTicket extends StatefulWidget {
  const TripPlanTicket({
    super.key,
    required this.plan,
    required this.isSelected,
    this.onSelectedChanged,
    this.initiallyOpen = false,
  });

  final TripPlan plan;
  final bool isSelected;    // 선택 여부 (부모가 관리)
  final ValueChanged<bool>? onSelectedChanged; // btn_check 탭 시에만 호출. null이면 선택 불가(표시 전용)
  final bool initiallyOpen; // 처음에 상세가 열린 상태로 보여줄지

  @override
  State<TripPlanTicket> createState() => _TripPlanTicketState();
}

class _TripPlanTicketState extends State<TripPlanTicket> {
  late bool _isOpen = widget.initiallyOpen;

  // 티켓 상단(헤더+본문) / 하단(상세보기or닫기) 모서리
  static const BorderRadius _topRadius = BorderRadius.only(
    topLeft: Radius.circular(6),
    topRight: Radius.circular(6),
    bottomLeft: Radius.circular(12),
    bottomRight: Radius.circular(12),
  );
  static const BorderRadius _bottomRadius = BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
    bottomLeft: Radius.circular(6),
    bottomRight: Radius.circular(6),
  );

  void _toggleOpen() => setState(() => _isOpen = !_isOpen);

  @override
  Widget build(BuildContext context) {
    final bool selected = widget.isSelected;
    final PlanCardPalette palette = PlanCardPalette.of(selected);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: selected ? AppEffects.boxShadowMd : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 상단: 헤더 + 본문
          ClipRRect(
            borderRadius: _topRadius,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TicketHeader(
                      plan: widget.plan,
                      isSelected: selected,
                      palette: palette,
                      onSelectedChanged: widget.onSelectedChanged,
                    ),
                    TicketBody(plan: widget.plan, isOpen: _isOpen, palette: palette),
                  ],
                ),
                if (selected) const PlanHighlightEllipse(),
              ],
            ),
          ),

          // 하단: 상세보기 / 닫기
          ClipRRect(
            borderRadius: _bottomRadius,
            child: Stack(
              children: [
                PlanCardFooter(isOpen: _isOpen, palette: palette, onTap: _toggleOpen),
                if (selected && !_isOpen) const PlanHighlightEllipse(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}