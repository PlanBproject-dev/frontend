import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/data/models/budget_level.dart';
import 'package:plan_b/shared/models/destination.dart';
import 'package:plan_b/core/utils/cost_format.dart';

part 'recommendation_response_dto.freezed.dart';
part 'recommendation_response_dto.g.dart';

/// 추천 생성 상태 (서버: PENDING / DONE / FAILED)
@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum RecommendationStatus { pending, done, failed }

/// POST/GET /api/v1/plans/{planId}/recommendations/wallet, /goal 응답의 data
/// - status: PENDING(생성 중) / DONE(완료, recommendations 포함) / FAILED(생성 실패)
/// - 지갑 기준: RANK_1~3 (/wallet/more 추가 조회는 RANK_4~6, 같은 DTO로 파싱하며 status는 사용 안 함)
/// - 목표 기준: LEVEL_HIGH, MEDIUM, LOW
@freezed
class RecommendationResponseDto with _$RecommendationResponseDto {
  const factory RecommendationResponseDto({
    // 모르는 상태값이 오면: 앱이 죽지 않고 null로 처리 (Repository에서 실패로 처리)
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    RecommendationStatus? status,
    @Default([]) List<RecommendationItemDto> recommendations,
  }) = _RecommendationResponseDto;

  factory RecommendationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RecommendationResponseDtoFromJson(json);
}

@freezed
class RecommendationItemDto with _$RecommendationItemDto {
  const factory RecommendationItemDto({
    required int recommendationId,
    String? recommendationValue, // RANK_1~6 / LEVEL_HIGH/MEDIUM/LOW
    // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    Destination? destination,
    num? lowTotalCost,
    num? highTotalCost,
    LodgingDto? lodging,
    FlightDto? flight,
    @Default([]) List<CourseDto> courses,
    @Default([]) List<String> hashtags,
    String? summary,
  }) = _RecommendationItemDto;

  factory RecommendationItemDto.fromJson(Map<String, dynamic> json) =>
      _$RecommendationItemDtoFromJson(json);
}

@freezed
class LodgingDto with _$LodgingDto {
  const factory LodgingDto({
    String? lodgingType, // HOTEL, HOSTEL, RENTAL, GUESTHOUSE, RESORT, POOL_VILLA
    int? nights,
    String? roomType,
    num? lowCost,
    num? highCost,
  }) = _LodgingDto;

  factory LodgingDto.fromJson(Map<String, dynamic> json) =>
      _$LodgingDtoFromJson(json);
}

@freezed
class FlightDto with _$FlightDto {
  const factory FlightDto({
    String? flightType,  // LOW_COST, MAJOR
    String? flightRoute, // DIRECT, TRANSFER
    bool? isRoundFlight,
    num? lowCost,
    num? highCost,
  }) = _FlightDto;

  factory FlightDto.fromJson(Map<String, dynamic> json) =>
      _$FlightDtoFromJson(json);
}

@freezed
class CourseDto with _$CourseDto {
  const factory CourseDto({
    String? content,
    num? cost,
  }) = _CourseDto;

  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);
}

// 서버 -> 화면 모양으로 변환

extension RecommendationResponseDtoMapper on RecommendationResponseDto {
  /// 지갑 기준: RANK 순으로 정렬한 여행지 티켓 목록
  List<TripPlan> toWalletTripPlans() =>
      recommendations.map((dto) => dto.toTripPlan()).toList()
        ..sort((a, b) => a.rank.compareTo(b.rank));

  /// 목표 기준: 고 -> 중 -> 저예산 순으로 정렬한 영수증 목록
  /// (모르는 LEVEL 값은 예산 태그를 표시할 수 없어서 제외)
  List<BudgetLevelPlan> toGoalBudgetPlans() {
    final plans = <BudgetLevelPlan>[
      for (final dto in recommendations)
        if (_budgetLevel(dto.recommendationValue) case final level?)
          (level: level, plan: dto.toTripPlan()),
    ];
    return plans..sort((a, b) => a.level.index.compareTo(b.level.index));
  }
}

extension RecommendationItemDtoMapper on RecommendationItemDto {
    TripPlan toTripPlan() => TripPlan(
      // 선택 후 추천 계획 결정(POST /plans/{planId}/confirm)에 recommendationId를 그대로 보냄
      id: recommendationId.toString(),
      rank: _rank(recommendationValue),
      destination: destination,
      // '#'은 PlanTags가 붙이므로 서버 값에 '#'이 있으면 제거 (홈 해시태그와 같은 처리)
      // 서버가 해시태그를 안 주면 기존처럼 여행지 이름 하나로 대체
      tags: hashtags.isNotEmpty
          ? hashtags.map((tag) => tag.replaceFirst('#', '')).toList()
          : [if (destination != null) destination!.label],
      highlights: courses
          .map((c) => TripPlanCostItem(title: c.content ?? '', cost: formatCostRange(c.cost, c.cost)))
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
      // 비어 있으면 요약 박스를 숨김 (ticket_body, trip_plan_receipt에서 isNotEmpty 확인)
      summary: summary?.trim() ?? '',
    );
}

/// 'RANK_2' -> 2 (형식이 다르면 0)
int _rank(String? value) =>
    int.tryParse(value?.replaceFirst('RANK_', '') ?? '') ?? 0;

/// 'LEVEL_HIGH' -> BudgetLevel.high (모르는 값이면 null)
BudgetLevel? _budgetLevel(String? value) => switch (value) {
      'LEVEL_HIGH' => BudgetLevel.high,
      'LEVEL_MEDIUM' => BudgetLevel.medium,
      'LEVEL_LOW' => BudgetLevel.low,
      _ => null,
    };

/// 호스텔 패밀리룸 (6박)
String lodgingTitle(LodgingDto? lodging) {
  if (lodging == null) return '-';
  final type = switch (lodging.lodgingType) {
    'HOTEL' => '호텔',
    'HOSTEL' => '호스텔',
    'RENTAL' => '펜션',
    'GUESTHOUSE' => '게스트하우스',
    'RESORT' => '리조트',
    'POOL_VILLA' => '풀빌라',
    _ => null,
  };
  final name = [type, lodging.roomType]
      .whereType<String>()
      .where((s) => s.isNotEmpty)
      .join(' ');
  final nights = lodging.nights != null ? ' (${lodging.nights}박)' : '';
  return name.isEmpty ? '-' : '$name$nights';
}

/// 저가항공 직항 왕복
String flightTitle(FlightDto? flight) {
  if (flight == null) return '-';
  final parts = [
    switch (flight.flightType) {
      'LOW_COST' => '저가항공',
      'MAJOR' => '주요항공',
      _ => null,
    },
    switch (flight.flightRoute) {
      'DIRECT' => '직항',
      'TRANSFER' => '경유',
      _ => null,
    },
    switch (flight.isRoundFlight) {
      true => '왕복',
      false => '편도',
      null => null,
    },
  ].whereType<String>();
  return parts.isEmpty ? '-' : parts.join(' ');
}

/// 금액 범위 표시 문구
/// 500000, 700000 -> '50-70만원' / 같거나 하나만 있으면 '약 15만원' / 0원 '무료' / 1만원 이하 '1만원 이하' / 없음 '비용 알 수 없음'
String formatCostRange(num? low, num? high) => CostFormat.range(low, high);