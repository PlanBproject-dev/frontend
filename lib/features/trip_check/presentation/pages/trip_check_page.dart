// 맞춤 여행 체크 시작(인트로) 화면
// - 시작 버튼을 누를 때마다 입력 상태를 초기화하고 새 플로우 시작

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/shared/widgets/feedback/modal_primary.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class TripCheckPage extends ConsumerWidget {
  const TripCheckPage({super.key, this.isOnboarding = false});

  /// 로그인 직후 신규 회원으로 redirect되어 들어온 경우 (뒤로가기 대신 '건너뛰기')
  final bool isOnboarding;

  static const double _titleExtraTop = 20;   // 상단바 ~ 제목 간격 36 (= 추가 20 + TitleHeader 내부 패딩 16)
  static const double _ctaBottomGap = 110;   // CTA ~ 하단 safe area 간격

  static const double _earthWidth = 262.4;
  static const double _earthHeight = 239.8;
  static const double _earthOffsetY = 4.1;   // 피그마상 화면 중앙에서 아래로 4.1 이동

  /// 신규 회원 '건너뛰기': 확인 모달 > 건너뛰기 선택 시 홈으로 (취소: 모달만 닫힘)
  Future<void> _onSkipPressed(BuildContext context) async {
    final bool confirmed = await showModalPrimary(
      context,
      title: '새 여행 플랜 생성을\n건너뛰시겠습니까?',
      secondaryText: '취소',
      primaryText: '건너뛰기',
    );
    if (!confirmed || !context.mounted) return;

    context.go(AppRoutes.home);
  }

  /// 뒤로가기 (상단 버튼 / 시스템 뒤로가기 공통)
  /// - 아래 화면이 있음 (탭바 '새 플랜 생성'으로 push): pop > 홈
  /// - 아래 화면이 없음 (여행 고르기 '여행 조건 다시 선택'에서 go로 들어와 기본 정보에서 돌아온 경우): 홈으로 이동
  /// 누르는 시점에 확인해야 하므로 build에서 미리 계산하지 않음
  void _onBackPressed(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      // 온보딩: 기존처럼 시스템 뒤로가기 그대로 (앱 종료)
      // 그 외: 시스템 뒤로가기도 상단 뒤로가기와 같게 처리 (스택이 비었을 때 앱이 종료되지 않도록)
      canPop: isOnboarding,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _onBackPressed(context);
      },
      child: Stack(
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
            // 신규 회원: 뒤로가기 대신 우측 '건너뛰기' 노출 (바로 홈으로)
            // 그 외: 뒤로가기 (pop 또는 홈으로)
            appBar: TopAppBar(
              showBack: !isOnboarding,
              onBack: () => _onBackPressed(context),
              trailing: isOnboarding
                  ? TextButton(
                      onPressed: () => _onSkipPressed(context),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(48, 48),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: Text(
                        '건너뛰기',
                        style: AppTextStyles.labelMedium16.copyWith(color: AppColors.gray500),
                      ),
                    )
                  : null,
            ),
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
                onPressed: () {
                  // 새 플로우 시작: 이전 입력값 초기화 (뒤로가기로 인트로에 돌아온 경우 포함)
                  ref.read(tripCheckDraftProvider.notifier).reset();
                  context.push(AppRoutes.tripType);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
