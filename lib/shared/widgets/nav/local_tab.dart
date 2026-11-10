import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class LocalTab extends StatefulWidget {
  const LocalTab({
    super.key,
    required this.tabName,
    required this.activeIconPath,
    required this.inactiveIconPath,
    required this.isActive,
    this.onTap,
  });

  final String tabName;           // 탭 이름
  final String activeIconPath;    // 활성 상태 아이콘
  final String inactiveIconPath;  // 비활성 상태 아이콘
  final bool isActive;            // 현재 선택된 탭인지 여부
  final VoidCallback? onTap;      // null이면 표시 전용(탭 불가)

  @override
  State<LocalTab> createState() => _LocalTabState();
}

class _LocalTabState extends State<LocalTab> {
  static const double _iconSize = 24;   // 탭 아이콘 사이즈: 24

  // 눌림 피드백 값 (GlobalTab과 동일)
  static const double _pressedOpacity = 0.5;
  static const double _pressedScale = 0.94;
  static const Duration _pressDuration = Duration(milliseconds: 80);
  static const Duration _releaseDuration = Duration(milliseconds: 160);

  bool _isPressed = false;

  void _setPressed(bool value) {
    if (widget.onTap == null || _isPressed == value) return;
    setState(() => _isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final pressDuration = _isPressed ? _pressDuration : _releaseDuration;

    return Semantics(
      button: true,
      selected: widget.isActive,
      label: widget.tabName,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) => _setPressed(false),
        onTapCancel: () => _setPressed(false),
        onTap: widget.onTap,

        // 활성 배경: 흰색 캡슐이 부드럽게 나타나고 사라짐
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),

          // 눌림 피드백: 아이콘, 텍스트에만 적용
          child: AnimatedOpacity(
            opacity: _isPressed ? _pressedOpacity : 1,
            duration: pressDuration,
            curve: Curves.easeOut,
            child: AnimatedScale(
              scale: _isPressed ? _pressedScale : 1,
              duration: pressDuration,
              curve: Curves.easeOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    widget.isActive
                      ? widget.activeIconPath
                      : widget.inactiveIconPath,
                    width: _iconSize,
                    height: _iconSize,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.tabName,
                    style: widget.isActive
                      ? AppTextStyles.labelSemiBold12.copyWith(
                        color: AppColors.gray500,
                        )
                      : AppTextStyles.labelMedium12.copyWith(
                       color: AppColors.gray300,
                      ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}