// 맞춤 여행 체크 Step 1: 여행 계획 기준 선택 (지갑 기준 / 여행 목표 기준)

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/trip_selection/trip_selection.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class TripTypePage extends StatefulWidget {
  const TripTypePage({super.key});

  @override
  State<TripTypePage> createState() => _TripTypePageState();
}

class _TripTypePageState extends State<TripTypePage> {
  static const double _selectionTopGap = 58; // 제목 헤더 ~ 선택 카드 간격
  static const double _ctaBottomGap = 20;    // CTA ~ 하단 safe area 간격

  TripSelectionType? _selected; // null이면 아직 선택 안 함 (CTA 비활성)

  void _onNext() {
    final selected = _selected;
    if (selected == null) return;

    // 선택한 기준에 따라 플로우 분기 (단계 이동은 push로 쌓음)
    final nextRoute = switch (selected) {
      TripSelectionType.budget => AppRoutes.budgetFirstBasicInfo,
      TripSelectionType.goal => AppRoutes.goalFirstBasicInfo,
    };
    context.push(nextRoute);
  }

  @override
  Widget build(BuildContext context) {
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
            selected: _selected,
            onSelected: (type) => setState(() => _selected = type),
          ),
        ],
      ),
      bottomCta: Padding(
        padding: const EdgeInsets.only(bottom: _ctaBottomGap),
        child: Cta(
          text: '다음',
          isActive: _selected != null,
          onPressed: _onNext,
        ),
      ),
    );
  }
}