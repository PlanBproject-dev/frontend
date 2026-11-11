import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

/// 여행 인원수 입력 필드 (숫자만 입력받는 필드임)
/// 상태는 포커스/입력값으로 자동 결정, 외부에서 따로 상태값을 넘길 필요 없음
class PeopleCountField extends StatefulWidget {
  const PeopleCountField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
  });

  final TextEditingController? controller; // 외부에서 값 제어가 필요할 때
  final FocusNode? focusNode;              // 외부에서 포커스 제어가 필요할 때
  final ValueChanged<int?>? onChanged;     // 입력된 인원수 전달. 비어 있으면 null

  @override
  State<PeopleCountField> createState() => _PeopleCountFieldState();
}

class _PeopleCountFieldState extends State<PeopleCountField> {
  // 상태 전환 모션
  static const Duration _duration = Duration(milliseconds: 200);
  static const Curve _curve = Curves.easeInOut;

  static const String _unit = '명';   // 단위: '명'으로 고정.
  static const double _width = 120;
  static const double _radius = 12;
  static const double _gap = 8;      // 입력값과 단위 사이 간격
  static const int _maxLength = 3;   // 최대 인원수: 3자리. (999명까지)

  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;

  TextEditingController get _controller =>
      widget.controller ?? (_internalController ??= TextEditingController());
  FocusNode get _focusNode =>
      widget.focusNode ?? (_internalFocusNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant PeopleCountField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 외부 focusNode가 바뀌면 리스너 다시 연결
    if (oldWidget.focusNode != widget.focusNode) {
      (oldWidget.focusNode ?? _internalFocusNode)?.removeListener(_onFocusChanged);
      _focusNode.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _internalController?.dispose();
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final bool isTyping = _focusNode.hasFocus;

    return GestureDetector(
      // 단위 텍스트나 여백을 눌러도 입력이 시작되도록
      behavior: HitTestBehavior.opaque,
      onTap: _focusNode.requestFocus,
      child: AnimatedContainer(
        duration: _duration,
        curve: _curve,
        width: _width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(_radius),
          border: Border.all(
            color: isTyping ? AppColors.blue400 : AppColors.gray100,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                onChanged: (value) => widget.onChanged?.call(int.tryParse(value)),
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: _maxLength,
                style: AppTextStyles.labelMedium16.copyWith(
                  color: AppColors.black,
                ),
                cursorColor: AppColors.gray600,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  counterText: '', // maxLength 사용 시 하단 글자 수 표시 숨김
                ),
              ),
            ),
            const SizedBox(width: _gap),

            // 단위 텍스트 ('명')
            Text(
              _unit,
              style: AppTextStyles.labelRegular16.copyWith(
                color: AppColors.gray400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}