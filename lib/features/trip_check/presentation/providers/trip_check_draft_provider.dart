// 맞춤 여행 체크 플로우 전체가 공유하는 입력 상태
// - 초기화: 인트로(TripCheckPage) 진입 시 reset() 호출한다

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';

class TripCheckDraftNotifier extends Notifier<TripCheckDraft> {
  @override
  TripCheckDraft build() => const TripCheckDraft();

  /// 플로우 시작 시 전체 초기화
  void reset() => state = const TripCheckDraft();

  /// Step 1: 여행 계획 기준 선택
  /// 기준이 바뀌면 이후 단계 입력은 다른 플로우 값이므로 함께 초기화
  void selectTripType(TripSelectionType type) {
    if (state.tripType == type) return;
    state = TripCheckDraft(tripType: type);
  }
}

final tripCheckDraftProvider =
    NotifierProvider<TripCheckDraftNotifier, TripCheckDraft>(
  TripCheckDraftNotifier.new,
);