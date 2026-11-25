// 여행 고르기 페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/core/storage/wallet_more_viewed_storage.dart';
import 'package:plan_b/features/my_page/presentation/providers/my_profile_provider.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/presentation/providers/wallet_recommendation_provider.dart';
import 'package:plan_b/features/trip_select/data/models/budget_level.dart';
import 'package:plan_b/features/trip_select/presentation/providers/goal_recommendation_provider.dart';
import 'package:plan_b/features/trip_check/data/models/options/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/features/trip_select/data/models/trip_basic_info.dart';
import 'package:plan_b/features/trip_select/presentation/providers/trip_basic_info_provider.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/shared/widgets/feedback/global_loading/show_global_loading.dart';
import 'package:plan_b/features/trip_select/data/repositories/trip_select_repository.dart';
import 'package:plan_b/shared/providers/global_loading_provider.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
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
  static const double _infoTopGap = 20;   // title_header ~ 여행 기본 정보
  static const double _sheetTopGap = 40;  // 여행 기본 정보 ~ 파란 시트
  static const int _defaultTopCount = 3;  // 지갑 기준 제목 'TOP n'의 기본값 (추천 개수를 아직 모를 때)

  String? _selectedPlanId;       // 하나만 선택
  List<TripPlan> _morePlans = const []; // 지갑 기준: 추가 조회한 4~6순위
  bool _isLoadingMore = false;          // 4~6순위 조회 중 (버튼 중복 탭 방지)

  @override
  void initState() {
    super.initState();
    // '여행 플랜 다시 선택하기'로 들어왔을 때: 이전에 4~6순위를 열람한 플랜이면 다시 불러옴
    WidgetsBinding.instance.addPostFrameCallback((_) => _restoreMorePlans());
  }

  Future<void> _restoreMorePlans() async {
    final TripCheckDraft draft = ref.read(tripCheckDraftProvider);
    final int? planId = draft.planId;
    if (planId == null || draft.tripType != TripSelectionType.budget) return;

    final bool viewed = await ref
        .read(walletMoreViewedStorageProvider)
        .isViewed(planId)
        .catchError((_) => false);
    if (viewed && mounted && _morePlans.isEmpty) await _onShowMorePressed();
  }

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

    // 최종 제출된 플랜은 수정할 수 없으므로, 다시 입력한 조건은 새 플랜으로 저장
    ref.read(tripCheckDraftProvider.notifier).startReselect();

    final String route = switch (tripType) {
      TripSelectionType.budget => AppRoutes.budgetFirstBasicInfo,
      TripSelectionType.goal => AppRoutes.goalFirstBasicInfo,
    };
    // 분석 페이지에서 go로 넘어와 스택이 비어 있으므로 go로 이동
    context.go(route, extra: AppRouteExtras.reselect);
  }

  void _onConfirm() {
    if (_selectedPlanId == null) return;
    // _selectedPlanId = 선택한 티켓/영수증의 recommendationId (지갑/목표 공통)
    // 서버 확정 요청은 완료 페이지가 로딩과 함께 처리 (실패하면 완료 페이지가 pop해서 여기로 돌아오므로 push 유지)
    context.push(AppRoutes.tripSelectCompleted, extra: _selectedPlanId);
  }

  /// 지갑 기준: '다른 여행지도 보고싶어요' -> 4~6순위 추가 조회
  /// - 성공: 1~3순위 아래에 붙이고 버튼 숨김
  /// - 실패: 토스트만 띄우고 버튼은 남겨서 다시 시도 가능
  Future<void> _onShowMorePressed() async {
    final int? planId = ref.read(tripCheckDraftProvider).planId;
    if (planId == null || _isLoadingMore) return;

    setState(() => _isLoadingMore = true);
    try {
      final List<TripPlan> plans = await ref
          .read(globalLoadingProvider.notifier)
          .run(() => ref.read(tripSelectRepositoryProvider).getMoreWalletRecommendations(planId));
      if (!mounted) return;
      setState(() => _morePlans = plans);
      // 다시 선택하기로 돌아왔을 때 1~6순위까지 보여주기 위해 열람 기록 저장 (실패해도 무시)
      ref.read(walletMoreViewedStorageProvider).markViewed(planId).catchError((_) {});
    } catch (_) {
      if (!mounted) return;
      showToast(
        context,
        text: '다른 여행지를 불러오지 못했어요.\n다시 시도해 주세요.',
        type: ToastType.warning,
      );
    } finally {
      if (mounted) setState(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String userName = ref.watch(
      myProfileProvider.select((profile) => profile.valueOrNull?.name ?? ''),
    );

    final TripCheckDraft draft = ref.watch(tripCheckDraftProvider);

    // 서버 값이 오기 전(로딩/실패/planId 없음)에는 입력값으로 먼저 보여줌
    final TripBasicInfo basicInfo =
        ref.watch(tripBasicInfoProvider).valueOrNull ?? TripBasicInfo.fromDraft(draft);

    // 서버 값 > 입력값 > 지갑 기준 순서로 사용
    final TripSelectionType tripType =
        basicInfo.tripType ?? draft.tripType ?? TripSelectionType.budget;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 상단 고정 타이틀 헤더 (스크롤 영역 밖)
              TitleHeader(
                title: userName.isEmpty
                    ? '맞춤 여행 플랜 추천'
                    : '$userName 님을 위한 여행 플랜 추천',
              ),

              // 헤더 아래 영역만 스크롤
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: _infoTopGap),
                          TripBasicInfoSection(
                            rows: _infoRows(basicInfo, tripType),
                            alignValues: !isBudget, // 목표 기준만 값 정렬
                          ),
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

  /// 지갑 기준: trip_plan_ticket (AI 추천 TOP 1~3 + '다른 여행지' 추가 조회 최대 3개)
  /// 분석 페이지에서 이미 생성된 결과를 바로 사용 (재시도/직접 진입 시에만 로딩)
  Widget _buildTicketSheet() {
    final AsyncValue<List<TripPlan>> recommendations =
        ref.watch(walletRecommendationsProvider);

    // 제목 'TOP n' = 지금 보여주는 추천 개수 (1~3순위 + 추가 조회로 받은 개수)
    // - 추가 조회 전: 3 / 추가로 3개면 6, 2개면 5, 1개면 4
    // - 로딩, 에러처럼 개수를 알 수 없을 때는 기본값 3
    // (추천 응답에 이미 있는 여행지는 아래 목록처럼 추가 조회 결과에서 빼고 셈)
    final List<TripPlan> basePlans = recommendations.valueOrNull ?? const [];
    final int shownCount = basePlans.length +
        _morePlans.where((more) => !basePlans.any((plan) => plan.id == more.id)).length;
    final int topCount = shownCount > 0 ? shownCount : _defaultTopCount;

    return PlanListSheet(
      title: '당신을 위한 여행지 TOP $topCount',
      subtitle: '마음에 드는 여행지 티켓을 선택하세요.',
      children: recommendations.when(
        data: (plans) => [
          // 추천 응답에 이미 있는 여행지는 추가 조회 결과에서 빼고 붙임
          // (같은 티켓이 두 번 보이거나 ValueKey가 겹치지 않도록)
          for (final plan in [
            ...plans,
            ..._morePlans.where((more) => !plans.any((plan) => plan.id == more.id)),
          ])
            TripPlanTicket(
              key: ValueKey(plan.id), // 열림 상태가 다른 티켓으로 옮겨가지 않도록
              plan: plan,
              isSelected: _selectedPlanId == plan.id,
              onSelectedChanged: (selected) => _onPlanSelected(plan.id, selected),
            ),
          // 4~6순위를 아직 안 불러왔을 때만 노출
          if (plans.isNotEmpty &&
              _morePlans.isEmpty &&
              !plans.any((plan) => plan.rank > 3))
            Btn(
              text: '다른 여행지도 보고싶어요',
              onPressed: _onShowMorePressed,
            ),
        ],
        // 화면에 있는 동안 전역 로딩 오버레이 표시, 데이터가 오면 자동으로 꺼짐
        loading: () => const [ShowGlobalLoading()],
        error: (_, __) => [
          Text(
            '여행지 추천을 불러오지 못했어요.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium16,
          ),
          Btn(
            text: '다시 시도',
            variant: BtnVariant.primary,
            iconPosition: BtnIconPosition.trailing,
            onPressed: () {
              // 1~3순위를 새로 생성하므로 이전에 불러온 4~6순위와 선택도 초기화
              setState(() {
                _selectedPlanId = null;
                _morePlans = const [];
              });
              ref.invalidate(walletRecommendationsProvider);
            },
          ),
        ],
      ),
    );
  }

  /// 목표 기준: trip_plan_receipt
  /// 분석 페이지에서 이미 생성된 결과를 바로 사용 (재시도/직접 진입 시에만 로딩)
  Widget _buildReceiptSheet() {
    final AsyncValue<List<BudgetLevelPlan>> recommendations =
        ref.watch(goalRecommendationsProvider);

    return PlanListSheet(
      title: '당신의 여행을 위한 3가지 예산 플랜',
      subtitle: '마음에 드는 여행 영수증을 선택하세요.',
      children: recommendations.when(
        data: (items) => [
          for (final item in items)
            TripPlanReceipt(
              key: ValueKey(item.plan.id), // 열림 상태가 다른 영수증으로 옮겨가지 않도록
              plan: item.plan,
              budgetLevel: item.level,
              isSelected: _selectedPlanId == item.plan.id,
              onSelectedChanged: (selected) => _onPlanSelected(item.plan.id, selected),
            ),
        ],
        // 화면에 있는 동안 전역 로딩 오버레이 표시, 데이터가 오면 자동으로 꺼짐
        loading: () => const [ShowGlobalLoading()],
        error: (_, __) => [
          Text(
            '예산 플랜을 불러오지 못했어요.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium16,
          ),
          Btn(
            text: '다시 시도',
            variant: BtnVariant.primary,
            iconPosition: BtnIconPosition.trailing,
            onPressed: () {
              setState(() => _selectedPlanId = null);
              ref.invalidate(goalRecommendationsProvider);
            },
          ),
        ],
      ),
    );
  }

  // 기본 정보 박스 행 구성

  List<TripInfoRow> _infoRows(TripBasicInfo info, TripSelectionType tripType) {
    final period = TripInfoRow('시기', [_formatPeriod(info.travelPeriod)]);
    final people = TripInfoRow('인원', [
      if (info.peopleCount != null) '${info.peopleCount}명',
      if (info.companionType != null) info.companionType!.label,
    ]);

    return switch (tripType) {
      TripSelectionType.budget => [
          period,
          people,
          TripInfoRow('예산', [_formatBudget(info.maxBudget)]),
        ],
      TripSelectionType.goal => [
          TripInfoRow('여행지', [info.destination?.label ?? '-']),
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