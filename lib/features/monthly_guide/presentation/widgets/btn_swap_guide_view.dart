import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/monthly_guide/data/models/guide_view_type.dart';

/// 전체 타임라인 or 월별 가이드 보기 전환 버튼
class BtnSwapGuideView extends StatelessWidget {
  const BtnSwapGuideView({
    super.key,
    required this.viewType,
    this.onTap,
  });

  final GuideViewType viewType; // 버튼에 표시할 보기 종류
  final VoidCallback? onTap;    // 탭 콜백. null이면 표시 전용

  static const BorderRadius _radius = BorderRadius.all(Radius.circular(16));
  static const EdgeInsets _padding =
      EdgeInsets.only(left: 16, right: 20, top: 10, bottom: 10);
  static const double _iconSize = 24;
  static const double _iconTextGap = 8;

  @override
  Widget build(BuildContext context) {
    // 그림자는 ClipRRect 바깥에 그려야 잘리지 않음
    final button = DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: _radius,
        boxShadow: AppEffects.boxDimmedLightLgShadow,
      ),
      child: ClipRRect(
        borderRadius: _radius, // 블러가 버튼 모양 안에서만 적용되도록
        child: BackdropFilter(
          filter: AppEffects.boxDimmedLightLgBlur,
          child: Container(
            color: AppColors.white75,
            padding: _padding,
            child: Row(
              mainAxisSize: MainAxisSize.min, // 너비는 글자 길이에 맞춤
              spacing: _iconTextGap,
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_swap_24px.svg',
                  width: _iconSize,
                  height: _iconSize,
                ),
                Text(
                  viewType.label,
                  style: AppTextStyles.labelMedium16.copyWith(
                    color: AppColors.gray600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Semantics(
      button: true,
      label: viewType.label,
      child: onTap == null
          ? button
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: button,
            ),
    );
  }
}