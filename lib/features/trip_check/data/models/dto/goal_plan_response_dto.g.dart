// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_plan_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalPlanResponseDtoImpl _$$GoalPlanResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$GoalPlanResponseDtoImpl(
  planId: (json['planId'] as num).toInt(),
  isDraft: json['isDraft'] as bool?,
);

Map<String, dynamic> _$$GoalPlanResponseDtoImplToJson(
  _$GoalPlanResponseDtoImpl instance,
) => <String, dynamic>{'planId': instance.planId, 'isDraft': instance.isDraft};
