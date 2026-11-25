// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmed_plan_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfirmedPlanDetailResponseDtoImpl
_$$ConfirmedPlanDetailResponseDtoImplFromJson(Map<String, dynamic> json) =>
    _$ConfirmedPlanDetailResponseDtoImpl(
      confirmPlanId: (json['confirmPlanId'] as num).toInt(),
      title: json['title'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      memberCount: (json['memberCount'] as num?)?.toInt(),
      memberType: json['memberType'] as String?,
      budgetRange: json['budgetRange'] as String?,
      foodBudgetRange: json['foodBudgetRange'] as String?,
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
      lowTotalCost: json['lowTotalCost'] as num?,
      highTotalCost: json['highTotalCost'] as num?,
    );

Map<String, dynamic> _$$ConfirmedPlanDetailResponseDtoImplToJson(
  _$ConfirmedPlanDetailResponseDtoImpl instance,
) => <String, dynamic>{
  'confirmPlanId': instance.confirmPlanId,
  'title': instance.title,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'memberCount': instance.memberCount,
  'memberType': instance.memberType,
  'budgetRange': instance.budgetRange,
  'foodBudgetRange': instance.foodBudgetRange,
  'lodging': instance.lodging,
  'flight': instance.flight,
  'courses': instance.courses,
  'lowTotalCost': instance.lowTotalCost,
  'highTotalCost': instance.highTotalCost,
};
