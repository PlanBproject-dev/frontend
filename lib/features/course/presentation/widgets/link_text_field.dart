// 웹에서 찾은 코스 링크 입력 필드

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class LinkTextField extends StatefulWidget {
  const LinkTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onFocusLost,
    this.hintText = 'https://...',
    this.autofocus = false,
  });

  final TextEditingController? controller; // null이면 내부에서 만들어 사용
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted; // 키보드 완료 버튼을 누를 때
  final VoidCallback? onFocusLost;         // 입력 후 포커스가 빠질 때 (바깥 탭, 키보드 완료, 다른 필드 탭 등)
  final String hintText;
  final bool autofocus;                    // true면 화면에 나타나자마자 입력 시작

  @override
  State<LinkTextField> createState() => _LinkTextFieldState();
}

class _LinkTextFieldState extends State<LinkTextField> {
  static const double _radius = 12;
  static const double _borderWidth = 1;
  static const double _paddingH = 16;
  static const double _paddingV = 12;
  static const double _iconSize = 24;
  static const double _iconTextGap = 8;
  static const Duration _duration = Duration(milliseconds: 200);

  static const String _linkIcon = 'assets/icons/ic_link_24px.svg';

  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool get _isTyping => _focusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _controller.removeListener(_onTextChanged);
    if (widget.controller == null) _controller.dispose(); // 내부에서 만든 경우만 정리
    super.dispose();
  }

  // 포커스가 바뀌면 테두리, 말줄임 표시를 다시 그리고,
  // 포커스가 빠졌으면 바깥에 알림 (링크 형식, 중복 검사용)
  void _onFocusChanged() {
    setState(() {});
    if (!_focusNode.hasFocus) widget.onFocusLost?.call();
  }

  // 입력 중이 아닐 때 외부에서 값이 바뀌어도 말줄임 텍스트가 갱신되게 함
  void _onTextChanged() {
    if (!_isTyping) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = AppTextStyles.labelMedium16;

    // 입력 완료 상태: TextField는 그대로 두고(탭하면 바로 입력) 글자만 숨긴 뒤, 위에 말줄임 Text를 겹쳐서 보여줌 (TextField는 말줄임을 지원하지 않음)
    final bool showsEllipsis = !_isTyping && _controller.text.isNotEmpty;

    return AnimatedContainer(
      duration: _duration,
      padding: const EdgeInsets.symmetric(
        horizontal: _paddingH - _borderWidth,
        vertical: _paddingV - _borderWidth,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgSolidBasic,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(
          color: _isTyping ? AppColors.blue400 : Colors.transparent,
          width: _borderWidth,
        ),
      ),
      child: Row(
        spacing: _iconTextGap,
        children: [
          SvgPicture.asset(_linkIcon, width: _iconSize, height: _iconSize),
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: widget.autofocus,
                  maxLines: 1,
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  enableSuggestions: false,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmitted,
                  onTapOutside: (_) => _focusNode.unfocus(),
                  style: textStyle.copyWith(
                    color: showsEllipsis ? Colors.transparent : AppColors.gray700,
                  ),
                  cursorColor: AppColors.gray600,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: textStyle.copyWith(color: AppColors.gray300),
                  ),
                ),
                if (showsEllipsis)
                  IgnorePointer(
                    child: Text(
                      _controller.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.copyWith(color: AppColors.gray700),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}