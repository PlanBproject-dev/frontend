import 'package:flutter/material.dart' show DateTimeRange;

import 'package:plan_b/features/trip_check/data/models/options/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/options/companion_type.dart';
import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/shared/models/destination.dart';

/// 여행 고르기 상단 '여행 기본 정보'에 표시할 데이터
class TripBasicInfo {
  const TripBasicInfo({
    this.tripType,
    this.destination,
    this.travelPeriod,
    this.peopleCount,
    this.companionType,
    this.maxBudget,
  });

  /// API 응답 전(로딩/실패)에 보여줄 값: 맞춤 여행 체크에서 입력한 값
  factory TripBasicInfo.fromDraft(TripCheckDraft draft) => TripBasicInfo(
        tripType: draft.tripType,
        destination: draft.destination,
        travelPeriod: draft.travelPeriod,
        peopleCount: draft.peopleCount,
        companionType: draft.companionType,
        maxBudget: draft.maxBudget,
      );

  final TripSelectionType? tripType;
  final Destination? destination;
  final DateTimeRange? travelPeriod;
  final int? peopleCount;
  final CompanionType? companionType;
  final BudgetRange? maxBudget;
}