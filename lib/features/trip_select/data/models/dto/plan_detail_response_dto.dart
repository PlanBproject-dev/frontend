import 'package:flutter/material.dart' show DateTimeRange;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/trip_check/data/models/options/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/options/companion_type.dart';
import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/features/trip_select/data/models/trip_basic_info.dart';
import 'package:plan_b/shared/models/destination.dart';

part 'plan_detail_response_dto.freezed.dart';
part 'plan_detail_response_dto.g.dart';

/// GET /api/v1/plans/{planId} 응답의 data
@freezed
class PlanDetailResponseDto with _$PlanDetailResponseDto {
  const factory PlanDetailResponseDto({
    required int planId,
    String? planType,
    // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    Destination? destination, // 목표 기준만
    String? startDate,
    String? endDate,
    int? memberCount,
    String? memberType,
    String? budgetRange,      // 지갑 기준만
  }) = _PlanDetailResponseDto;

  factory PlanDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlanDetailResponseDtoFromJson(json);
}

// 서버 모양 -> 화면 모양 변환

extension PlanDetailResponseDtoMapper on PlanDetailResponseDto {
  TripBasicInfo toTripBasicInfo() {
    final start = DateTime.tryParse(startDate ?? '');
    final end = DateTime.tryParse(endDate ?? '');

    return TripBasicInfo(
      tripType: _tripType(planType),
      destination: destination,
      // 종료일이 없거나 시작일보다 앞이면 하루 여행으로 처리 (DateTimeRange assert 방지)
      travelPeriod: start == null
          ? null
          : DateTimeRange(
              start: start,
              end: (end != null && !end.isBefore(start)) ? end : start,
            ),
      peopleCount: memberCount,
      companionType: companionTypeFromServer(memberType),
      maxBudget: budgetRangeFromServer(budgetRange),
    );
  }
}

/// CommonTravelPlanDto._member의 역변환
CompanionType? companionTypeFromServer(String? value) => switch (value) {
      'ALONE' => CompanionType.solo,
      'FAMILY' => CompanionType.family,
      'FRIEND' => CompanionType.friends,
      'COUPLE' => CompanionType.couple,
      'BUSINESS' => CompanionType.business,
      'GROUP' => CompanionType.group,
      _ => null,
    };

/// WalletPlanRequestDto._budget의 역변환
BudgetRange? budgetRangeFromServer(String? value) => switch (value) {
      'UNDER_100' => BudgetRange.upTo100,
      'UNDER_200' => BudgetRange.upTo200,
      'UNDER_300' => BudgetRange.upTo300,
      'UNDER_400' => BudgetRange.upTo400,
      'OVER_400' => BudgetRange.over400,
      _ => null,
    };

TripSelectionType? _tripType(String? value) => switch (value) {
  'WALLET' => TripSelectionType.budget,
  'GOAL' => TripSelectionType.goal,
  _ => null,
};