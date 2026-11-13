// 맞춤 여행 체크 플로우에서 단계별로 입력한 값을 모아두는 모델

import 'package:flutter/material.dart' show DateTimeRange;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/trip_check/data/models/companion_type.dart';
import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';

part 'trip_check_draft.freezed.dart';

@freezed
class TripCheckDraft with _$TripCheckDraft {
  const factory TripCheckDraft({
    TripSelectionType? tripType, // Step 1 여행 계획 기준 (null이면 미선택)

    // 기본 정보
    DateTimeRange? travelPeriod,     // 여행 가능 시기 (시작일만 고르면 시작일 = 종료일)
    int? peopleCount,                // 여행 인원 (비어 있으면 null)
    CompanionType? companionType,    // 여행 구성원 유형
  }) = _TripCheckDraft;
}