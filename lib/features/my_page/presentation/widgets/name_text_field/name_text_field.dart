import 'dart:async';

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/my_page/presentation/widgets/name_text_field/name_text_field_action_icon.dart';
import 'package:plan_b/features/my_page/presentation/widgets/name_text_field/name_text_field_input.dart';

/// 이름 편집 필드 상태
enum _NameFieldStatus { idle, typing, saving, success }

/// 마이페이지 이름 편집 필드
class NameTextField extends StatefulWidget {
  const NameTextField({
    super.key,
    required this.name,
    this.onSubmitted,
  });

  final String name;                       // 현재 이름
  final Future<bool> Function(String name)? onSubmitted;  // 바뀐 이름 전달 > 저장 성공 여부(true/false)를 돌려받음

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  static const double _height = 36;
  static const double _gap = 10;      // 텍스트 영역과 아이콘 사이 간격
  static const double _suffixGap = 4; // 이름과 '님' 사이 간격
  static const String _suffix = '님';

  static const Duration _duration = Duration(milliseconds: 200);
  static const Curve _curve = Curves.easeInOut;
  static const Duration _successDuration = Duration(seconds: 2);

  late final TextEditingController _controller =
      TextEditingController(text: widget.name);
  final FocusNode _focusNode = FocusNode();

  _NameFieldStatus _status = _NameFieldStatus.idle;
  Timer? _successTimer;

  bool get _isTyping => _status == _NameFieldStatus.typing;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant NameTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 외부에서 이름이 바뀌면 동기화 (입력 중일 때는 덮어쓰지 않음)
    if (oldWidget.name != widget.name && !_isTyping) {
      _controller.text = widget.name;
    }
  }

  @override
  void dispose() {
    _successTimer?.cancel();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _startEditing() {
    _successTimer?.cancel();
    setState(() => _status = _NameFieldStatus.typing);
    _controller.selection =
        TextSelection.collapsed(offset: _controller.text.length);
    // TextField가 빌드된 뒤 포커스
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  // 바깥을 눌러 포커스를 잃어도 저장
  void _onFocusChanged() {
    if (!_focusNode.hasFocus && _isTyping) _submit();
  }

    Future<void> _submit() async {
    if (!_isTyping) return;
    final String trimmed = _controller.text.trim();

    // 빈 값이거나 바뀐 게 없으면 원래 이름으로 되돌림
    if (trimmed.isEmpty || trimmed == widget.name) {
      _controller.text = widget.name;
      setState(() => _status = _NameFieldStatus.idle);
      return;
    }

    _controller.text = trimmed;
    setState(() => _status = _NameFieldStatus.saving);

    final bool isSuccess = await widget.onSubmitted?.call(trimmed) ?? false;
    if (!mounted) return;

    if (!isSuccess) {
      _controller.text = widget.name; // 실패: 원래 이름으로
      setState(() => _status = _NameFieldStatus.idle);
      return;
    }

    setState(() => _status = _NameFieldStatus.success);
    _successTimer?.cancel();
    _successTimer = Timer(_successDuration, () {
      if (mounted) setState(() => _status = _NameFieldStatus.idle);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = AppTextStyles.titleSemiBold20;

    return AnimatedContainer(
      duration: _duration,
      curve: _curve,
      height: _height,
      // width 미지정 → 부모 너비를 꽉 채움
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _isTyping ? AppColors.blue400 : Colors.transparent,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                // 이름 (길면 말줄임, '님'은 항상 이름 바로 뒤에 붙음)
                Flexible(
                  child: _isTyping
                      ? NameTextFieldInput(
                          controller: _controller,
                          focusNode: _focusNode,
                          onSubmitted: _submit,
                        )
                      : Text(
                          _controller.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.copyWith(color: AppColors.black),
                        ),
                ),
                const SizedBox(width: _suffixGap),
                Text(
                  _suffix,
                  style: textStyle.copyWith(color: AppColors.gray600),
                ),
              ],
            ),
          ),
          if (!_isTyping) ...[
            const SizedBox(width: _gap),
            NameTextFieldActionIcon(
              isSuccess: _status == _NameFieldStatus.success,
              onTap: _status == _NameFieldStatus.saving ? () {} : _startEditing,
            ),
          ],
        ],
      ),
    );
  }
}