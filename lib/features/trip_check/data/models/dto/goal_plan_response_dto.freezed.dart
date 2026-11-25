// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_plan_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GoalPlanResponseDto _$GoalPlanResponseDtoFromJson(Map<String, dynamic> json) {
  return _GoalPlanResponseDto.fromJson(json);
}

/// @nodoc
mixin _$GoalPlanResponseDto {
  int get planId => throw _privateConstructorUsedError;
  bool? get isDraft => throw _privateConstructorUsedError;

  /// Serializes this GoalPlanResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalPlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalPlanResponseDtoCopyWith<GoalPlanResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalPlanResponseDtoCopyWith<$Res> {
  factory $GoalPlanResponseDtoCopyWith(
    GoalPlanResponseDto value,
    $Res Function(GoalPlanResponseDto) then,
  ) = _$GoalPlanResponseDtoCopyWithImpl<$Res, GoalPlanResponseDto>;
  @useResult
  $Res call({int planId, bool? isDraft});
}

/// @nodoc
class _$GoalPlanResponseDtoCopyWithImpl<$Res, $Val extends GoalPlanResponseDto>
    implements $GoalPlanResponseDtoCopyWith<$Res> {
  _$GoalPlanResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalPlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? planId = null, Object? isDraft = freezed}) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as int,
            isDraft: freezed == isDraft
                ? _value.isDraft
                : isDraft // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalPlanResponseDtoImplCopyWith<$Res>
    implements $GoalPlanResponseDtoCopyWith<$Res> {
  factory _$$GoalPlanResponseDtoImplCopyWith(
    _$GoalPlanResponseDtoImpl value,
    $Res Function(_$GoalPlanResponseDtoImpl) then,
  ) = __$$GoalPlanResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int planId, bool? isDraft});
}

/// @nodoc
class __$$GoalPlanResponseDtoImplCopyWithImpl<$Res>
    extends _$GoalPlanResponseDtoCopyWithImpl<$Res, _$GoalPlanResponseDtoImpl>
    implements _$$GoalPlanResponseDtoImplCopyWith<$Res> {
  __$$GoalPlanResponseDtoImplCopyWithImpl(
    _$GoalPlanResponseDtoImpl _value,
    $Res Function(_$GoalPlanResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalPlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? planId = null, Object? isDraft = freezed}) {
    return _then(
      _$GoalPlanResponseDtoImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as int,
        isDraft: freezed == isDraft
            ? _value.isDraft
            : isDraft // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalPlanResponseDtoImpl implements _GoalPlanResponseDto {
  const _$GoalPlanResponseDtoImpl({required this.planId, this.isDraft});

  factory _$GoalPlanResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalPlanResponseDtoImplFromJson(json);

  @override
  final int planId;
  @override
  final bool? isDraft;

  @override
  String toString() {
    return 'GoalPlanResponseDto(planId: $planId, isDraft: $isDraft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalPlanResponseDtoImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, planId, isDraft);

  /// Create a copy of GoalPlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalPlanResponseDtoImplCopyWith<_$GoalPlanResponseDtoImpl> get copyWith =>
      __$$GoalPlanResponseDtoImplCopyWithImpl<_$GoalPlanResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalPlanResponseDtoImplToJson(this);
  }
}

abstract class _GoalPlanResponseDto implements GoalPlanResponseDto {
  const factory _GoalPlanResponseDto({
    required final int planId,
    final bool? isDraft,
  }) = _$GoalPlanResponseDtoImpl;

  factory _GoalPlanResponseDto.fromJson(Map<String, dynamic> json) =
      _$GoalPlanResponseDtoImpl.fromJson;

  @override
  int get planId;
  @override
  bool? get isDraft;

  /// Create a copy of GoalPlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalPlanResponseDtoImplCopyWith<_$GoalPlanResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
