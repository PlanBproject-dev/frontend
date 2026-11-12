import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_palette.dart';
import 'package:plan_b/shared/widgets/divider/dashed_line.dart';

/// 하단: 상세보기 / 닫기 (컨테이너 전체가 탭 영역)
class PlanCardFooter extends StatelessWidget {
  const PlanCardFooter({
    super.key,
    required this.isOpen,
    required this.palette,
    required this.onTap,
    this.verticalPadding = 16,  // 티켓 16, 영수증 10
  });

  final bool isOpen;
  final PlanCardPalette palette;
  final VoidCallback onTap;
  final double verticalPadding;

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
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
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