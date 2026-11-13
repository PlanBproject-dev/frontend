import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/day_picker/month_calendar.dart';

/// 여행 시기 선택 필드
/// - 날짜 텍스트 필드, 드롭다운 열고닫는 기능, 여행 시기 선택 로직만 담당.
/// - 달력 UI 구현: month_calendar.dart가 담당한다
/// - 달력 UI에 들어갈 개별 cell: calendar_day_cell.dart가 담당한다
/// - 아래 공간이 부족하면 드롭다운을 위로 열고, 그래도 부족하면 높이를 줄이고 스크롤
class DayPicker extends StatefulWidget {
  const DayPicker({
    super.key,
    this.initialRange,
    this.onChanged,
  });

  final DateTimeRange? initialRange;            // 처음 표시할 기간
  final ValueChanged<DateTimeRange>? onChanged; // 날짜를 탭할 때마다 현재 기간 전달 (시작일만 고르면 시작일 = 종료일이다)

  @override
  State<DayPicker> createState() => _DayPickerState();
}

/// 드롭다운 배치 정보
typedef _DropdownPlacement = ({bool openUp, double width, double maxHeight});

class _DayPickerState extends State<DayPicker> {
  static const double _dropdownGap = 8; // 필드와 드롭다운 사이 간격: 8로 고정
  static const String _placeholder = 'YY.MM.DD - YY.MM.DD';

  // 드롭다운 높이 계산용
  static const double _dropdownPadding = 16;
  static const double _dropdownBorder = 1;
  static const double _frameHeight = (_dropdownPadding + _dropdownBorder) * 2; // 34

  /// 6주짜리 달 기준 드롭다운 최대 높이: 열 방향 판단에 사용 (달을 넘겨도 방향이 바뀌지 않도록)
  /// 헤더 28 + 간격 16 + 요일 28 + 6주 × (행 간격 8 + 날짜 칸 36) + 바깥 프레임 34
  static const double _maxDropdownHeight = 28 + 16 + 28 + 6 * (8 + 36) + _frameHeight; // 370

  /// 공간이 아주 좁아도 유지할 최소 높이 (헤더 + 요일 + 한 주 + 프레임)
  static const double _minDropdownHeight = 150;

  final OverlayPortalController _overlay = OverlayPortalController();
  final LayerLink _link = LayerLink();
  final Object _tapGroup = Object(); // 필드 + 드롭다운을 하나의 탭 영역으로 묶음

  DateTime? _start;
  DateTime? _end; // null이면 종료일 선택 대기 중
  late DateTime _visibleMonth; // 캘린더에 보이는 달 (1일 기준)

  @override
  void initState() {
    super.initState();
    final range = widget.initialRange;
    if (range != null) {
      _start = DateUtils.dateOnly(range.start);
      _end = DateUtils.dateOnly(range.end);
    }
    _visibleMonth = _monthOf(_start ?? DateTime.now());
  }

  static DateTime _monthOf(DateTime date) => DateTime(date.year, date.month);

  /// YY.MM.DD 형식
  static String _format(DateTime date) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(date.year % 100)}.${two(date.month)}.${two(date.day)}';
  }

  // 드롭다운 열기&닫기

  void _toggle() => _overlay.isShowing ? _close() : _open();

  void _open() {
    setState(() {
      _visibleMonth = _monthOf(_start ?? DateTime.now()); // 열 때 선택된 달부터 보여줌
      _overlay.show();
    });
  }

  void _close() {
    if (!_overlay.isShowing) return;
    setState(_overlay.hide);
  }

  // 월 이동

  void _moveMonth(int offset) {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + offset);
    });
  }

  // 날짜 선택

  void _onDayTap(DateTime day) {
    setState(() {
      final start = _start;
      if (start == null || _end != null) {
        // 처음 선택하거나, 이미 기간이 정해진 상태면 새로 시작
        _start = day;
        _end = null;
      } else if (day.isBefore(start)) {
        // 시작일보다 앞선 날짜를 누르면 시작일을 다시 지정
        _start = day;
      } else {
        _end = day;
      }
    });
    widget.onChanged?.call(DateTimeRange(start: _start!, end: _end ?? _start!));
  }

  @override
  Widget build(BuildContext context) {
    final bool isOpen = _overlay.isShowing;
    final DateTime? start = _start;
    final String? text =
        start == null ? null : '${_format(start)} - ${_format(_end ?? start)}';

    final field = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOpen ? AppColors.blue400 : AppColors.gray100,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text ?? _placeholder,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.labelRegular16.copyWith(
                color: text == null ? AppColors.gray200 : AppColors.gray800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SvgPicture.asset(
            'assets/icons/ic_calendar_24px.svg',
            width: 24,
            height: 24,
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
          child: Semantics(
            button: true,
            expanded: isOpen,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _toggle,
              child: field,
            ),
          ),
        ),
      ),
    );
  }

  /// 필드 위아래 남은 공간을 보고 드롭다운을 열 방향과 최대 높이를 정함
  _DropdownPlacement _placementFor(BuildContext overlayContext) {
    // 키보드나 화면 크기가 바뀌면 다시 계산되도록 MediaQuery에 의존
    final media = MediaQuery.of(overlayContext);
    final box = context.findRenderObject() as RenderBox?;

    if (box == null || !box.attached || !box.hasSize) {
      return (openUp: false, width: 0, maxHeight: _maxDropdownHeight);
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
    final bool openUp = spaceBelow < _maxDropdownHeight && spaceAbove > spaceBelow;

    // 고른 방향의 공간에 맞게 높이 제한 (넘치면 달력 안에서 스크롤)
    final double available = openUp ? spaceAbove : spaceBelow;
    final double maxHeight = available
        .clamp(_minDropdownHeight, _maxDropdownHeight)
        .toDouble();

    return (openUp: openUp, width: box.size.width, maxHeight: maxHeight);
  }

  Widget _buildDropdown(BuildContext overlayContext) {
    final placement = _placementFor(overlayContext);
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
            child: Container(
              width: placement.width,
              constraints: BoxConstraints(maxHeight: placement.maxHeight),
              padding: const EdgeInsets.all(_dropdownPadding),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gray50, width: _dropdownBorder),
                boxShadow: AppEffects.boxShadowLg,
              ),
              // 공간이 충분하면 스크롤 없이 그대로, 부족하면 달력 안에서 스크롤
              child: SingleChildScrollView(
                child: MonthCalendar(
                  visibleMonth: _visibleMonth,
                  start: _start,
                  end: _end,
                  onPrev: () => _moveMonth(-1),
                  onNext: () => _moveMonth(1),
                  onDayTap: _onDayTap,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}