import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_plan_response_dto.freezed.dart';
part 'goal_plan_response_dto.g.dart';

/// POST /api/v1/plans/goal, PATCH /api/v1/plans/goal/{planId} 응답의 data (지금 필요한 값만)
@freezed
class GoalPlanResponseDto with _$GoalPlanResponseDto {
  const factory GoalPlanResponseDto({
    required int planId,
    bool? isDraft,
  }) = _GoalPlanResponseDto;

  factory GoalPlanResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GoalPlanResponseDtoFromJson(json);
}