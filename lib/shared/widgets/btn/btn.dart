import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

enum BtnVariant {
  primary,
  secondary,
}

enum BtnIconPosition {
  leading,  // 텍스트 앞에 아이콘 있는 경우
  trailing, // 텍스트 뒤에 아이콘 있는 경우
}

class Btn extends StatelessWidget {
  const Btn({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = BtnVariant.secondary,
    this.iconPosition = BtnIconPosition.leading,
  });

  final String text;                    // 버튼 텍스트
  final VoidCallback? onPressed;        // 탭 콜백
  final BtnVariant variant;             // primary, secondary
  final BtnIconPosition iconPosition;   // leading, trailing

  @override
  Widget build(BuildContext context) {
    final (Color background, Color textColor, String iconColor) = switch (variant) {
      BtnVariant.primary => (AppColors.blue300, AppColors.white, 'white'),
      BtnVariant.secondary => (AppColors.bgSolidBasic, AppColors.blue500, 'blue'),
    };

    final icon = switch (iconPosition) {
      BtnIconPosition.leading => SvgPicture.asset(
          'assets/icons/ic_add_24px_$iconColor.svg',
          width: 24,
          height: 24,
        ),
      BtnIconPosition.trailing => SvgPicture.asset(
          'assets/icons/ic_chevron_right_16px_$iconColor.svg',
          width: 16,
          height: 16,
        ),
    };

    final label = Flexible(
      child: Text(
        text,
        style: AppTextStyles.labelSemiBold16.copyWith(color: textColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return SizedBox(
      width: double.infinity, // 부모 너비를 꽉 채우도록
      height: 48, // 고정값 48

      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(12),

        // 탭할 때 나타나는 물결 효과가 둥근 모서리 밖으로 안 나가게 자름
        clipBehavior: Clip.antiAlias,

        // 탭을 감지하고 물결을 그림
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24), // 좌우 패딩 24
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconPosition == BtnIconPosition.leading) ...[
                  icon,
                  const SizedBox(width: 4),
                ],
                label,
                if (iconPosition == BtnIconPosition.trailing) ...[
                  const SizedBox(width: 4),
                  icon,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}