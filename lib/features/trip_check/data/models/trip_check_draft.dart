// 맞춤 여행 체크 플로우에서 단계별로 입력한 값을 모아두는 모델

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';

part 'trip_check_draft.freezed.dart';

@freezed
class TripCheckDraft with _$TripCheckDraft {
  const factory TripCheckDraft({
    TripSelectionType? tripType, // Step 1 여행 계획 기준 (null이면 미선택)
  }) = _TripCheckDraft;
}