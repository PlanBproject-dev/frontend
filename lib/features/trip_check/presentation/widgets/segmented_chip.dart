import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 세그먼트 위치: 왼쪽 or 오른쪽
enum SegmentedChipSide {
  left,
  right,
}

class SegmentedChip extends StatelessWidget {
  const SegmentedChip({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.selected,
    this.onSelected,
  });

  final String leftText;                             // 왼쪽 세그먼트 텍스트
  final String rightText;                            // 오른쪽 세그먼트 텍스트
  final SegmentedChipSide? selected;                 // null이면 아무것도 선택 안 됨(not_selected)
  final ValueChanged<SegmentedChipSide>? onSelected; // 세그먼트를 누르면 해당 위치 전달. null이면 표시 전용

  static const Radius _radius = Radius.circular(12);

  @override
  Widget build(BuildContext context) {
    final bool isLeftSelected = selected == SegmentedChipSide.left;
    final bool isRightSelected = selected == SegmentedChipSide.right;

    return Row(
      children: [
        Expanded(
          child: _SegmentedItem(
            text: leftText,
            isSelected: isLeftSelected,
            borderRadius: const BorderRadius.horizontal(left: _radius),
            // 오른쪽이 선택되면 맞닿는 경계선은 오른쪽 칸이 그림
            hasLeftBorder: true,
            hasRightBorder: !isRightSelected,
            onTap: onSelected == null
                ? null
                : () => onSelected!(SegmentedChipSide.left),
          ),
        ),
        Expanded(
          child: _SegmentedItem(
            text: rightText,
            isSelected: isRightSelected,
            borderRadius: const BorderRadius.horizontal(right: _radius),
            hasLeftBorder: isRightSelected,
            hasRightBorder: true,
            onTap: onSelected == null
                ? null
                : () => onSelected!(SegmentedChipSide.right),
          ),
        ),
      ],
    );
  }
}

class _SegmentedItem extends StatelessWidget {
  const _SegmentedItem({
    required this.text,
    required this.isSelected,
    required this.borderRadius,
    required this.hasLeftBorder,
    required this.hasRightBorder,
    this.onTap,
  });

  final String text;
  final bool isSelected;
  final BorderRadius borderRadius;
  final bool hasLeftBorder;  // 왼쪽 테두리 표시 여부
  final bool hasRightBorder; // 오른쪽 테두리 표시 여부
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final BorderSide side = BorderSide(
      color: isSelected ? AppColors.blue500 : AppColors.gray100,
    );

    final item = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue100 : AppColors.white,
        borderRadius: borderRadius,
        border: Border(
          top: side,
          bottom: side,
          left: hasLeftBorder ? side : BorderSide.none,
          right: hasRightBorder ? side : BorderSide.none,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: isSelected
            ? AppTextStyles.labelSemiBold16.copyWith(color: AppColors.blue700)
            : AppTextStyles.labelMedium16.copyWith(color: AppColors.gray500),
      ),
    );

    return Semantics(
      button: true,
      selected: isSelected, // 스크린 리더에 선택 상태 전달
      child: onTap == null
          ? item
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: item,
            ),
    );
  }
}