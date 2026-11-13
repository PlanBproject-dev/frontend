// (맞춤 여행 체크) 목표 기준 Step 3: 세부 취향 입력 단계

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/trip_details_form.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class GoalFirstDetailsPage extends ConsumerWidget {
  const GoalFirstDetailsPage({super.key});

  static const double _ctaBottomGap = 20; // CTA ~ 하단 safe area 간격

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isComplete = TripDetailsForm.isComplete(ref.watch(tripCheckDraftProvider));

    return AppPage(
      isScrollable: true, // 제목 + 입력 필드 전체 스크롤, 상단바는 고정
      appBar: const TopAppBar(),
      header: const TitleHeader(
        title: '더 상세한 여행 취향을 알려주세요.',
        size: TitleHeaderSize.md,
        align: TitleHeaderAlign.center,
      ),
      body: const TripDetailsForm(),
      bottomCta: Padding(
        padding: const EdgeInsets.only(bottom: _ctaBottomGap),
        child: Cta(
          text: '다음',
          isActive: isComplete,
          onPressed: () => context.push(AppRoutes.goalFirstFoodBudget),
        ),
      ),
    );
  }
}