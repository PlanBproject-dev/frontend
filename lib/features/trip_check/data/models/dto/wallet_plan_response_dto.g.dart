// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_plan_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletPlanResponseDtoImpl _$$WalletPlanResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WalletPlanResponseDtoImpl(
  planId: (json['planId'] as num).toInt(),
  isDraft: json['isDraft'] as bool?,
);

Map<String, dynamic> _$$WalletPlanResponseDtoImplToJson(
  _$WalletPlanResponseDtoImpl instance,
) => <String, dynamic>{'planId': instance.planId, 'isDraft': instance.isDraft};
