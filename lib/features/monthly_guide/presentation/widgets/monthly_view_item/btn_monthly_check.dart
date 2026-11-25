import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';

/// 월별 가이드 할 일 완료 체크 버튼
class BtnMonthlyCheck extends StatelessWidget {
  const BtnMonthlyCheck({
    super.key,
    required this.isSelected,
    this.onChanged,
  });

  final bool isSelected; // 선택(완료) 여부
  final ValueChanged<bool>? onChanged; // 탭하면 반대 값 전달. null이면 표시 전용

  static const double size = 28;
  static const double _iconSize = 24;
  static const double _borderWidth = 2;

  @override
  Widget build(BuildContext context) {
    final circle = Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.gray300 : null,
        border: isSelected
            ? null
            : Border.all(color: AppColors.gray100, width: _borderWidth),
      ),
      child: SvgPicture.asset(
        isSelected
            ? 'assets/icons/ic_check_24px_white.svg'
            : 'assets/icons/ic_check_24px_gray.svg',
        width: _iconSize,
        height: _iconSize,
      ),
    );

    return Semantics(
      checked: isSelected,
      child: onChanged == null
          ? circle
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged!(!isSelected),
              child: circle,
            ),
    );
  }
}