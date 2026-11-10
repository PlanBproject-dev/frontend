import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class BtnToggle extends StatelessWidget {
  const BtnToggle({
    super.key,
    required this.isOn,
    this.onChanged,
  });

  final bool isOn; // 켜짐 여부
  final ValueChanged<bool>? onChanged; // 탭하면 반대 값을 전달. null이면 표시 전용(탭 불가)

  // 토글 모션
  static const Duration _duration = Duration(milliseconds: 200);
  static const Curve _curve = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {
    final toggle = AnimatedContainer(
      duration: _duration,
      curve: _curve,
      width: 48,
      height: 31,
      padding: const EdgeInsets.all(2),

      // 토글 배경: 색이 부드럽게 바뀜
      decoration: BoxDecoration(
        color: isOn ? AppColors.blue500 : AppColors.gray50,
        borderRadius: BorderRadius.circular(99),
      ),

      // 중앙 원(토글 스위치): 좌우로 미끄러지듯 이동
      child: AnimatedAlign(
        duration: _duration,
        curve: _curve,
        alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              // 토글 스위치의 그림자: 별도로 정의해둔 effect style 적용X
              BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 1),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );

    return Semantics(
      toggled: isOn, // 스크린 리더에 켜짐, 꺼짐 상태 전달
      child: onChanged == null
          ? toggle
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged!(!isOn),
              child: toggle,
            ),
    );
  }
}