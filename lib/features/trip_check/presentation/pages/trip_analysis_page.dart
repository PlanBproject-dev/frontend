// (맞춤 여행 체크) 여행 계획 분석 페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/feedback/loading_spinner.dart';
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
    } catch (_) {
      if (!mounted) return;
      showToast(
        context,
        text: '여행 계획 분석에 실패했어요. 다시 시도해 주세요.',
        type: ToastType.warning,
      );
      // 코드에서 직접 부르는 pop은 PopScope와 상관없이 동작함
      context.pop(); // 마지막 입력 화면으로 돌아가서 다시 시도
    }
  }

  /// 여행 계획 분석 요청
  // TODO: 서버 API 연동 (draft를 요청 바디로 변환해 전송, 응답으로 받은 플랜 저장)
  Future<void> _requestAnalysis(TripCheckDraft draft) async {
    await Future<void>.delayed(const Duration(seconds: 3)); // 임시: 서버 응답 대기 흉내
  }

  @override
  Widget build(BuildContext context) {
    // 분석 중에는 안드로이드 뒤로가기·iOS 스와이프 뒤로가기를 막음
    return PopScope(
      canPop: _isDone,
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
class _LoadingGraphic extends StatelessWidget {
  const _LoadingGraphic({
    super.key,
    required this.isLoaded,
    required this.onFilled,
  });

  final bool isLoaded;         // true가 되면 링을 끝까지 채움
  final VoidCallback onFilled; // 링이 100% 채워지면 호출

  static const double _imageSize = 220;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        LoadingSpinner(
          isComplete: isLoaded,
          onFilled: onFilled,
          semanticsLabel: '여행 계획 분석 중',
        ),
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