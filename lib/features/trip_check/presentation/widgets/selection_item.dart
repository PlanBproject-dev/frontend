import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class SelectionItem extends StatelessWidget {
  const SelectionItem({
    super.key,
    required this.budget,
    required this.caption,
    required this.isSelected,
    this.onTap,
  });

  final String budget;       // 왼쪽 ₩₩₩만원 텍스트
  final String caption;      // 오른쪽 설명 텍스트
  final bool isSelected;     // 해당 아이템 선택 여부
  final VoidCallback? onTap; // 탭 콜백. null이면 표시 전용(탭 불가)

  static const double _radius = 12;
  static const double _gap = 12; // 가격과 설명 텍스트 사이 간격

  @override
  Widget build(BuildContext context) {
    final item = Container(
      width: double.infinity, // 부모 너비를 꽉 채우도록
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue100 : AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(
          color: isSelected ? AppColors.blue500 : AppColors.gray200,
        ),
      ),
      child: Row(
        children: [
          // 가격 텍스트 ('₩₩₩만원')
          Text(
            budget,
            maxLines: 1,
            style: AppTextStyles.labelSemiBold16.copyWith(
              color: isSelected ? AppColors.blue800 : AppColors.black,
            ),
          ),
          const SizedBox(width: _gap),

          // 설명: 남은 공간에서 오른쪽 정렬
          Expanded(
            child: Text(
              caption,
              textAlign: TextAlign.right,
              style: AppTextStyles.labelMedium14.copyWith(
                color: isSelected ? AppColors.blue700 : AppColors.gray500,
              ),
            ),
          ),
        ],
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