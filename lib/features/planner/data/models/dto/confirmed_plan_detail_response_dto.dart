import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/planner/data/models/planner_trip_plan.dart';
import 'package:plan_b/features/trip_check/data/models/options/budget_range.dart';
import 'package:plan_b/features/trip_check/data/models/options/companion_type.dart';
import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/features/trip_select/data/models/dto/plan_detail_response_dto.dart';
import 'package:plan_b/features/trip_select/data/models/dto/recommendation_response_dto.dart';
import 'package:plan_b/shared/models/trip_plan_cost_item.dart';

part 'confirmed_plan_detail_response_dto.freezed.dart';
part 'confirmed_plan_detail_response_dto.g.dart';

/// GET /api/v1/plans/confirm/{confirmedPlanId} 응답의 data
@freezed
class ConfirmedPlanDetailResponseDto with _$ConfirmedPlanDetailResponseDto {
  const factory ConfirmedPlanDetailResponseDto({
    required int confirmPlanId,
    String? title,
    String? startDate,
    String? endDate,
    int? memberCount,
    String? memberType,
    String? budgetRange,      // 지갑 기준만 사용
    String? foodBudgetRange,  // 목표 기준만 사용
    LodgingDto? lodging,
    FlightDto? flight,
    @Default([]) List<CourseDto> courses,
    num? lowTotalCost,
    num? highTotalCost,
  }) = _ConfirmedPlanDetailResponseDto;

  factory ConfirmedPlanDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ConfirmedPlanDetailResponseDtoFromJson(json);
}

// 서버 -> UI 모양 변환

extension ConfirmedPlanDetailResponseDtoMapper on ConfirmedPlanDetailResponseDto {
  PlannerTripPlan toPlannerTripPlan() {
    final TripSelectionType type = _tripType();

    return PlannerTripPlan(
      id: confirmPlanId.toString(),
      tripType: type,
      title: title ?? '',
      period: _period(startDate, endDate),
      people: _people(memberCount, companionTypeFromServer(memberType)),
      condition: switch (type) {
        TripSelectionType.budget => _budgetCondition(budgetRangeFromServer(budgetRange)),
        TripSelectionType.goal => _mealCondition(foodBudgetRange),
      },
      highlights: courses
          .map((c) => TripPlanCostItem(
                title: c.content ?? '',
                cost: formatCostRange(c.cost, c.cost),
              ))
          .toList(),
      accommodation: TripPlanCostItem(
        title: lodgingTitle(lodging),
        cost: formatCostRange(lodging?.lowCost, lodging?.highCost),
      ),
      flight: TripPlanCostItem(
        title: flightTitle(flight),
        cost: formatCostRange(flight?.lowCost, flight?.highCost),
      ),
      totalCost: formatCostRange(lowTotalCost, highTotalCost),
    );
  }

  /// budgetRange 유무로 지갑 기준인지, 목표 기준인지 플로우를 판단
  TripSelectionType _tripType() =>
      budgetRange != null ? TripSelectionType.budget : TripSelectionType.goal;
}

/// 26.08.10 - 26.08.18 (하루면 날짜 하나만)
String _period(String? startDate, String? endDate) {
  final DateTime? start = DateTime.tryParse(startDate ?? '');
  final DateTime? end = DateTime.tryParse(endDate ?? '');
  if (start == null) return '-';

  String two(int n) => n.toString().padLeft(2, '0');
  String format(DateTime d) => '${two(d.year % 100)}.${two(d.month)}.${two(d.day)}';

  if (end == null || !end.isAfter(start)) return format(start);
  return '${format(start)} - ${format(end)}';
}

/// 4명 | 가족
String _people(int? count, CompanionType? companion) {
  final String text = [
    if (count != null) '$count명',
    if (companion != null) companion.label,
  ].join(' | ');
  return text.isEmpty ? '-' : text;
}

/// 인당 최대 300만원 / 인당 400만원 이상
String _budgetCondition(BudgetRange? budget) {
  if (budget == null) return '-';
  final int? max = budget.maxManwon;
  return max == null ? '인당 ${budget.label}' : '인당 최대 $max만원';
}

/// 1인당 한 끼 최대 3만원 기준 (GoalPlanRequestDto._foodBudgetRange의 역변환)
String _mealCondition(String? value) => switch (value) {
      'UNDER_1' => '1인당 한 끼 최대 1만원 기준',
      'UNDER_3' => '1인당 한 끼 최대 3만원 기준',
      'UNDER_5' => '1인당 한 끼 최대 5만원 기준',
      'UNDER_10' => '1인당 한 끼 최대 10만원 기준',
      'OVER_10' => '1인당 한 끼 10만원 이상 기준',
      _ => '-',
    };