import 'package:flutter/material.dart';

import 'package:plan_b/shared/widgets/cta.dart';

class CtaBinary extends StatelessWidget {
  const CtaBinary({
    super.key,
    required this.secondaryText,
    required this.primaryText,
    required this.onSecondaryPressed,
    required this.onPrimaryPressed,
    this.isPrimaryActive = true,
  });

  final String secondaryText; // 왼쪽 버튼 텍스트
  final String primaryText; // 오른쪽 버튼 텍스트
  final VoidCallback? onSecondaryPressed;
  final VoidCallback? onPrimaryPressed;
  final bool isPrimaryActive; // 오른쪽 버튼 활성화 여부 (왼쪽은 항상 활성)

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Cta(
        text: secondaryText,
        onPressed: onSecondaryPressed,
        variant: CtaVariant.secondary,
        isExpanded: false,  // 왼쪽 버튼: 가로 너비는 텍스트 + 좌우 패딩 24만큼만 차지하도록 (부모 너비만큼 늘어나지x)
      ),

      const SizedBox(width: 8), // 두 버튼 사이 간격 8만큼

      Expanded(
        child: Cta(
          text: primaryText,
          onPressed: onPrimaryPressed,
          isActive: isPrimaryActive,
          ),
        ),
      ],
    );
  }
}