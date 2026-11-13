// 여행 고르기 페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/trip_check/data/models/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_select/data/dummy/trip_plan_dummy.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/select_page/plan_list_sheet.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/select_page/select_bottom_bar.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/select_page/trip_basic_info_section.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_receipt/trip_plan_receipt.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/trip_plan_ticket/trip_plan_ticket.dart';
import 'package:plan_b/shared/widgets/btn/btn.dart';
import 'package:plan_b/shared/widgets/btn/cta_binary.dart';
import 'package:plan_b/shared/widgets/feedback/modal_primary.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';

class TripSelectPage extends ConsumerStatefulWidget {
  const TripSelectPage({super.key});

  @override
  ConsumerState<TripSelectPage> createState() => _TripSelectPageState();
}

class _TripSelectPageState extends ConsumerState<TripSelectPage> {
  // TODO: 로그인 연동 후 사용자 이름으로 교체
  static const String _userName = '주원';

  static const int _initialTicketCount = 3;
  static const double _infoTopGap = 20;   // title_header ~ 여행 기본 정보
  static const double _sheetTopGap = 40;  // 여행 기본 정보 ~ 파란 시트

  String? _selectedPlanId;       // 하나만 선택
  bool _showAllTickets = false;  // 지갑 기준: 4~6위 노출 여부

  void _onPlanSelected(String planId, bool selected) =>
      setState(() => _selectedPlanId = selected ? planId : null);

  /// 돌아가기 → 확인 모달 → 기본 정보 입력 페이지 (draft는 그대로라 입력값 유지)
  Future<void> _onBackPressed(TripSelectionType tripType) async {
    final bool confirmed = await showModalPrimary(
      context,
      title: '이전으로 가서 여행 조건을\n다시 선택하시겠습니까?',
      caption: '여행 조건 변경에 따라\n여행 플랜을 재생성하게 됩니다.',
      secondaryText: '취소',
      primaryText: '여행 조건 다시 선택',
    );
    if (!confirmed || !mounted) return;

    final String route = switch (tripType) {
      TripSelectionType.budget => AppRoutes.budgetFirstBasicInfo,
      TripSelectionType.goal => AppRoutes.goalFirstBasicInfo,
    };
    // 분석 페이지에서 go로 넘어와 스택이 비어 있으므로 go로 이동
    context.go(route, extra: AppRouteExtras.reselect);
  }

  void _onConfirm() {
    if (_selectedPlanId == null) return;
    // TODO: 선택한 플랜 서버 저장 (선택 id: _selectedPlanId)
    context.push(AppRoutes.tripSelectCompleted);
  }

  @override
  Widget build(BuildContext context) {
    final TripCheckDraft draft = ref.watch(tripCheckDraftProvider);
    // 정상 플로우라면 항상 값이 있음 (직접 진입 시 지갑 기준으로 표시)
    final TripSelectionType tripType = draft.tripType ?? TripSelectionType.budget;
    final bool isBudget = tripType == TripSelectionType.budget;

    return PopScope(
      canPop: false, // 스택이 비어 있어서 시스템 뒤로가기도 모달로 처리
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _onBackPressed(tripType);
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true, // 파란 시트가 하단 cta 영역 라운드 뒤까지 보이도록
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TitleHeader(title: '$_userName 님을 위한 여행 플랜 추천'),
                    const SizedBox(height: _infoTopGap),
                    TripBasicInfoSection(rows: _infoRows(draft, tripType)),
                    const SizedBox(height: _sheetTopGap),
                    isBudget ? _buildTicketSheet() : _buildReceiptSheet(),
                  ],
                ),
              ),
              // 콘텐츠가 화면보다 짧을 때 남은 영역도 파란 배경으로
              const SliverFillRemaining(
                hasScrollBody: false,
                child: ColoredBox(color: AppColors.blue100),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SelectBottomBar(
          child: CtaBinary(
            secondaryText: '돌아가기',
            primaryText: '확인',
            isPrimaryActive: _selectedPlanId != null,
            onSecondaryPressed: () => _onBackPressed(tripType),
            onPrimaryPressed: _onConfirm,
          ),
        ),
      ),
    );
  }

  /// 지갑 기준: trip_plan_ticket
  Widget _buildTicketSheet() {
    final plans = _showAllTickets
        ? dummyBudgetFirstPlans
        : dummyBudgetFirstPlans.take(_initialTicketCount);

    return PlanListSheet(
      title: '당신을 위한 여행지 TOP 3',
      subtitle: '마음에 드는 여행지 티켓을 선택하세요.',
      children: [
        for (final plan in plans)
          TripPlanTicket(
            key: ValueKey(plan.id), // 열림 상태가 다른 티켓으로 옮겨가지 않도록
            plan: plan,
            isSelected: _selectedPlanId == plan.id,
            onSelectedChanged: (selected) => _onPlanSelected(plan.id, selected),
          ),
        if (!_showAllTickets)
          Btn(
            text: '다른 여행지도 보고싶어요',
            onPressed: () => setState(() => _showAllTickets = true),
          ),
      ],
    );
  }

  /// 목표 기준: trip_plan_receipt
  Widget _buildReceiptSheet() {
    return PlanListSheet(
      title: '당신의 여행을 위한 3가지 예산 플랜',
      subtitle: '마음에 드는 여행 영수증을 선택하세요.',
      children: [
        for (final item in dummyGoalFirstPlans)
          TripPlanReceipt(
            key: ValueKey(item.plan.id),
            plan: item.plan,
            budgetLevel: item.level,
            isSelected: _selectedPlanId == item.plan.id,
            onSelectedChanged: (selected) => _onPlanSelected(item.plan.id, selected),
          ),
      ],
    );
  }

  // 기본 정보 박스 행 구성

  List<TripInfoRow> _infoRows(TripCheckDraft draft, TripSelectionType tripType) {
    final period = TripInfoRow('시기', [_formatPeriod(draft.travelPeriod)]);
    final people = TripInfoRow('인원', [
      if (draft.peopleCount != null) '${draft.peopleCount}명',
      if (draft.companionType != null) draft.companionType!.label,
    ]);

    return switch (tripType) {
      TripSelectionType.budget => [
          period,
          people,
          TripInfoRow('예산', [_formatBudget(draft.maxBudget)]),
        ],
      TripSelectionType.goal => [
          TripInfoRow('국가', [draft.destination ?? '-']),
          period,
          people,
        ],
    };
  }

  /// 26.08.10 - 26.08.18 (하루면 날짜 하나만)
  static String _formatPeriod(DateTimeRange? range) {
    if (range == null) return '-';
    String two(int n) => n.toString().padLeft(2, '0');
    String format(DateTime d) => '${two(d.year % 100)}.${two(d.month)}.${two(d.day)}';

    if (DateUtils.isSameDay(range.start, range.end)) return format(range.start);
    return '${format(range.start)} - ${format(range.end)}';
  }

  /// 인당 최대 300만원 / 인당 400만원 이상
  static String _formatBudget(BudgetRange? budget) {
    if (budget == null) return '-';
    final max = budget.maxManwon;
    return max == null ? '인당 ${budget.label}' : '인당 최대 $max만원';
  }
}