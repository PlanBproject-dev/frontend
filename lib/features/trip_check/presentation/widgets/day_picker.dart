import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/month_calendar.dart';

/// 여행 시기 선택 필드
/// - 날짜 텍스트 필드, 드롭다운 열고닫는 기능, 여행 시기 선택 로직만 담당.
/// - 달력 UI 구현: month_calendar.dart가 담당한다
/// - 달력 UI에 들어갈 개별 cell: calendar_day_cell.dart가 담당한다
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

class _DayPickerState extends State<DayPicker> {
  static const double _dropdownGap = 8; // 필드와 드롭다운 사이 간격: 8로 고정
  static const String _placeholder = 'YY.MM.DD - YY.MM.DD';

  final OverlayPortalController _overlay = OverlayPortalController();
  final LayerLink _link = LayerLink();
  final Object _tapGroup = Object(); // 필드 + 드롭다운을 하나의 탭 영역으로 묶음

  DateTime? _start;
  DateTime? _end; // null이면 종료일 선택 대기 중
  late DateTime _visibleMonth; // 캘린더에 보이는 달 (1일 기준)
  double _fieldWidth = 0;      // 드롭다운 너비를 필드와 맞추기 위함

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
    final box = context.findRenderObject() as RenderBox?;
    setState(() {
      _fieldWidth = box?.size.width ?? 0;
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

  Widget _buildDropdown(BuildContext context) {
    return CompositedTransformFollower(
      link: _link,
      targetAnchor: Alignment.bottomLeft,
      followerAnchor: Alignment.topLeft,
      offset: const Offset(0, _dropdownGap),
      child: Align(
        alignment: Alignment.topLeft,
        child: TapRegion(
          groupId: _tapGroup, // 드롭다운 안을 눌러도 닫히지 않도록
          child: Material(
            color: Colors.transparent, // 오버레이 안 텍스트 기본 스타일용
            child: Container(
              width: _fieldWidth,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gray50),
                boxShadow: AppEffects.boxShadowLg,
              ),
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
    );
  }
}