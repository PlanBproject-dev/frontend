// 월별 여행 준비 가이드 페이지
// - 홈에서 선택한 플랜 id(selectedPlanIdProvider)의 월별 가이드를 조회해서 보여주어야 함.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/monthly_guide/data/models/guide_view_type.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_guide.dart';
import 'package:plan_b/features/monthly_guide/data/models/monthly_guide_not_provided_exception.dart';
import 'package:plan_b/features/monthly_guide/presentation/providers/monthly_guide_provider.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/btn_swap_guide_view.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_month_view.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_timeline_view.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_anchored_ellipse.dart';
import 'package:plan_b/shared/widgets/background/bg_top_ellipse.dart';
import 'package:plan_b/shared/widgets/feedback/global_loading/show_global_loading.dart';
import 'package:plan_b/features/monthly_guide/presentation/widgets/monthly_guide_skeleton.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';

class MonthlyGuidePage extends ConsumerStatefulWidget {
  const MonthlyGuidePage({super.key});

  @override
  ConsumerState<MonthlyGuidePage> createState() => _MonthlyGuidePageState();
}

class _MonthlyGuidePageState extends ConsumerState<MonthlyGuidePage> {
  static const double _horizontalPadding = 24;
  static const double _contentBottomGap = 24; // 마지막 콘텐츠 ~ 로컬 탭바(또는 보기 전환 버튼) 간격
  static const double _swapButtonGap = 16;    // 보기 전환 버튼 ~ 로컬 탭바 간격
  static const double _swapButtonHeight = 44; // btn_swap_guide_view 높이

  // 월별 보기
  static const double _monthTopGap = 24;      // 상단바 ~ 요약 박스 간격
  // 전체 타임라인 보기
  static const double _timelineTopGap = 28;
  static const double _timelineRightPadding = 32;

  GuideViewType _viewType = GuideViewType.monthlyGuide; // 현재 보기

  // 앱이 다시 열렸을 때 날짜가 바뀌었으면 가이드 다시 조회
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    _lifecycleListener = AppLifecycleListener(onResume: _refreshIfDayChanged);
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  void _refreshIfDayChanged() {
    final String? planId = ref.read(selectedPlanIdProvider);
    if (planId == null) return;
    ref.read(monthlyGuideProvider(planId).notifier).refreshIfDayChanged();
  }

  void _toggleView() => setState(() => _viewType = _viewType.toggled);

  /// 보기별 콘텐츠 여백
  EdgeInsets _contentPadding(EdgeInsets inset) => switch (_viewType) {
        GuideViewType.monthlyGuide => EdgeInsets.fromLTRB(
            _horizontalPadding,
            _monthTopGap,
            _horizontalPadding,
            inset.bottom + _contentBottomGap,
          ),
        // 마지막 기간이 보기 전환 버튼에 가리지 않도록 버튼 높이만큼 더 띄움
        GuideViewType.timeline => EdgeInsets.fromLTRB(
            _horizontalPadding,
            _timelineTopGap,
            _timelineRightPadding,
            inset.bottom + _swapButtonGap + _swapButtonHeight + _contentBottomGap,
          ),
      };

  @override
  Widget build(BuildContext context) {
    // 선택을 해제한 직후 화면을 벗어나기 전 한 번 더 그려질 수 있어 null 처리 (플래너와 동일)
    final String? planId = ref.watch(selectedPlanIdProvider);

    // 보기를 전환해도 월별 가이드 상태(완료 체크)가 유지되도록 페이지가 provider를 계속 구독
    // - 보기 전환 중: 페이지가 구독 중이라 폐기되지 않음
    // - 플랜 화면(로컬 Shell)을 벗어나면: 구독이 끊겨 autoDispose로 폐기 > 다시 들어오면 새로 조회
    // - select로 에러 여부만 구독해서, 데이터가 바뀌어도(완료 체크 등) 페이지 전체가 다시 그려지지는 않음
    // 에러(조회 실패 / 가이드를 제공하지 않는 플랜)면 상단 ellipse 배경을 숨김
    final bool hasGuideError = planId != null &&
        ref.watch(
          monthlyGuideProvider(planId).select((guide) => guide.hasError),
        );

    return Scaffold(
      backgroundColor: AppColors.blue50,
      extendBodyBehindAppBar: true, // 배경 ellipse가 상단바 뒤까지 깔리도록
      appBar: TopAppBar(
        title: '월별 여행 준비 가이드',
        // local shell 탭의 첫 화면이라 기본 pop으로 나가지 못하므로 홈으로 직접 이동
        onBack: () => context.go(AppRoutes.home),
      ),
      body: Builder(
        builder: (context) {
          // top: 상태바 + 상단바 / bottom: 로컬 탭바 + 홈 인디케이터 (LocalShell extendBody)
          final EdgeInsets inset = MediaQuery.paddingOf(context);

          return Stack(
            fit: StackFit.expand,
            children: [
              // 배경: 월별 보기는 위+아래 ellipse, 전체 타임라인은 하단에 붙은 ellipse 하나만 표시.
              // 조회 실패 / 가이드를 제공하지 않는 플랜이면 월별 보기의 상단 ellipse는 숨김
              if (_viewType == GuideViewType.monthlyGuide) ...[
                if (!hasGuideError) const BgTopEllipse(),
                const BgBottomEllipse(),
              ] else
                const BgBottomAnchoredEllipse(),

              // 콘텐츠: 상단바 아래에서 시작, 스크롤하면 상단바 경계에서 잘림 / 로컬 탭바 뒤로는 지나감
              Positioned(
                top: inset.top,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  // 보기마다 스크롤 위치를 따로 (전환하면 각 보기의 처음 위치에서 시작)
                  key: ValueKey(_viewType),
                  clipBehavior: Clip.hardEdge,
                  padding: _contentPadding(inset),
                  child: planId == null
                      ? const SizedBox.shrink()
                      : _GuideContent(planId: planId, viewType: _viewType),
                ),
              ),

              // 보기 전환 버튼: 로컬 탭바 위에 떠 있음 (버튼 문구 = 누르면 바뀔 보기)
              Positioned(
                right: _horizontalPadding,
                bottom: inset.bottom + _swapButtonGap,
                child: BtnSwapGuideView(
                  viewType: _viewType.toggled,
                  onTap: _toggleView,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// 월별 가이드 데이터 조회 + 현재 보기(월별 / 전체 타임라인)
class _GuideContent extends ConsumerWidget {
  const _GuideContent({required this.planId, required this.viewType});

  final String planId;
  final GuideViewType viewType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MonthlyGuide> asyncGuide =
        ref.watch(monthlyGuideProvider(planId));

    Future<void> toggleTodo(String todoId) async {
      try {
        await ref.read(monthlyGuideProvider(planId).notifier).toggleTodo(todoId);
      } catch (_) {
        if (!context.mounted) return;
        showToast(
          context,
          text: '체크 상태를 저장하지 못했어요.\n다시 시도해 주세요.',
          type: ToastType.warning,
        );
      }
    }

    return asyncGuide.when(
      // 월별 보기: 스켈레톤, 전체 타임라인 보기: 전역 로딩
      loading: () => switch (viewType) {
        GuideViewType.monthlyGuide => const MonthlyGuideSkeleton(),
        GuideViewType.timeline => const ShowGlobalLoading(),
      },
      // 가이드를 제공하지 않는 플랜(이미 시작한 여행)과 조회 실패를 구분
      error: (error, _) => _MessageText(
        error is MonthlyGuideNotProvidedException
            ? '월별로 준비할 항목이 없어,\n가이드를 제공하지 않아요.'
            : '월별 여행 준비 가이드를 불러오지 못했어요.',
      ),
      data: (guide) => switch (viewType) {
        GuideViewType.monthlyGuide =>
          MonthlyMonthView(guide: guide, onTodoToggled: toggleTodo),
        GuideViewType.timeline =>
          MonthlyTimelineView(guide: guide, onTodoToggled: toggleTodo),
      },
    );
  }
}

/// 오류 안내 문구 (조회 실패 / 가이드를 제공하지 않는 플랜)
class _MessageText extends StatelessWidget {
  const _MessageText(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyMedium16.copyWith(color: AppColors.gray400),
      ),
    );
  }
}