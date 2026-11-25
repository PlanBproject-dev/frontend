// 확정된 플랜 id로 나의 여행 플래너 데이터 조회

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/planner/data/models/planner_trip_plan.dart';
import 'package:plan_b/features/planner/data/repositories/planner_repository.dart';

/// planId = 홈에서 선택한 confirmedPlanId
final plannerTripPlanProvider =
    FutureProvider.autoDispose.family<PlannerTripPlan, String>((ref, planId) {
  final int? confirmedPlanId = int.tryParse(planId);
  // 숫자가 아니면 조회할 수 없으므로 오류로 처리 (페이지 에러 UI)
  if (confirmedPlanId == null) throw StateError('확정된 플랜 id가 아님: $planId');

  return ref.read(plannerRepositoryProvider).getConfirmedPlan(confirmedPlanId);
});