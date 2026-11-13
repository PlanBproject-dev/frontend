// 맞춤 여행 체크 Step 1: 여행 계획 기준 선택 (지갑 기준 / 여행 목표 기준)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/trip_selection/trip_selection.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class TripTypePage extends ConsumerWidget {
  const TripTypePage({super.key});

  static const double _selectionTopGap = 58; // 제목 헤더 ~ 선택 카드 간격
  static const double _ctaBottomGap = 20;    // CTA ~ 하단 safe area 간격

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // tripType만 구독 (다른 단계 입력이 바뀌어도 이 화면은 다시 그리지 않음)
    final selected = ref.watch(
      tripCheckDraftProvider.select((draft) => draft.tripType),
    );

    void onNext() {
      if (selected == null) return;

      // 선택한 기준에 따라 플로우 분기 (단계 이동은 push로 쌓음)
      final nextRoute = switch (selected) {
        TripSelectionType.budget => AppRoutes.budgetFirstBasicInfo,
        TripSelectionType.goal => AppRoutes.goalFirstBasicInfo,
      };
      context.push(nextRoute);
    }

    return AppPage(
      appBar: const TopAppBar(),
      header: const TitleHeader(
        title: '무엇을 기준으로\n여행을 계획할 예정인가요?',
        size: TitleHeaderSize.md,
        align: TitleHeaderAlign.center,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: _selectionTopGap),
          TripSelection(
            selected: selected,
            onSelected: ref.read(tripCheckDraftProvider.notifier).selectTripType,
          ),
        ],
      ),
      bottomCta: Padding(
        padding: const EdgeInsets.only(bottom: _ctaBottomGap),
        child: Cta(
          text: '다음',
          isActive: selected != null,
          onPressed: onNext,
        ),
      ),
    );
  }
}