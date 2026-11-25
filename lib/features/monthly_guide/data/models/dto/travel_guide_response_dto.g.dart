// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_guide_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelGuideResponseDtoImpl _$$TravelGuideResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TravelGuideResponseDtoImpl(
  dDay: (json['dDay'] as num?)?.toInt(),
  totalCost: json['totalCost'] as num?,
  remainingMonths: (json['remainingMonths'] as num?)?.toInt(),
  monthlySavingAmount: json['monthlySavingAmount'] as num?,
  accumulatedSavingAmount: json['accumulatedSavingAmount'] as num?,
  period: json['period'] == null
      ? null
      : TravelGuidePeriodDto.fromJson(json['period'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$TravelGuideResponseDtoImplToJson(
  _$TravelGuideResponseDtoImpl instance,
) => <String, dynamic>{
  'dDay': instance.dDay,
  'totalCost': instance.totalCost,
  'remainingMonths': instance.remainingMonths,
  'monthlySavingAmount': instance.monthlySavingAmount,
  'accumulatedSavingAmount': instance.accumulatedSavingAmount,
  'period': instance.period,
};

_$TravelGuidePeriodDtoImpl _$$TravelGuidePeriodDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TravelGuidePeriodDtoImpl(
  periodStart: json['periodStart'] as String?,
  periodEnd: json['periodEnd'] as String?,
  saving: json['saving'] == null
      ? null
      : TravelGuideSavingDto.fromJson(json['saving'] as Map<String, dynamic>),
  todos:
      (json['todos'] as List<dynamic>?)
          ?.map((e) => TravelGuideTodoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TravelGuidePeriodDtoImplToJson(
  _$TravelGuidePeriodDtoImpl instance,
) => <String, dynamic>{
  'periodStart': instance.periodStart,
  'periodEnd': instance.periodEnd,
  'saving': instance.saving,
  'todos': instance.todos,
};

_$TravelGuideSavingDtoImpl _$$TravelGuideSavingDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TravelGuideSavingDtoImpl(
  savingId: (json['savingId'] as num).toInt(),
  periodStart: json['periodStart'] as String?,
  periodEnd: json['periodEnd'] as String?,
  amount: json['amount'] as num?,
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$$TravelGuideSavingDtoImplToJson(
  _$TravelGuideSavingDtoImpl instance,
) => <String, dynamic>{
  'savingId': instance.savingId,
  'periodStart': instance.periodStart,
  'periodEnd': instance.periodEnd,
  'amount': instance.amount,
  'isCompleted': instance.isCompleted,
};

_$TravelGuideTodoDtoImpl _$$TravelGuideTodoDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TravelGuideTodoDtoImpl(
  todoPeriodId: (json['todoPeriodId'] as num).toInt(),
  isCarriedOver: json['isCarriedOver'] as bool? ?? false,
  todoId: (json['todoId'] as num?)?.toInt(),
  recommendationDetailId: (json['recommendationDetailId'] as num?)?.toInt(),
  detailType: json['detailType'] as String?,
  content: json['content'] as String?,
  cost: json['cost'] as num?,
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$$TravelGuideTodoDtoImplToJson(
  _$TravelGuideTodoDtoImpl instance,
) => <String, dynamic>{
  'todoPeriodId': instance.todoPeriodId,
  'isCarriedOver': instance.isCarriedOver,
  'todoId': instance.todoId,
  'recommendationDetailId': instance.recommendationDetailId,
  'detailType': instance.detailType,
  'content': instance.content,
  'cost': instance.cost,
  'isCompleted': instance.isCompleted,
};

_$AllTimelineGuideResponseDtoImpl _$$AllTimelineGuideResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AllTimelineGuideResponseDtoImpl(
  periods:
      (json['periods'] as List<dynamic>?)
          ?.map((e) => TravelGuidePeriodDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AllTimelineGuideResponseDtoImplToJson(
  _$AllTimelineGuideResponseDtoImpl instance,
) => <String, dynamic>{'periods': instance.periods};
