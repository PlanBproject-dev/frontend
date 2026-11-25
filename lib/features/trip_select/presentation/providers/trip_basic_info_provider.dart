import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_select/data/models/trip_basic_info.dart';
import 'package:plan_b/features/trip_select/data/repositories/trip_select_repository.dart';

/// 여행 고르기 상단의 [여행 기본 정보] 부분
final tripBasicInfoProvider = FutureProvider.autoDispose<TripBasicInfo?>((ref) {
  // planId가 바뀔 때만 다시 실행 (다른 draft 값 변경에는 반응하지 않음)
  final planId = ref.watch(tripCheckDraftProvider.select((d) => d.planId));
  if (planId == null) return null;

  return ref.read(tripSelectRepositoryProvider).getPlanBasicInfo(planId);
});