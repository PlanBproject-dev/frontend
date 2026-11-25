// 여행 고르기 -> 여행 플랜 세팅 완료 페이지

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/features/home/presentation/providers/home_plans_provider.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_select/data/repositories/trip_select_repository.dart';
import 'package:plan_b/features/monthly_guide/presentation/providers/guide_creator_provider.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/feedback/loading_spinner.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';

class TripSelectCompletedPage extends ConsumerStatefulWidget {
  const TripSelectCompletedPage({super.key, required this.recommendationId});

  /// 여행 고르기에서 선택한 티켓/영수증의 recommendationId
  final String? recommendationId;

  @override
  ConsumerState<TripSelectCompletedPage> createState() =>
      _TripSelectCompletedPageState();
}

class _TripSelectCompletedPageState
    extends ConsumerState<TripSelectCompletedPage> {
  static const double _titleTop = 92;      // safe area 상단 ~ 제목 헤더
  static const double _ctaBottomGap = 111; // CTA ~ 하단 safe area 간격

  // 서버가 빨리 응답해도 세팅 중 화면을 이 시간만큼은 보여줌
  static const Duration _minLoadingDuration = Duration(seconds: 2);

  static const Duration _switchDuration = Duration(milliseconds: 300); // 세팅중 -> 완료 전환 모션

  // 가이드 생성 응답을 기다리는 최대 시간 (넘으면 홈 이동, 요청은 계속 진행)
  static const Duration _guideWaitLimit = Duration(seconds: 5); // 5초로 제한함

  bool _isLoaded = false; // 서버 응답 완료: 링을 끝까지 채우기 시작
  bool _isDone = false;   // 링이 다 채워짐: 완료 상태

  @override
  void initState() {
    super.initState();
    _runSetup();
  }

  Future<void> _runSetup() async {
    try {
      // 서버 응답과 최소 표시 시간 중 늦은 쪽에 완료
      await Future.wait([
        _requestPlanSetup(widget.recommendationId),
        Future<void>.delayed(_minLoadingDuration),
      ]);
      if (!mounted) return;
      setState(() => _isLoaded = true);
    } catch (_) {
      if (!mounted) return;
      showToast(
        context,
        text: '여행 플랜 세팅에 실패했어요.\n다시 시도해 주세요.',
        type: ToastType.warning,
      );
      // 코드에서 직접 부르는 pop은 PopScope와 상관없이 동작함
      context.pop(); // 여행 고르기로 돌아가서 다시 '확인'
    }
  }

  /// 선택한 추천 계획 확정 + 월별 가이드 생성
  Future<void> _requestPlanSetup(String? recommendationId) async {
    // 요청 중 이 페이지가 사라져도 (ex. 인증 만료로 redirect 등) 홈 목록을 갱신할 수 있도록
    // 위젯 ref 대신 앱 전체 ProviderContainer를 미리 잡아 둠
    final ProviderContainer container = ProviderScope.containerOf(context, listen: false);

    final int? planId = ref.read(tripCheckDraftProvider).planId;
    final int? recId = int.tryParse(recommendationId ?? '');
    if (planId == null || recId == null) {
      throw StateError('확정할 플랜 정보가 없음 (planId: $planId, recommendationId: $recommendationId)');
    }

    final int confirmedPlanId = await ref.read(tripSelectRepositoryProvider).confirmPlan(
          planId: planId,
          recommendationId: recId,
        );

    // 월별 가이드 생성
    // - 실패해도 세팅 실패로 처리하지 않음 (pop하면 confirm이 중복으로 나감)
    // - 실패한 플랜은 월별 가이드 탭 진입 시 다시 생성
    try {
      await container
          .read(guideCreatorProvider)
          .ensureGuide(confirmedPlanId)
          .timeout(_guideWaitLimit);
    } on TimeoutException {
      debugPrint('월별 가이드 생성 응답 지연: 홈으로 이동 (요청은 계속 진행)');
    } catch (e) {
      debugPrint('월별 가이드 생성 실패 (가이드 탭 진입 시 재시도): $e');
    }

    // 홈 '나의 여행 플랜' 목록에 새 플랜과 travelGuideId가 보이도록 다시 조회
    container.invalidate(homePlansProvider);
  }

  /// 여행 플랜이 만들어졌으므로 맞춤 여행 체크, 여행 고르기 스택을 모두 비우고 홈으로
  void _goHome() => context.go(AppRoutes.home);

  @override
  Widget build(BuildContext context) {
    // 세팅 중: 뒤로가기 막음
    // 완료 후: 여행 고르기로 돌아가면 플랜이 중복 생성될 수 있으므로 뒤로가기 = 홈으로
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _isDone) _goHome();
      },
      child: Stack(
        children: [
          // 배경: 흰색 + 배경 하단 ellipse
          const Positioned.fill(child: ColoredBox(color: Colors.white)),
          const BgBottomEllipse(),

          // 화면 정중앙 그래픽 (세팅 중 <-> 완료 전환 시 페이드)
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
                    ? '당신을 위한\n여행 플랜 세팅 완료!'
                    : '당신을 위한\n여행 플랜 세팅 중...',
                align: TitleHeaderAlign.center,
              ),
            ),
            body: const SizedBox.shrink(), // 그래픽은 화면 기준으로 바깥 Stack에 배치
            bottomCta: Padding(
              padding: const EdgeInsets.only(bottom: _ctaBottomGap),
              child: Cta(
                text: '여행 준비하러 가기',
                isActive: _isDone, // 세팅 중에는 비활성
                onPressed: _goHome,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 세팅 중: 로딩 링 + 세팅 중 그래픽
class _LoadingGraphic extends StatelessWidget {
  const _LoadingGraphic({
    super.key,
    required this.isLoaded,
    required this.onFilled,
  });

  final bool isLoaded;         // true가 되면 링을 끝까지 채움
  final VoidCallback onFilled; // 링이 100% 채워지면 호출

  // 세팅 중 그래픽 에셋
  static const String _imagePath = 'assets/img/img_vacation_loading.png';
  static const double _imageSize = 220;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        LoadingSpinner(
          isComplete: isLoaded,
          onFilled: onFilled,
          semanticsLabel: '여행 플랜 세팅 중',
        ),
        Image.asset(
          _imagePath,
          width: _imageSize,
          height: _imageSize,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

/// 세팅 완료: 비치 체어
class _DoneGraphic extends StatelessWidget {
  const _DoneGraphic({super.key});

  static const String _imagePath = 'assets/img/img_vacation.png';
  static const double _imageSize = 220;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _imagePath,
      width: _imageSize,
      height: _imageSize,
      fit: BoxFit.contain,
    );
  }
}