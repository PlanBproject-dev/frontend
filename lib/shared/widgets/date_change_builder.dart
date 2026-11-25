// 날짜가 바뀌면 builder를 다시 실행하는 위젯
// - 화면을 켜 둔 채 자정을 넘기거나, 앱이 백그라운드에 있다가 다른 날짜에 복귀했을 때: 디데이, 여행 상태처럼 '오늘' 기준으로 계산하는 화면을 갱신하기 위해 사용한다.
// - 다음 자정(현지 시간)에 타이머로 확인 + 앱 복귀(onResume) 시에도 확인한다.

import 'dart:async';

import 'package:flutter/widgets.dart';

class DateChangeBuilder extends StatefulWidget {
  const DateChangeBuilder({
    super.key,
    required this.builder,
  });

  /// today: 오늘 날짜 (현지 기준, 시간 버림)
  final Widget Function(BuildContext context, DateTime today) builder;

  @override
  State<DateChangeBuilder> createState() => _DateChangeBuilderState();
}

class _DateChangeBuilderState extends State<DateChangeBuilder> {
  late DateTime _today = _currentDate();
  Timer? _midnightTimer;
  late final AppLifecycleListener _lifecycleListener;

  /// 오늘 날짜 (현지 기준, 시간 버림)
  static DateTime _currentDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    super.initState();
    _scheduleMidnightRefresh();

    // 앱이 백그라운드에 있으면 타이머가 늦게 실행될 수 있어서, 복귀할 때도 날짜 변경 확인
    _lifecycleListener = AppLifecycleListener(onResume: _refreshIfDateChanged);
  }

  @override
  void dispose() {
    _midnightTimer?.cancel();
    _lifecycleListener.dispose();
    super.dispose();
  }

  /// 다음 자정(현지 시간)에 날짜 변경 확인 예약
  void _scheduleMidnightRefresh() {
    _midnightTimer?.cancel();

    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);

    // 자정 직후에 실행되도록 1초 여유
    _midnightTimer = Timer(
      nextMidnight.difference(now) + const Duration(seconds: 1),
      _refreshIfDateChanged,
    );
  }

  /// 날짜가 바뀌었으면 builder 다시 실행
  void _refreshIfDateChanged() {
    if (!mounted) return;

    final today = _currentDate();
    if (today != _today) {
      setState(() => _today = today);
    }

    _scheduleMidnightRefresh();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _today);
}