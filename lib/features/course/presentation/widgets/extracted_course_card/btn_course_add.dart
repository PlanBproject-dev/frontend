// 추출된 코스 카드) 우측 상단 '+' 버튼 (해당 코스를 내 코스에 추가)

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class BtnCourseAdd extends StatelessWidget {
  const BtnCourseAdd({super.key, required this.onPressed});

  final VoidCallback? onPressed; // null이면 비활성

  static const double _iconSize = 24;
  static const double _borderWidth = 2;
  static const double _disabledOpacity = 0.4;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;

    return Semantics(
      button: true,
      enabled: enabled,
      label: '내 코스에 추가',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Opacity(
          opacity: enabled ? 1 : _disabledOpacity,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.blue500, width: _borderWidth),
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_add_24px_blue.svg',
              width: _iconSize,
              height: _iconSize,
            ),
          ),
        ),
      ),
    );
  }
}