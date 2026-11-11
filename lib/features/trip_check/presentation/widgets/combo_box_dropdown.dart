import 'dart:math' show min;

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 콤보박스의 드롭다운 목록 UI
class ComboBoxDropdown extends StatelessWidget {
  const ComboBoxDropdown({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
    this.scrollController,
    this.maxListHeight = defaultMaxListHeight,
  });

  static const double itemHeight = 56;  // 항목 높이 (상하 패딩 16 + 줄 높이 24)
  static const int maxVisibleItems = 4; // 한 번에 보이는 최대 항목 수
  static const double padding = 12;     // 드롭다운 안쪽 여백
  static const double _borderWidth = 1;
  static const double defaultMaxListHeight = itemHeight * maxVisibleItems;

  /// 목록 바깥 여백 + 테두리 (위아래 합)
  static const double frameHeight = (padding + _borderWidth) * 2;

  /// 드롭다운 아이템 수에 따른 드롭다운 전체 높이
  static double heightFor(int itemCount) =>
      min(itemCount * itemHeight, defaultMaxListHeight) + frameHeight;

  final List<String> items;                   // 표시할 항목
  final String? selected;                     // 현재 선택된 값 (배경 강조)
  final ValueChanged<String> onSelect;        // 항목 탭
  final ScrollController? scrollController;   // 열 때 선택 위치로 스크롤하기 위함
  final double maxListHeight;                 // 목록 최대 높이 (공간이 부족하면 줄어듦)

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray50, width: _borderWidth),
        boxShadow: AppEffects.boxShadowLg,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxListHeight),
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: items.length > maxVisibleItems, // 4개를 넘을 때만 항상 표시
          child: ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _ComboBoxItem(
                text: item,
                isSelected: item == selected,
                onTap: () => onSelect(item),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 드롭다운 아이템
class _ComboBoxItem extends StatelessWidget {
  const _ComboBoxItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected; // 현재 선택된 값이면 배경 강조
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          height: ComboBoxDropdown.itemHeight,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue50 : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.labelMedium16.copyWith(color: AppColors.black),
          ),
        ),
      ),
    );
  }
}