import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/shared/widgets/feedback/tooltip_primary.dart';

/// 월별 가이드 상단 정보 박스 한 칸 (라벨 + 값)
/// [tooltipMessage]가 있으면 우측 상단에 안내 아이콘 표시 → 누르면 툴팁
class SummaryBox extends StatelessWidget {
  const SummaryBox({
    super.key,
    required this.label,
    required this.value,
    this.tooltipMessage,
  });

  final String label;
  final String value;
  final String? tooltipMessage;

  static const double _width = 140;
  static const double _radius = 24;
  static const double _iconSize = 20;
  static const double _iconInset = 6; // 아이콘 ~ 박스 위/오른쪽 끝 간격 (터치 여백으로도 사용)

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: _width,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.labelMedium14.copyWith(
                  color: AppColors.gray500,
                ),
              ),
              Text(
                value,
                textAlign: TextAlign.center,
                style: AppTextStyles.titleBold18.copyWith(
                  color: AppColors.gray800,
                ),
              ),
            ],
          ),
        ),
        if (tooltipMessage != null)
          Positioned(
            top: 0,
            right: 0,
            child: TooltipPrimary(
              message: tooltipMessage!,
              // 20px 아이콘이 작아서 둘레 6px까지 터치 영역으로 함
              child: Padding(
                padding: const EdgeInsets.all(_iconInset),
                child: SvgPicture.asset(
                  'assets/icons/ic_notice_20px.svg',
                  width: _iconSize,
                  height: _iconSize,
                ),
              ),
            ),
          ),
      ],
    );
  }
}