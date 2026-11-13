// 텍스트 + 우측 화살표로 구성된 텍스트 버튼

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

enum BtnTextSize {
  lg,
  sm,
}

class BtnTextPrimary extends StatelessWidget {
  const BtnTextPrimary({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = BtnTextSize.lg,
  });

  final String text;              // 버튼 텍스트
  final VoidCallback? onPressed;  // 탭 콜백
  final BtnTextSize size;         // lg, sm

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = switch (size) {
      BtnTextSize.lg => AppTextStyles.bodySemiBold16,
      BtnTextSize.sm => AppTextStyles.bodySemiBold14,
    };

    return Semantics(
      button: true,
      label: text,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min, // 내용 크기만큼만 차지하도록
          children: [
            Flexible(
              child: Text(
                text,
                style: textStyle.copyWith(color: AppColors.blue500),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 2), // 텍스트 <-> 아이콘 간격 2
            SvgPicture.asset(
              'assets/icons/ic_chevron_right_16px_blue.svg',
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}