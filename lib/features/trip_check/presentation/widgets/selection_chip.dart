import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class SelectionChip extends StatelessWidget {
  const SelectionChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.isHashtag = false,
    this.onChanged,
  });

  final String text;                   // 칩 내부 텍스트
  final bool isSelected;               // 선택 여부
  final bool isHashtag;                // 텍스트 앞의 아이콘: '#'인지 여부 ('#'가 아닐 경우 체크 아이콘이 들어감)
  final ValueChanged<bool>? onChanged; // 탭하면 반대 값을 전달. null이면 표시 전용(탭 불가)

  @override
  Widget build(BuildContext context) {
    final Color background = isSelected ? AppColors.blue100 : AppColors.white;
    final Color borderColor = isSelected ? AppColors.blue500 : AppColors.gray200;
    final Color textColor = isSelected ? AppColors.blue700 : AppColors.gray500;
    final Color hashColor = isSelected ? AppColors.blue400 : AppColors.gray300;

    // 체크 아이콘이 붙는 경우만 왼쪽 패딩 16임
    final bool showCheck = isSelected && !isHashtag;
    final EdgeInsets padding = EdgeInsets.fromLTRB(showCheck ? 16 : 20, 12, 20, 12);

    final TextStyle textStyle = AppTextStyles.labelMedium16;

    final chip = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // 텍스트 길이에 맞게
        children: [
          if (showCheck) ...[
            SvgPicture.asset(
              'assets/icons/ic_check_16px.svg',
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
          ],
          if (isHashtag) ...[
            Text('#', style: textStyle.copyWith(color: hashColor)),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: textStyle.copyWith(color: textColor),
            maxLines: 1,
          ),
        ],
      ),
    );

    return Semantics(
      button: true,
      selected: isSelected, // 스크린 리더에 선택 상태 전달
      child: onChanged == null
          ? chip
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged!(!isSelected),
              child: chip,
            ),
    );
  }
}