import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_select/data/models/budget_level.dart';
import 'package:plan_b/features/trip_select/data/repositories/trip_select_repository.dart';

/// 목표 기준 여행 고르기의 [예산 플랜 영수증 고/중/저]
/// - 생성: 여행 계획 분석 페이지에서 플랜 저장 직후 요청 (분석 로딩 중에 생성 완료)
/// - autoDispose 아님: 분석 페이지에서 만든 결과를 여행 고르기 페이지가 그대로 사용한다.
/// - 새로 생성/재시도: ref.invalidate(goalRecommendationsProvider)
final goalRecommendationsProvider = FutureProvider<List<BudgetLevelPlan>>((ref) {
  // planId / tripType이 바뀔 때만 다시 실행
  final planId = ref.watch(tripCheckDraftProvider.select((d) => d.planId));
  final tripType = ref.watch(tripCheckDraftProvider.select((d) => d.tripType));
  if (planId == null || tripType != TripSelectionType.goal) return const [];

  return ref.read(tripSelectRepositoryProvider).createGoalRecommendations(planId);
});