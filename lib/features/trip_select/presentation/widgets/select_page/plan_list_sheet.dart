// 여행 고르기 하단 파란 시트 (상단 라운드 68 + bg_top_gradient)
// - 하단 cta 영역 뒤까지 파란 배경이 이어지도록 아래 여백에 하단 인셋을 추가했음.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class PlanListSheet extends StatelessWidget {
  const PlanListSheet({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<Widget> children; // 티켓 or 영수증 (+ 더보기 버튼)

  static const double _topRadius = 68;
  static const double _gradientHeight = 588;
  static const double _bottomGap = 72; // 마지막 카드 ~ cta 영역

  @override
  Widget build(BuildContext context) {
    // Scaffold.extendBody: true → 하단 cta 영역 높이가 padding.bottom으로 들어옴
    final double bottomInset = MediaQuery.paddingOf(context).bottom;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(_topRadius)),
      child: ColoredBox(
        color: AppColors.blue100,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: _gradientHeight,
              child: IgnorePointer(
                child: SvgPicture.asset(
                  'assets/backgrounds/bg_top_gradient.svg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 60, 24, _bottomGap + bottomInset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 36,
                children: [
                  Column(
                    spacing: 2,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleSemiBold20.copyWith(color: AppColors.blue900),
                      ),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium16.copyWith(color: AppColors.gray600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 24,
                    children: children,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}