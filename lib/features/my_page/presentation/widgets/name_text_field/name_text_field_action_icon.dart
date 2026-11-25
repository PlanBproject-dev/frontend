import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 이름 편집 필드의 오른쪽 아이콘
/// - 기본: 연필 아이콘 (누르면 편집 시작)
/// - 완료: 초록 체크 아이콘 (표시 전용, 탭 불가)
class NameTextFieldActionIcon extends StatelessWidget {
  const NameTextFieldActionIcon({
    super.key,
    required this.isSuccess,
    required this.onTap,
  });

  final bool isSuccess;    // true면 체크, false면 연필
  final VoidCallback onTap; // 연필 아이콘을 누를 때

  static const double _padding = 6;
  static const double _size = 24;
  static const double _opacity = 0.6;
  static const Duration _duration = Duration(milliseconds: 200);

  static const String _writeIcon = 'assets/icons/ic_write_24px.svg';
  static const String _checkIcon = 'assets/icons/ic_check_24px_green.svg';

  @override
  Widget build(BuildContext context) {
    final Widget icon = Opacity(
      opacity: _opacity,
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: AnimatedSwitcher(
          duration: _duration,
          child: SvgPicture.asset(
            isSuccess ? _checkIcon : _writeIcon,
            key: ValueKey(isSuccess),
            width: _size,
            height: _size,
          ),
        ),
      ),
    );

    if (isSuccess) return icon;

    return Semantics(
      button: true,
      label: '이름 수정',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: icon,
      ),
    );
  }
}