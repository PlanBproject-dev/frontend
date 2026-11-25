import 'package:flutter/material.dart' show DateTimeRange;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/home/data/models/trip_plan_summary.dart';
import 'package:plan_b/shared/models/destination.dart';

part 'plan_list_response_dto.freezed.dart';
part 'plan_list_response_dto.g.dart';

/// GET /api/v1/plans/list 응답의 data
@freezed
class PlanListResponseDto with _$PlanListResponseDto {
  const factory PlanListResponseDto({
    @Default([]) List<PlanSummaryDto> ongoingPlans,
    @Default([]) List<PlanSummaryDto> upcomingPlans,
    @Default([]) List<PlanSummaryDto> pastPlans,
  }) = _PlanListResponseDto;

  factory PlanListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlanListResponseDtoFromJson(json);
}

/// 플랜 하나 (서버 모양 그대로)
@freezed
class PlanSummaryDto with _$PlanSummaryDto {
  const factory PlanSummaryDto({
    required int planId,
    int? confirmedPlanId,
    int? travelGuideId, // 월별 여행 준비 가이드 조회용
    String? title,
    // 서버에 모르는 여행지가 새로 생겨도 앱이 죽지 않고 null로 처리
    Destination? destination,
    String? destinationImageUrl,
    String? startDate, // "2026-12-01"
    String? endDate,
    num? lowTotalCost,
    num? highTotalCost,
    int? dDay,
    @Default([]) List<String> hashtags,
  }) = _PlanSummaryDto;

  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Destination? get destination;

  factory PlanSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$PlanSummaryDtoFromJson(json);
}

// 서버 모양 -> 화면 모양 변환

extension PlanListResponseDtoMapper on PlanListResponseDto {
  /// 세 목록을 하나로 합침 (진행중/다가오는/지난 구분은 기존처럼 화면에서 날짜로 계산)
  List<TripPlanSummary> toTripPlanSummaries() => [
        ...ongoingPlans,
        ...upcomingPlans,
        ...pastPlans,
      ].map((dto) => dto.toTripPlanSummary()).whereType<TripPlanSummary>().toList();
}

extension PlanSummaryDtoMapper on PlanSummaryDto {
  /// 날짜가 없으면 홈에 표시할 수 없어서 null 반환 (목록에서 제외됨)
  TripPlanSummary? toTripPlanSummary() {
    final start = DateTime.tryParse(startDate ?? '');
    final end = DateTime.tryParse(endDate ?? '');
    if (start == null || end == null) return null;

    return TripPlanSummary(
      // 플래너/코스 API가 모두 confirmedPlanId를 쓰므로 이걸 id로 사용
      id: (confirmedPlanId ?? planId).toString(),
      planId: planId,
      travelGuideId: travelGuideId,
      thumbnailUrl: destinationImageUrl ?? '',
      title: title ?? '',
      destination: destination?.label ?? '',
      tags: hashtags.map((tag) => tag.replaceFirst('#', '')).toList(), // UI는 '#' 없이 받음
      period: DateTimeRange(start: start, end: end),
      budget: _formatBudget(lowTotalCost, highTotalCost),
    );
  }
}

/// 2000000, 2700000 -> '200-270만원'
String _formatBudget(num? low, num? high) {
  String man(num won) => (won / 10000).round().toString();
  if (low == null && high == null) return '';
  if (low == null || high == null || low == high) return '${man(low ?? high!)}만원';
  return '${man(low)}-${man(high)}만원';
}