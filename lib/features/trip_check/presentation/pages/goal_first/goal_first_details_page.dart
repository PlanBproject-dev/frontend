// (맞춤 여행 체크) 목표 기준 Step 3: 세부 취향 입력 단계

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/trip_details_form.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class GoalFirstDetailsPage extends ConsumerStatefulWidget {
  const GoalFirstDetailsPage({super.key});

  @override
  ConsumerState<GoalFirstDetailsPage> createState() => _GoalFirstDetailsPageState();
}

class _GoalFirstDetailsPageState extends ConsumerState<GoalFirstDetailsPage> {
  static const double _ctaBottomGap = 20; // CTA ~ 하단 safe area 간격
  static const Duration _savedToastDelay = Duration(seconds: 1); // 임시저장 토스트를 화면에서 보여주는 시간

  bool _isSaving = false; // 중복 탭 방지

  Future<void> _onNext() async {
    if (_isSaving) return;
    setState(() => _isSaving = true); // 저장 + 토스트 대기 동안 CTA 비활성

    var saved = false;
    try {
      await ref.read(tripCheckDraftProvider.notifier).saveGoalPlan(isDraft: true);
      saved = true;
    } catch (_) {
      // 임시저장 실패는 진행을 막지 않음 (최종 제출 때 다시 전송됨)
    }
    if (!mounted) return;

    if (saved) {
      showToast(context, text: '진행상황이 저장되었습니다');
      await Future<void>.delayed(_savedToastDelay);
      if (!mounted) return;
    }

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    setState(() => _isSaving = false);

    // 저장·토스트 대기 중에 선택이 해제됐을 수 있으니 이동 직전에 다시 확인
    if (!TripDetailsForm.isComplete(ref.read(tripCheckDraftProvider))) return;

    context.push(AppRoutes.goalFirstFoodBudget);
  }

  @override
  Widget build(BuildContext context) {
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
          isActive: isComplete && !_isSaving,
          onPressed: _onNext,
        ),
      ),
    );
  }
}