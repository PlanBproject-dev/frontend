import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/ticket_palette.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/dashed_line.dart';

/// 하단: 상세보기 / 닫기 (컨테이너 전체가 탭 영역)
class TicketFooter extends StatelessWidget {
  const TicketFooter({
    super.key,
    required this.isOpen,
    required this.palette,
    required this.onTap,
  });

  final bool isOpen;
  final TicketPalette palette;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      expanded: isOpen,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          color: palette.footerBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DashedLine(color: palette.footerBorder),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isOpen ? '닫기' : '상세보기',
                      style: AppTextStyles.bodySemiBold16.copyWith(color: palette.footerText),
                    ),
                    const SizedBox(width: 4),
                    // 기존 오른쪽 chevron 에셋을 회전해서 사용 (닫힘: 아래 / 열림: 위)
                    RotatedBox(
                      quarterTurns: isOpen ? 3 : 1,
                      child: SvgPicture.asset(palette.chevronAsset, width: 16, height: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}