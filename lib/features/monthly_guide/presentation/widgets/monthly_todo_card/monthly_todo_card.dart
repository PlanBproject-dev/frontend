import 'package:flutter/material.dart';

import 'package:plan_b/features/monthly_guide/data/models/monthly_period_type.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_card_frame.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_card_header.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_card_palette.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_todo_card/monthly_todo_section.dart';

/// 월별 여행 준비 가이드 카드
class MonthlyTodoCard extends StatelessWidget {
  const MonthlyTodoCard({
    super.key,
    required this.period,
    required this.dateRange,
    this.remainingMonths = 0,
    this.carryoverItems = const [],
    this.budgetItem,
    this.reservationItems = const [],
  });

  final MonthlyPeriodType period;
  final String dateRange;          // 기간 표시 문구
  final int remainingMonths;       // regular 전용: 남은 1개월 단위 기간 수
  final List<Widget> carryoverItems;   // 지난 기간에서 넘어온 항목 (없으면 섹션 숨김)
  final Widget? budgetItem;            // 이번 달 예산 목표 (regular 전용)
  final List<Widget> reservationItems; // 준비 항목 (없으면 섹션 숨김)

  static const double height = 496;
  static const double _radius = 100;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(52, 70, 52, 0);
  static const double _headerGap = 20;
  static const double _sectionGap = 16;
  static const double _fadeHeight = 95;

  bool get _showBudget =>
      period == MonthlyPeriodType.regular && budgetItem != null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Stack(
          children: [
            // 1. 배경 그라데이션
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: MonthlyTodoCardPalette.background,
                ),
              ),
            ),

            // 2. 내용: 헤더 고정 + 섹션 영역 스크롤
            Padding(
              padding: _padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: _headerGap,
                children: [
                  MonthlyTodoCardHeader(
                    dateRange: dateRange,
                    title: period.title(remainingMonths: remainingMonths),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      // 마지막 항목이 하단 그라데이션에 가려지지 않도록
                      padding: const EdgeInsets.only(bottom: _fadeHeight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: _sectionGap,
                        children: _buildSections(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3. 하단 페이드 레이어 (스크롤 표시용)
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: _fadeHeight,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: MonthlyTodoCardPalette.bottomFade,
                  ),
                ),
              ),
            ),

            // 4. 테두리 + 안쪽 그림자 (맨 위)
            const Positioned.fill(
              child: MonthlyTodoCardFrame(radius: _radius),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSections() {
    return [
      if (carryoverItems.isNotEmpty)
        MonthlyTodoSection(
          title: '지난 항목을 마저 준비해요',
          items: carryoverItems,
        ),
      if (_showBudget)
        MonthlyTodoSection(
          title: '이번 달 예산 목표',
          items: [budgetItem!],
        ),
      if (reservationItems.isNotEmpty)
        MonthlyTodoSection(
          title: period.reservationSectionTitle,
          items: reservationItems,
        ),
    ];
  }
}