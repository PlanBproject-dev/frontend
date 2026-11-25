// (맞춤 여행 체크) 여행 계획 분석 페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_select/presentation/providers/wallet_recommendation_provider.dart';
import 'package:plan_b/features/trip_select/presentation/providers/goal_recommendation_provider.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/feedback/loading_spinner.dart';
import 'package:plan_b/shared/widgets/feedback/gradient_loading_spinner.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';

class TripAnalysisPage extends ConsumerStatefulWidget {
  const TripAnalysisPage({super.key});

  @override
  ConsumerState<TripAnalysisPage> createState() => _TripAnalysisPageState();
}

class _TripAnalysisPageState extends ConsumerState<TripAnalysisPage> {
  static const double _titleTop = 92;      // safe area 상단 ~ 제목 헤더
  static const double _ctaBottomGap = 111; // CTA ~ 하단 safe area 간격

  // 서버가 빨리 응답해도 분석 중 화면을 이 시간만큼은 보여줌
  static const Duration _minLoadingDuration = Duration(seconds: 2);

  static const Duration _switchDuration = Duration(milliseconds: 300); // 분석 중 → 완료 전환 모션

  bool _isLoaded = false;
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _runAnalysis();
  }

  /// 서버 에러 코드
  static const String _priceLookupFailedCode = 'RECOMMENDATION011';     // 항공·숙소 가격 조회 실패
  static const String _noMatchingFlightStayCode = 'RECOMMENDATION012';  // 선택한 조건에 맞는 항공·숙소 없음
  static const String _noDestinationInBudgetCode = 'RECOMMENDATION013'; // 예산 안에서 갈 수 있는 여행지 없음

  /// 분석 실패 토스트 문구 (서버 에러 코드별, 그 외는 기본 문구)
  /// - code가 없는 경우(네트워크 오류, 추천 생성 시간 초과·실패 등)와 ApiException이 아닌 예외도 기본 문구
  static String _errorMessageOf(Object error) {
    final String? code = error is ApiException ? error.code : null;
    return switch (code) {
      _priceLookupFailedCode => '항공, 숙소 가격 조회에 실패했어요.\n조건을 바꿔 시도해주세요.',
      _noMatchingFlightStayCode => '적절한 항공편, 숙소를 못 찾았어요.\n조건을 바꿔 시도해주세요.',
      _noDestinationInBudgetCode => '예산 안에서 갈 수 있는\n여행지가 없어요.',
      _ => '여행 계획 분석에 실패했어요.\n다시 시도해주세요.',
    };
  }

  Future<void> _runAnalysis() async {
    final draft = ref.read(tripCheckDraftProvider);

    try {
      // 서버 응답과 최소 표시 시간 중 늦은 쪽에 완료
      await Future.wait([
        _requestAnalysis(draft),
        Future<void>.delayed(_minLoadingDuration),
      ]);
      if (!mounted) return;
      setState(() => _isLoaded = true);
    } catch (e) {
      if (!mounted) return;
      showToast(
        context,
        text: _errorMessageOf(e),
        type: ToastType.warning,
      );
      // 코드에서 직접 부르는 pop은 PopScope와 상관없이 동작함
      context.pop(); // 마지막 입력 화면으로 돌아가서 다시 시도
    }
  }

  /// 여행 계획 분석 요청
  /// - 플랜 최종 저장 -> AI 추천 생성까지 끝나야 분석 완료
  ///   (지갑 기준: 여행지 TOP 1~3 / 목표 기준: 고/중/저 예산 플랜)
  /// - 추천 생성만 실패한 뒤 재시도하면 최종 저장은 생략되고(입력값 그대로) 추천만 다시 요청됨
  Future<void> _requestAnalysis(TripCheckDraft draft) async {
    final notifier = ref.read(tripCheckDraftProvider.notifier);

    switch (draft.tripType) {
      case TripSelectionType.budget:
        await notifier.saveWalletPlan(isDraft: false);
        if (!mounted) return;

        // 이전 추천이 남지 않도록 항상 새로 생성
        ref.invalidate(walletRecommendationsProvider);
        await ref.read(walletRecommendationsProvider.future);
      case TripSelectionType.goal:
        await notifier.saveGoalPlan(isDraft: false);
        if (!mounted) return;

        // 이전 추천이 남지 않도록 항상 새로 생성
        ref.invalidate(goalRecommendationsProvider);
        await ref.read(goalRecommendationsProvider.future);
      case null:
        throw StateError('tripType이 선택되지 않았어요');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 분석 중: 플로우 중단 방지
    return PopScope(
      canPop: false,  // 분석 중에는 이미 최종 제출된 플랜이라 시스템 뒤로가기도 막음
      child: Stack(
        children: [
          // 배경: 흰색 + 배경 하단 ellipse
          const Positioned.fill(child: ColoredBox(color: Colors.white)),
          const BgBottomEllipse(),

          // 화면 정중앙 그래픽 (분석 중 <-> 완료 전환 시 페이드)
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedSwitcher(
                  duration: _switchDuration,
                  child: _isDone
                      ? const _DoneGraphic(key: ValueKey('done'))
                      : _LoadingGraphic(
                          key: const ValueKey('loading'),
                          isLoaded: _isLoaded,
                          onFilled: () => setState(() => _isDone = true),
                        ),
                ),
              ),
            ),
          ),

          // 실제 페이지
          AppPage(
            backgroundColor: Colors.transparent,
            header: Padding(
              padding: const EdgeInsets.only(top: _titleTop),
              child: TitleHeader(
                title: _isDone
                    ? '당신에게 딱 맞는\n여행 계획 분석 완료!'
                    : '당신에게 딱 맞는\n여행 계획 분석 중...',
                subtitle: _isDone ? null : '결과가 나오기까지 조금 걸릴 수 있어요',
                align: TitleHeaderAlign.center,
              ),
            ),
            body: const SizedBox.shrink(), // 그래픽은 화면 기준으로 바깥 Stack에 배치
            bottomCta: Padding(
              padding: const EdgeInsets.only(bottom: _ctaBottomGap),
              child: Cta(
                text: '내게 맞는 여행 플랜 고르러 가기',
                isActive: _isDone, // 분석 중에는 비활성
                // 맞춤 여행 체크 플로우를 스택에서 비우고 여행 고르기로 이동
                onPressed: () => context.go(AppRoutes.tripSelect),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 분석 중: 로딩 링 + 착륙 비행기
/// - AI 여행 플랜 생성 대기 중일 때: 그라데이션 링이 계속 천천히 회전
/// - 서버 응답 후: 회색 트랙 위 파란 호가 0 -> 100% 채워진 뒤 onFilled
class _LoadingGraphic extends StatelessWidget {
  const _LoadingGraphic({
    super.key,
    required this.isLoaded,
    required this.onFilled,
  });

  final bool isLoaded;         // 서버 응답 완료 여부
  final VoidCallback onFilled; // 링이 100% 채워지면 호출

  static const double _imageSize = 220;
  static const Duration _fillDuration = Duration(milliseconds: 1200); // 응답 후 링 채우는 시간

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        isLoaded
            ? LoadingSpinner(
                isComplete: true, // 마운트되자마자 0 -> 100% 채움
                fillDuration: _fillDuration,
                onFilled: onFilled,
                semanticsLabel: '여행 계획 분석 마무리 중',
              )
            : const GradientLoadingSpinner(semanticsLabel: '여행 계획 분석 중'),
        Image.asset(
          'assets/img/img_airplane_landing.png',
          width: _imageSize,
          height: _imageSize,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

/// 분석 완료: 나는 비행기
class _DoneGraphic extends StatelessWidget {
  const _DoneGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/img_airplane_fly.png',
      width: 247,
      height: 220,
      fit: BoxFit.contain,
    );
  }
}