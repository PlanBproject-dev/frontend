import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:plan_b/features/my_page/data/models/dto/nickname_update_request_dto.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 이름 편집 필드의 입력 영역 (입력 중 상태에서만 사용)
/// 입력한 글자 길이만큼만 너비를 차지해서 '님'이 글자 바로 뒤에 따라옴
class NameTextFieldInput extends StatelessWidget {
  const NameTextFieldInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmitted; // 키보드 완료 버튼을 누를 때

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLines: 1,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => onSubmitted(),
        onTapOutside: (_) => focusNode.unfocus(), // 바깥 탭 > 포커스 해제 > 저장
        style: AppTextStyles.titleSemiBold20.copyWith(color: AppColors.black),
        cursorColor: AppColors.blue400,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(NicknameUpdateRequestDto.maxLength),
        ],
      ),
    );
  }
}