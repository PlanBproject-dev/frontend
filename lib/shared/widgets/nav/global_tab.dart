import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class GlobalTab extends StatefulWidget {
  const GlobalTab({
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
  State<GlobalTab> createState() => _GlobalTabState();
}

class _GlobalTabState extends State<GlobalTab> {
  static const double _iconSize = 24;   // 탭 아이콘 사이즈: 24

  // 눌림 피드백 값
  static const double _pressedOpacity = 0.5;
  static const double _pressedScale = 0.94;
  static const Duration _pressDuration = Duration(milliseconds: 80); // 누를 때는 빠르게
  static const Duration _releaseDuration = Duration(milliseconds: 160); // 뗄 때는 부드럽게

  bool _isPressed = false;

  void _setPressed(bool value) {
    if (widget.onTap == null || _isPressed == value) return;
    setState(() => _isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final duration = _isPressed ? _pressDuration : _releaseDuration;

    return Semantics(
      button: true,
      selected: widget.isActive,   // 스크린 리더에 선택 상태 전달
      label: widget.tabName,
      excludeSemantics: true,   // 내부 텍스트가 중복으로 읽히지 않게
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,   // 탭 영역 전체
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) => _setPressed(false),
        onTapCancel: () => _setPressed(false),  // 누른 채로 손가락이 밖으로 벗어났을 때
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: AnimatedOpacity(
            opacity: _isPressed ? _pressedOpacity : 1,
            duration: duration,
            curve: Curves.easeOut,
            child: AnimatedScale(
              scale: _isPressed ? _pressedScale : 1,
              duration: duration,
              curve: Curves.easeOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
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