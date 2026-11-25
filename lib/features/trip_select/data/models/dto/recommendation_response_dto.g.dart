// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendationResponseDtoImpl _$$RecommendationResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendationResponseDtoImpl(
  status: $enumDecodeNullable(
    _$RecommendationStatusEnumMap,
    json['status'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map(
            (e) => RecommendationItemDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RecommendationResponseDtoImplToJson(
  _$RecommendationResponseDtoImpl instance,
) => <String, dynamic>{
  'status': _$RecommendationStatusEnumMap[instance.status],
  'recommendations': instance.recommendations,
};

const _$RecommendationStatusEnumMap = {
  RecommendationStatus.pending: 'PENDING',
  RecommendationStatus.done: 'DONE',
  RecommendationStatus.failed: 'FAILED',
};

_$RecommendationItemDtoImpl _$$RecommendationItemDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendationItemDtoImpl(
  recommendationId: (json['recommendationId'] as num).toInt(),
  recommendationValue: json['recommendationValue'] as String?,
  destination: $enumDecodeNullable(
    _$DestinationEnumMap,
    json['destination'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  lowTotalCost: json['lowTotalCost'] as num?,
  highTotalCost: json['highTotalCost'] as num?,
  lodging: json['lodging'] == null
      ? null
      : LodgingDto.fromJson(json['lodging'] as Map<String, dynamic>),
  flight: json['flight'] == null
      ? null
      : FlightDto.fromJson(json['flight'] as Map<String, dynamic>),
  courses:
      (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  hashtags:
      (json['hashtags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  summary: json['summary'] as String?,
);

Map<String, dynamic> _$$RecommendationItemDtoImplToJson(
  _$RecommendationItemDtoImpl instance,
) => <String, dynamic>{
  'recommendationId': instance.recommendationId,
  'recommendationValue': instance.recommendationValue,
  'destination': _$DestinationEnumMap[instance.destination],
  'lowTotalCost': instance.lowTotalCost,
  'highTotalCost': instance.highTotalCost,
  'lodging': instance.lodging,
  'flight': instance.flight,
  'courses': instance.courses,
  'hashtags': instance.hashtags,
  'summary': instance.summary,
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

_$LodgingDtoImpl _$$LodgingDtoImplFromJson(Map<String, dynamic> json) =>
    _$LodgingDtoImpl(
      lodgingType: json['lodgingType'] as String?,
      nights: (json['nights'] as num?)?.toInt(),
      roomType: json['roomType'] as String?,
      lowCost: json['lowCost'] as num?,
      highCost: json['highCost'] as num?,
    );

Map<String, dynamic> _$$LodgingDtoImplToJson(_$LodgingDtoImpl instance) =>
    <String, dynamic>{
      'lodgingType': instance.lodgingType,
      'nights': instance.nights,
      'roomType': instance.roomType,
      'lowCost': instance.lowCost,
      'highCost': instance.highCost,
    };

_$FlightDtoImpl _$$FlightDtoImplFromJson(Map<String, dynamic> json) =>
    _$FlightDtoImpl(
      flightType: json['flightType'] as String?,
      flightRoute: json['flightRoute'] as String?,
      isRoundFlight: json['isRoundFlight'] as bool?,
      lowCost: json['lowCost'] as num?,
      highCost: json['highCost'] as num?,
    );

Map<String, dynamic> _$$FlightDtoImplToJson(_$FlightDtoImpl instance) =>
    <String, dynamic>{
      'flightType': instance.flightType,
      'flightRoute': instance.flightRoute,
      'isRoundFlight': instance.isRoundFlight,
      'lowCost': instance.lowCost,
      'highCost': instance.highCost,
    };

_$CourseDtoImpl _$$CourseDtoImplFromJson(Map<String, dynamic> json) =>
    _$CourseDtoImpl(
      content: json['content'] as String?,
      cost: json['cost'] as num?,
    );

Map<String, dynamic> _$$CourseDtoImplToJson(_$CourseDtoImpl instance) =>
    <String, dynamic>{'content': instance.content, 'cost': instance.cost};
