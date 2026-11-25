// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlanDetailResponseDto _$PlanDetailResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _PlanDetailResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PlanDetailResponseDto {
  int get planId => throw _privateConstructorUsedError;
  String? get planType =>
      throw _privateConstructorUsedError; // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Destination? get destination => throw _privateConstructorUsedError; // 목표 기준만
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  int? get memberCount => throw _privateConstructorUsedError;
  String? get memberType => throw _privateConstructorUsedError;
  String? get budgetRange => throw _privateConstructorUsedError;

  /// Serializes this PlanDetailResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanDetailResponseDtoCopyWith<PlanDetailResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanDetailResponseDtoCopyWith<$Res> {
  factory $PlanDetailResponseDtoCopyWith(
    PlanDetailResponseDto value,
    $Res Function(PlanDetailResponseDto) then,
  ) = _$PlanDetailResponseDtoCopyWithImpl<$Res, PlanDetailResponseDto>;
  @useResult
  $Res call({
    int planId,
    String? planType,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    Destination? destination,
    String? startDate,
    String? endDate,
    int? memberCount,
    String? memberType,
    String? budgetRange,
  });
}

/// @nodoc
class _$PlanDetailResponseDtoCopyWithImpl<
  $Res,
  $Val extends PlanDetailResponseDto
>
    implements $PlanDetailResponseDtoCopyWith<$Res> {
  _$PlanDetailResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? planType = freezed,
    Object? destination = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? memberCount = freezed,
    Object? memberType = freezed,
    Object? budgetRange = freezed,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as int,
            planType: freezed == planType
                ? _value.planType
                : planType // ignore: cast_nullable_to_non_nullable
                      as String?,
            destination: freezed == destination
                ? _value.destination
                : destination // ignore: cast_nullable_to_non_nullable
                      as Destination?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            memberCount: freezed == memberCount
                ? _value.memberCount
                : memberCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            memberType: freezed == memberType
                ? _value.memberType
                : memberType // ignore: cast_nullable_to_non_nullable
                      as String?,
            budgetRange: freezed == budgetRange
                ? _value.budgetRange
                : budgetRange // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanDetailResponseDtoImplCopyWith<$Res>
    implements $PlanDetailResponseDtoCopyWith<$Res> {
  factory _$$PlanDetailResponseDtoImplCopyWith(
    _$PlanDetailResponseDtoImpl value,
    $Res Function(_$PlanDetailResponseDtoImpl) then,
  ) = __$$PlanDetailResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int planId,
    String? planType,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    Destination? destination,
    String? startDate,
    String? endDate,
    int? memberCount,
    String? memberType,
    String? budgetRange,
  });
}

/// @nodoc
class __$$PlanDetailResponseDtoImplCopyWithImpl<$Res>
    extends
        _$PlanDetailResponseDtoCopyWithImpl<$Res, _$PlanDetailResponseDtoImpl>
    implements _$$PlanDetailResponseDtoImplCopyWith<$Res> {
  __$$PlanDetailResponseDtoImplCopyWithImpl(
    _$PlanDetailResponseDtoImpl _value,
    $Res Function(_$PlanDetailResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? planType = freezed,
    Object? destination = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? memberCount = freezed,
    Object? memberType = freezed,
    Object? budgetRange = freezed,
  }) {
    return _then(
      _$PlanDetailResponseDtoImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as int,
        planType: freezed == planType
            ? _value.planType
            : planType // ignore: cast_nullable_to_non_nullable
                  as String?,
        destination: freezed == destination
            ? _value.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as Destination?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        memberCount: freezed == memberCount
            ? _value.memberCount
            : memberCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        memberType: freezed == memberType
            ? _value.memberType
            : memberType // ignore: cast_nullable_to_non_nullable
                  as String?,
        budgetRange: freezed == budgetRange
            ? _value.budgetRange
            : budgetRange // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanDetailResponseDtoImpl implements _PlanDetailResponseDto {
  const _$PlanDetailResponseDtoImpl({
    required this.planId,
    this.planType,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    this.destination,
    this.startDate,
    this.endDate,
    this.memberCount,
    this.memberType,
    this.budgetRange,
  });

  factory _$PlanDetailResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanDetailResponseDtoImplFromJson(json);

  @override
  final int planId;
  @override
  final String? planType;
  // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Destination? destination;
  // 목표 기준만
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final int? memberCount;
  @override
  final String? memberType;
  @override
  final String? budgetRange;

  @override
  String toString() {
    return 'PlanDetailResponseDto(planId: $planId, planType: $planType, destination: $destination, startDate: $startDate, endDate: $endDate, memberCount: $memberCount, memberType: $memberType, budgetRange: $budgetRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanDetailResponseDtoImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.planType, planType) ||
                other.planType == planType) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.memberType, memberType) ||
                other.memberType == memberType) &&
            (identical(other.budgetRange, budgetRange) ||
                other.budgetRange == budgetRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planId,
    planType,
    destination,
    startDate,
    endDate,
    memberCount,
    memberType,
    budgetRange,
  );

  /// Create a copy of PlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanDetailResponseDtoImplCopyWith<_$PlanDetailResponseDtoImpl>
  get copyWith =>
      __$$PlanDetailResponseDtoImplCopyWithImpl<_$PlanDetailResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanDetailResponseDtoImplToJson(this);
  }
}

abstract class _PlanDetailResponseDto implements PlanDetailResponseDto {
  const factory _PlanDetailResponseDto({
    required final int planId,
    final String? planType,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    final Destination? destination,
    final String? startDate,
    final String? endDate,
    final int? memberCount,
    final String? memberType,
    final String? budgetRange,
  }) = _$PlanDetailResponseDtoImpl;

  factory _PlanDetailResponseDto.fromJson(Map<String, dynamic> json) =
      _$PlanDetailResponseDtoImpl.fromJson;

  @override
  int get planId;
  @override
  String? get planType; // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Destination? get destination; // 목표 기준만
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  int? get memberCount;
  @override
  String? get memberType;
  @override
  String? get budgetRange;

  /// Create a copy of PlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanDetailResponseDtoImplCopyWith<_$PlanDetailResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
