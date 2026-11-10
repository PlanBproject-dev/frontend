import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class BtnCheck extends StatelessWidget {
  const BtnCheck({
    super.key,
    required this.isSelected,
    this.onChanged,
  });

  final bool isSelected; // 선택 여부
  final ValueChanged<bool>? onChanged; // 탭하면 반대 값을 전달. null이면 표시 전용(탭 불가)

  @override
  Widget build(BuildContext context) {
    final circle = Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue500 : AppColors.gray50,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        'assets/icons/ic_check_24px.svg',
        width: 24,
        height: 24,
      ),
    );

    return Semantics(
      checked: isSelected, // 스크린 리더에 선택 상태 전달
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