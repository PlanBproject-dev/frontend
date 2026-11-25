// 나의 여행 플래너: 여행 플랜 기본 정보 카드 + 하단 총 예상 비용 바
// - tripType(지갑 기준 / 여행 목표 기준)에 따라 기본 정보의 세 번째 줄(예산 / 식사)만 달라짐
// - '더 자세한 여행 코스 보기' 탭 시 같은 플랜의 여행 코스 화면으로 이동

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/planner/data/models/planner_trip_plan.dart';
import 'package:plan_b/features/planner/presentation/widgets/my_trip_planner/planner_card.dart';
import 'package:plan_b/features/planner/presentation/widgets/my_trip_planner/planner_total_cost_bar.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';
import 'package:plan_b/shared/widgets/plan_card/plan_card_palette.dart';

class MyTripPlanner extends ConsumerWidget {
  const MyTripPlanner({super.key, required this.plan});

  final PlannerTripPlan plan;

  // 플래너 색상 = 여행 플랜 카드의 비선택(기본) 색상과 동일
  static final PlanCardPalette _palette = PlanCardPalette.of(false);

  /// 같은 플랜 id의 여행 코스 화면으로 이동 (로컬 Shell의 여행 코스 탭으로 전환)
  void _openCourse(BuildContext context, WidgetRef ref) {
    ref.read(selectedPlanIdProvider.notifier).select(plan.id);
    context.go(AppRoutes.course);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PlannerCard(
          plan: plan,
          palette: _palette,
          onCoursePressed: () => _openCourse(context, ref),
        ),
        PlannerTotalCostBar(totalCost: plan.totalCost, palette: _palette),
      ],
    );
  }
}
