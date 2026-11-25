// 코스 추가 화면) 링크 입력 필드 목록 + '링크 추가' 버튼

import 'package:flutter/material.dart';

import 'package:plan_b/features/course/presentation/widgets/link_text_field.dart';
import 'package:plan_b/shared/widgets/btn/btn.dart';

class LinkInputSection extends StatelessWidget {
  const LinkInputSection({
    super.key,
    required this.controllers,
    required this.onChanged,
    required this.onFieldFocusLost,
    required this.onAddPressed,
    this.autofocusTarget,
  });

  final List<TextEditingController> controllers; // 필드 개수 = controller 개수
  final ValueChanged<String> onChanged;          // 입력이 바뀔 때 (CTA 활성화 갱신용)
  final ValueChanged<TextEditingController> onFieldFocusLost;
  final VoidCallback onAddPressed;               // '링크 추가'
  final TextEditingController? autofocusTarget;  // 새로 연 필드

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16, // 필드 목록 ~ 링크 추가 버튼
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8, // 필드 사이 간격
          children: [
            for (final controller in controllers)
              LinkTextField(
                key: ObjectKey(controller), // 필드가 늘어나도 각자 상태 유지
                controller: controller,
                autofocus: identical(controller, autofocusTarget),
                onChanged: onChanged,
                onFocusLost: () => onFieldFocusLost(controller),
              ),
          ],
        ),
        Btn(
          text: '링크 추가',
          variant: BtnVariant.primary,
          iconPosition: BtnIconPosition.leading, // 흰색 + 아이콘
          onPressed: onAddPressed,
        ),
      ],
    );
  }
}