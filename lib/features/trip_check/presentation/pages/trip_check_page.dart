// 맞춤 여행 체크 시작(인트로) 화면

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class TripCheckPage extends ConsumerStatefulWidget {
  const TripCheckPage({super.key});

  @override
  ConsumerState<TripCheckPage> createState() => _TripCheckPageState();
}

class _TripCheckPageState extends ConsumerState<TripCheckPage> {
  static const double _titleExtraTop = 20;   // 상단바 ~ 제목 간격 36 (= 추가 20 + TitleHeader 내부 패딩 16)
  static const double _ctaBottomGap = 110;   // CTA ~ 하단 safe area 간격

  static const double _earthWidth = 262.4;
  static const double _earthHeight = 239.8;
  static const double _earthOffsetY = 4.1;   // 피그마상 화면 중앙에서 아래로 4.1 이동

  @override
  void initState() {
    super.initState();
    // 인트로 진입 시 입력 상태 초기화
    // (빌드 중에는 provider 상태를 바꿀 수 없어서 첫 프레임 이후에 실행)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(tripCheckDraftProvider.notifier).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 배경: 흰색 + 배경 하단 ellipse
        const Positioned.fill(child: ColoredBox(color: Colors.white)),
        const BgBottomEllipse(),

        // 화면 정중앙 지구 그래픽
        Positioned.fill(
          child: IgnorePointer(
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, _earthOffsetY),
                child: Image.asset(
                  'assets/img/img_earth.png',
                  width: _earthWidth,
                  height: _earthHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),

        // 실제 페이지
        AppPage(
          backgroundColor: Colors.transparent,
          appBar: const TopAppBar(),
          header: const Padding(
            padding: EdgeInsets.only(top: _titleExtraTop),
            child: TitleHeader(
              title: '본격적인 여행 전,\n내게 맞는 여행 플랜을 찾아봐요!',
              align: TitleHeaderAlign.center,
            ),
          ),
          body: const SizedBox.shrink(), // 지구는 화면 기준으로 바깥 Stack에 배치
          bottomCta: Padding(
            padding: const EdgeInsets.only(bottom: _ctaBottomGap),
            child: Cta(
              text: '맞춤 여행 계획 추천 시작!',
              onPressed: () => context.push(AppRoutes.tripType),
            ),
          ),
        ),
      ],
    );
  }
}