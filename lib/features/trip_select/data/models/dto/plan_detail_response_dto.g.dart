// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanDetailResponseDtoImpl _$$PlanDetailResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PlanDetailResponseDtoImpl(
  planId: (json['planId'] as num).toInt(),
  planType: json['planType'] as String?,
  destination: $enumDecodeNullable(
    _$DestinationEnumMap,
    json['destination'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  memberCount: (json['memberCount'] as num?)?.toInt(),
  memberType: json['memberType'] as String?,
  budgetRange: json['budgetRange'] as String?,
);

Map<String, dynamic> _$$PlanDetailResponseDtoImplToJson(
  _$PlanDetailResponseDtoImpl instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'planType': instance.planType,
  'destination': _$DestinationEnumMap[instance.destination],
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'memberCount': instance.memberCount,
  'memberType': instance.memberType,
  'budgetRange': instance.budgetRange,
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
