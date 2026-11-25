// 메인 세그먼트(main_segemented_control.dart)의 각 칸

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/home/presentation/widgets/main_segmented_control/main_segmented_control.dart';

class MainSegmentedItem extends StatelessWidget {
  const MainSegmentedItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected, // 스크린 리더에 선택 상태 전달
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: AnimatedDefaultTextStyle(
            // 인디케이터 이동과 같은 시간, 곡선으로 글자 색 및 굵기 전환
            duration: MainSegmentedControl.duration,
            curve: MainSegmentedControl.curve,
            style: isSelected
                ? AppTextStyles.labelSemiBold14.copyWith(color: AppColors.gray800)
                : AppTextStyles.labelMedium14.copyWith(color: AppColors.gray400),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}