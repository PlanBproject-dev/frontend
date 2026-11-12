import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/combo_box_dropdown.dart';

/// 콤보박스: 입력창 + 드롭다운
class ComboBox extends StatefulWidget {
  const ComboBox({
    super.key,
    required this.items,
    this.initialValue,
    this.hintText = '예시) 프랑스 파리',
    this.onSelected,
  });

  final List<String> items;               // 드롭다운 항목 (서버 데이터 연결 예정)
  final String? initialValue;             // 처음 선택된 값
  final String hintText;                  // 비어 있을 때 안내 문구
  final ValueChanged<String>? onSelected; // 항목을 고르면 해당 값 전달

  @override
  State<ComboBox> createState() => _ComboBoxState();
}

/// 드롭다운 배치 정보
typedef _DropdownPlacement = ({bool openUp, double width, double maxListHeight});

class _ComboBoxState extends State<ComboBox> {
  static const double _dropdownGap = 8; // 필드와 드롭다운 사이 간격

  final OverlayPortalController _overlay = OverlayPortalController();
  final LayerLink _link = LayerLink();
  final Object _tapGroup = Object(); // 필드 + 드롭다운을 하나의 탭 영역으로 묶음

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  String? _selected;     // 목록에서 고른 값
  bool _showAll = false; // true: chevron으로 연 전체 목록 / false: 입력어로 필터링

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
    _controller.text = _selected ?? '';
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {}); // 테두리 색 갱신

  /// 띄어쓰기, 대소문자 무시하고 비교
  static String _normalize(String text) => text.replaceAll(' ', '').toLowerCase();

  List<String> get _visibleItems {
    final query = _normalize(_controller.text);
    if (_showAll || query.isEmpty) return widget.items;
    return widget.items.where((item) => _normalize(item).contains(query)).toList();
  }

  // 드롭다운 열기 & 닫기

  void _show({required bool showAll}) {
    _showAll = showAll;
    _overlay.show();
  }

  /// 드롭다운이 그려진 뒤 스크롤 위치 이동
  void _scrollAfterBuild(double offset) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      final position = _scrollController.position;
      _scrollController.jumpTo(min(offset, position.maxScrollExtent));
    });
  }

  /// 바깥 탭, chevron으로 닫을 때
  void _close() {
    if (!_overlay.isShowing && !_focusNode.hasFocus) return;
    _focusNode.unfocus();
    setState(() {
      _overlay.hide();
      _controller.text = _selected ?? ''; // 목록에서 고르지 않은 입력은 되돌림
    });
  }

  void _onChanged(String text) {
    setState(() => _show(showAll: false));
    _scrollAfterBuild(0); // 필터 결과는 맨 위부터
  }

  void _onChevronTap() {
    if (_overlay.isShowing) {
      _close();
      return;
    }
    _focusNode.unfocus(); // 키보드를 내리고 목록 스크롤로 선택
    setState(() => _show(showAll: true));

    // 선택된 값이 있으면 그 위치로 스크롤
    final index = _selected == null ? -1 : widget.items.indexOf(_selected!);
    _scrollAfterBuild(index > 0 ? index * ComboBoxDropdown.itemHeight : 0);
  }

  void _select(String item) {
    _focusNode.unfocus();
    setState(() {
      _selected = item;
      _controller.text = item;
      _overlay.hide();
    });
    widget.onSelected?.call(item);
  }

  /// 완료 키: 확정할 수 있는 항목이 하나로 정해지면 선택
  void _onSubmitted(String text) {
    final query = _normalize(text);

    // 1. 항목 이름과 정확히 일치
    for (final item in widget.items) {
      if (_normalize(item) == query) {
        _select(item);
        return;
      }
    }

    final matches = query.isEmpty
        ? widget.items
        : widget.items.where((item) => _normalize(item).contains(query)).toList();

    // 2. 맞는 항목이 하나뿐
    if (matches.length == 1) {
      _select(matches.single);
      return;
    }

    // 3. 맞는 항목이 없으면 닫고 이전 선택값으로 되돌림
    if (matches.isEmpty) {
      _close();
      return;
    }

    // 4. 여러 개면 키보드만 내려가고 목록은 열린 채로 둬서 탭으로 고르게 함
  }

  @override
  Widget build(BuildContext context) {
    final bool isOpen = _overlay.isShowing;
    final bool isActive = isOpen || _focusNode.hasFocus;

    final field = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? AppColors.blue400 : AppColors.gray100,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              groupId: _tapGroup,   // 드롭다운 탭을 바깥 탭으로 보지 않도록
              onTapOutside: (_) {}, // 바깥 탭 처리는 아래 TapRegion에서 한 번에
              onChanged: _onChanged,
              onSubmitted: _onSubmitted,
              textInputAction: TextInputAction.done,
              style: AppTextStyles.labelMedium16.copyWith(color: AppColors.black),
              cursorColor: AppColors.gray600,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: AppTextStyles.labelRegular16.copyWith(
                  color: AppColors.gray200,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 우측 chevron: 전체 목록 열기/닫기
          Semantics(
            button: true,
            expanded: isOpen,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _onChevronTap,
              child: SvgPicture.asset(
                isOpen
                    ? 'assets/icons/ic_chevron_top_24px_gray.svg'
                    : 'assets/icons/ic_chevron_bottom_24px_gray.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );

    return TapRegion(
      groupId: _tapGroup,
      onTapOutside: (_) => _close(), // 바깥을 누르면 닫힘
      child: OverlayPortal(
        controller: _overlay,
        overlayChildBuilder: _buildDropdown,
        child: CompositedTransformTarget(
          link: _link,
          child: field,
        ),
      ),
    );
  }

  /// 필드 위아래 남은 공간을 보고 드롭다운을 열 방향과 높이를 정함
  _DropdownPlacement _placementFor(BuildContext overlayContext, int itemCount) {
    // 키보드가 올라오고 내려갈 때 다시 계산되도록 MediaQuery에 의존
    final media = MediaQuery.of(overlayContext);
    final box = context.findRenderObject() as RenderBox?;

    if (box == null || !box.attached || !box.hasSize) {
      return (
        openUp: false,
        width: 0,
        maxListHeight: ComboBoxDropdown.defaultMaxListHeight,
      );
    }

    final double fieldTop = box.localToGlobal(Offset.zero).dy;
    final double fieldBottom = fieldTop + box.size.height;

    // 키보드, 상하 안전 영역을 뺀 실제로 보이는 공간
    final double spaceBelow = media.size.height -
        media.viewInsets.bottom -
        media.padding.bottom -
        fieldBottom -
        _dropdownGap;
    final double spaceAbove = fieldTop - media.padding.top - _dropdownGap;

    // 아래에 다 안 들어가고, 위가 더 넓으면 위로 열기
    final double needed = ComboBoxDropdown.heightFor(itemCount);
    final bool openUp = spaceBelow < needed && spaceAbove > spaceBelow;

    // 고른 방향의 공간에 맞게 목록 높이 제한 (최소 1개는 보이도록)
    final double available = openUp ? spaceAbove : spaceBelow;
    final double maxListHeight = (available - ComboBoxDropdown.frameHeight)
        .clamp(ComboBoxDropdown.itemHeight, ComboBoxDropdown.defaultMaxListHeight)
        .toDouble();

    return (openUp: openUp, width: box.size.width, maxListHeight: maxListHeight);
  }

  Widget _buildDropdown(BuildContext overlayContext) {
    final items = _visibleItems;
    if (items.isEmpty) return const SizedBox.shrink(); // 맞는 항목이 없으면 드롭다운 숨김

    final placement = _placementFor(overlayContext, items.length);
    final bool openUp = placement.openUp;

    return CompositedTransformFollower(
      link: _link,
      // 아래로 열기: 필드 아래 모서리에 드롭다운 윗변을 맞춤
      // 위로 열기: 필드 윗 모서리에 드롭다운 아랫변을 맞춤
      targetAnchor: openUp ? Alignment.topLeft : Alignment.bottomLeft,
      followerAnchor: openUp ? Alignment.bottomLeft : Alignment.topLeft,
      offset: Offset(0, openUp ? -_dropdownGap : _dropdownGap),
      child: Align(
        alignment: openUp ? Alignment.bottomLeft : Alignment.topLeft,
        child: TapRegion(
          groupId: _tapGroup, // 드롭다운 안을 눌러도 닫히지 않도록
          child: Material(
            color: Colors.transparent, // 오버레이 안 텍스트 기본 스타일용
            child: SizedBox(
              width: placement.width,
              child: ComboBoxDropdown(
                items: items,
                selected: _selected,
                scrollController: _scrollController,
                maxListHeight: placement.maxListHeight,
                onSelect: _select,
              ),
            ),
          ),
        ),
      ),
    );
  }
}