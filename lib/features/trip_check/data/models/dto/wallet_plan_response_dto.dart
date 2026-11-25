import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_plan_response_dto.freezed.dart';
part 'wallet_plan_response_dto.g.dart';

/// POST /api/v1/plans/wallet 응답의 data (지금 필요한 값만)
@freezed
class WalletPlanResponseDto with _$WalletPlanResponseDto {
  const factory WalletPlanResponseDto({
    required int planId,
    bool? isDraft,
  }) = _WalletPlanResponseDto;

  factory WalletPlanResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WalletPlanResponseDtoFromJson(json);
}