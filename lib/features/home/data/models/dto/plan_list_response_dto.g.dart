// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanListResponseDtoImpl _$$PlanListResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PlanListResponseDtoImpl(
  ongoingPlans:
      (json['ongoingPlans'] as List<dynamic>?)
          ?.map((e) => PlanSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  upcomingPlans:
      (json['upcomingPlans'] as List<dynamic>?)
          ?.map((e) => PlanSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pastPlans:
      (json['pastPlans'] as List<dynamic>?)
          ?.map((e) => PlanSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PlanListResponseDtoImplToJson(
  _$PlanListResponseDtoImpl instance,
) => <String, dynamic>{
  'ongoingPlans': instance.ongoingPlans,
  'upcomingPlans': instance.upcomingPlans,
  'pastPlans': instance.pastPlans,
};

_$PlanSummaryDtoImpl _$$PlanSummaryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PlanSummaryDtoImpl(
  planId: (json['planId'] as num).toInt(),
  confirmedPlanId: (json['confirmedPlanId'] as num?)?.toInt(),
  travelGuideId: (json['travelGuideId'] as num?)?.toInt(),
  title: json['title'] as String?,
  destination: $enumDecodeNullable(_$DestinationEnumMap, json['destination']),
  destinationImageUrl: json['destinationImageUrl'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  lowTotalCost: json['lowTotalCost'] as num?,
  highTotalCost: json['highTotalCost'] as num?,
  dDay: (json['dDay'] as num?)?.toInt(),
  hashtags:
      (json['hashtags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$PlanSummaryDtoImplToJson(
  _$PlanSummaryDtoImpl instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'confirmedPlanId': instance.confirmedPlanId,
  'travelGuideId': instance.travelGuideId,
  'title': instance.title,
  'destination': _$DestinationEnumMap[instance.destination],
  'destinationImageUrl': instance.destinationImageUrl,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'lowTotalCost': instance.lowTotalCost,
  'highTotalCost': instance.highTotalCost,
  'dDay': instance.dDay,
  'hashtags': instance.hashtags,
};

const _$DestinationEnumMap = {
  Destination.tokyo: 'TOKYO',
  Destination.fukuoka: 'FUKUOKA',
  Destination.osaka: 'OSAKA',
  Destination.sapporo: 'SAPPORO',
  Destination.danang: 'DANANG',
  Destination.nhaTrang: 'NHA_TRANG',
  Destination.hanoi: 'HANOI',
  Destination.paris: 'PARIS',
  Destination.barcelona: 'BARCELONA',
  Destination.prague: 'PRAGUE',
  Destination.shanghai: 'SHANGHAI',
  Destination.beijing: 'BEIJING',
  Destination.chongqing: 'CHONGQING',
  Destination.la: 'LA',
  Destination.newYork: 'NEW_YORK',
  Destination.hawaii: 'HAWAII',
  Destination.hongKong: 'HONG_KONG',
  Destination.taiwan: 'TAIWAN',
};
