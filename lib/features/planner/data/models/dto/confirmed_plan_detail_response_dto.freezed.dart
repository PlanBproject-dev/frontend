// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirmed_plan_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConfirmedPlanDetailResponseDto _$ConfirmedPlanDetailResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _ConfirmedPlanDetailResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ConfirmedPlanDetailResponseDto {
  int get confirmPlanId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  int? get memberCount => throw _privateConstructorUsedError;
  String? get memberType => throw _privateConstructorUsedError;
  String? get budgetRange => throw _privateConstructorUsedError; // 지갑 기준만 사용
  String? get foodBudgetRange =>
      throw _privateConstructorUsedError; // 목표 기준만 사용
  LodgingDto? get lodging => throw _privateConstructorUsedError;
  FlightDto? get flight => throw _privateConstructorUsedError;
  List<CourseDto> get courses => throw _privateConstructorUsedError;
  num? get lowTotalCost => throw _privateConstructorUsedError;
  num? get highTotalCost => throw _privateConstructorUsedError;

  /// Serializes this ConfirmedPlanDetailResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfirmedPlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmedPlanDetailResponseDtoCopyWith<ConfirmedPlanDetailResponseDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmedPlanDetailResponseDtoCopyWith<$Res> {
  factory $ConfirmedPlanDetailResponseDtoCopyWith(
    ConfirmedPlanDetailResponseDto value,
    $Res Function(ConfirmedPlanDetailResponseDto) then,
  ) =
      _$ConfirmedPlanDetailResponseDtoCopyWithImpl<
        $Res,
        ConfirmedPlanDetailResponseDto
      >;
  @useResult
  $Res call({
    int confirmPlanId,
    String? title,
    String? startDate,
    String? endDate,
    int? memberCount,
    String? memberType,
    String? budgetRange,
    String? foodBudgetRange,
    LodgingDto? lodging,
    FlightDto? flight,
    List<CourseDto> courses,
    num? lowTotalCost,
    num? highTotalCost,
  });

  $LodgingDtoCopyWith<$Res>? get lodging;
  $FlightDtoCopyWith<$Res>? get flight;
}

/// @nodoc
class _$ConfirmedPlanDetailResponseDtoCopyWithImpl<
  $Res,
  $Val extends ConfirmedPlanDetailResponseDto
>
    implements $ConfirmedPlanDetailResponseDtoCopyWith<$Res> {
  _$ConfirmedPlanDetailResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmedPlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmPlanId = null,
    Object? title = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? memberCount = freezed,
    Object? memberType = freezed,
    Object? budgetRange = freezed,
    Object? foodBudgetRange = freezed,
    Object? lodging = freezed,
    Object? flight = freezed,
    Object? courses = null,
    Object? lowTotalCost = freezed,
    Object? highTotalCost = freezed,
  }) {
    return _then(
      _value.copyWith(
            confirmPlanId: null == confirmPlanId
                ? _value.confirmPlanId
                : confirmPlanId // ignore: cast_nullable_to_non_nullable
                      as int,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            foodBudgetRange: freezed == foodBudgetRange
                ? _value.foodBudgetRange
                : foodBudgetRange // ignore: cast_nullable_to_non_nullable
                      as String?,
            lodging: freezed == lodging
                ? _value.lodging
                : lodging // ignore: cast_nullable_to_non_nullable
                      as LodgingDto?,
            flight: freezed == flight
                ? _value.flight
                : flight // ignore: cast_nullable_to_non_nullable
                      as FlightDto?,
            courses: null == courses
                ? _value.courses
                : courses // ignore: cast_nullable_to_non_nullable
                      as List<CourseDto>,
            lowTotalCost: freezed == lowTotalCost
                ? _value.lowTotalCost
                : lowTotalCost // ignore: cast_nullable_to_non_nullable
                      as num?,
            highTotalCost: freezed == highTotalCost
                ? _value.highTotalCost
                : highTotalCost // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }

  /// Create a copy of ConfirmedPlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LodgingDtoCopyWith<$Res>? get lodging {
    if (_value.lodging == null) {
      return null;
    }

    return $LodgingDtoCopyWith<$Res>(_value.lodging!, (value) {
      return _then(_value.copyWith(lodging: value) as $Val);
    });
  }

  /// Create a copy of ConfirmedPlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlightDtoCopyWith<$Res>? get flight {
    if (_value.flight == null) {
      return null;
    }

    return $FlightDtoCopyWith<$Res>(_value.flight!, (value) {
      return _then(_value.copyWith(flight: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfirmedPlanDetailResponseDtoImplCopyWith<$Res>
    implements $ConfirmedPlanDetailResponseDtoCopyWith<$Res> {
  factory _$$ConfirmedPlanDetailResponseDtoImplCopyWith(
    _$ConfirmedPlanDetailResponseDtoImpl value,
    $Res Function(_$ConfirmedPlanDetailResponseDtoImpl) then,
  ) = __$$ConfirmedPlanDetailResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int confirmPlanId,
    String? title,
    String? startDate,
    String? endDate,
    int? memberCount,
    String? memberType,
    String? budgetRange,
    String? foodBudgetRange,
    LodgingDto? lodging,
    FlightDto? flight,
    List<CourseDto> courses,
    num? lowTotalCost,
    num? highTotalCost,
  });

  @override
  $LodgingDtoCopyWith<$Res>? get lodging;
  @override
  $FlightDtoCopyWith<$Res>? get flight;
}

/// @nodoc
class __$$ConfirmedPlanDetailResponseDtoImplCopyWithImpl<$Res>
    extends
        _$ConfirmedPlanDetailResponseDtoCopyWithImpl<
          $Res,
          _$ConfirmedPlanDetailResponseDtoImpl
        >
    implements _$$ConfirmedPlanDetailResponseDtoImplCopyWith<$Res> {
  __$$ConfirmedPlanDetailResponseDtoImplCopyWithImpl(
    _$ConfirmedPlanDetailResponseDtoImpl _value,
    $Res Function(_$ConfirmedPlanDetailResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConfirmedPlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmPlanId = null,
    Object? title = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? memberCount = freezed,
    Object? memberType = freezed,
    Object? budgetRange = freezed,
    Object? foodBudgetRange = freezed,
    Object? lodging = freezed,
    Object? flight = freezed,
    Object? courses = null,
    Object? lowTotalCost = freezed,
    Object? highTotalCost = freezed,
  }) {
    return _then(
      _$ConfirmedPlanDetailResponseDtoImpl(
        confirmPlanId: null == confirmPlanId
            ? _value.confirmPlanId
            : confirmPlanId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        foodBudgetRange: freezed == foodBudgetRange
            ? _value.foodBudgetRange
            : foodBudgetRange // ignore: cast_nullable_to_non_nullable
                  as String?,
        lodging: freezed == lodging
            ? _value.lodging
            : lodging // ignore: cast_nullable_to_non_nullable
                  as LodgingDto?,
        flight: freezed == flight
            ? _value.flight
            : flight // ignore: cast_nullable_to_non_nullable
                  as FlightDto?,
        courses: null == courses
            ? _value._courses
            : courses // ignore: cast_nullable_to_non_nullable
                  as List<CourseDto>,
        lowTotalCost: freezed == lowTotalCost
            ? _value.lowTotalCost
            : lowTotalCost // ignore: cast_nullable_to_non_nullable
                  as num?,
        highTotalCost: freezed == highTotalCost
            ? _value.highTotalCost
            : highTotalCost // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmedPlanDetailResponseDtoImpl
    implements _ConfirmedPlanDetailResponseDto {
  const _$ConfirmedPlanDetailResponseDtoImpl({
    required this.confirmPlanId,
    this.title,
    this.startDate,
    this.endDate,
    this.memberCount,
    this.memberType,
    this.budgetRange,
    this.foodBudgetRange,
    this.lodging,
    this.flight,
    final List<CourseDto> courses = const [],
    this.lowTotalCost,
    this.highTotalCost,
  }) : _courses = courses;

  factory _$ConfirmedPlanDetailResponseDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ConfirmedPlanDetailResponseDtoImplFromJson(json);

  @override
  final int confirmPlanId;
  @override
  final String? title;
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
  // 지갑 기준만 사용
  @override
  final String? foodBudgetRange;
  // 목표 기준만 사용
  @override
  final LodgingDto? lodging;
  @override
  final FlightDto? flight;
  final List<CourseDto> _courses;
  @override
  @JsonKey()
  List<CourseDto> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  final num? lowTotalCost;
  @override
  final num? highTotalCost;

  @override
  String toString() {
    return 'ConfirmedPlanDetailResponseDto(confirmPlanId: $confirmPlanId, title: $title, startDate: $startDate, endDate: $endDate, memberCount: $memberCount, memberType: $memberType, budgetRange: $budgetRange, foodBudgetRange: $foodBudgetRange, lodging: $lodging, flight: $flight, courses: $courses, lowTotalCost: $lowTotalCost, highTotalCost: $highTotalCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmedPlanDetailResponseDtoImpl &&
            (identical(other.confirmPlanId, confirmPlanId) ||
                other.confirmPlanId == confirmPlanId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.memberType, memberType) ||
                other.memberType == memberType) &&
            (identical(other.budgetRange, budgetRange) ||
                other.budgetRange == budgetRange) &&
            (identical(other.foodBudgetRange, foodBudgetRange) ||
                other.foodBudgetRange == foodBudgetRange) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.flight, flight) || other.flight == flight) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            (identical(other.lowTotalCost, lowTotalCost) ||
                other.lowTotalCost == lowTotalCost) &&
            (identical(other.highTotalCost, highTotalCost) ||
                other.highTotalCost == highTotalCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    confirmPlanId,
    title,
    startDate,
    endDate,
    memberCount,
    memberType,
    budgetRange,
    foodBudgetRange,
    lodging,
    flight,
    const DeepCollectionEquality().hash(_courses),
    lowTotalCost,
    highTotalCost,
  );

  /// Create a copy of ConfirmedPlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmedPlanDetailResponseDtoImplCopyWith<
    _$ConfirmedPlanDetailResponseDtoImpl
  >
  get copyWith =>
      __$$ConfirmedPlanDetailResponseDtoImplCopyWithImpl<
        _$ConfirmedPlanDetailResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmedPlanDetailResponseDtoImplToJson(this);
  }
}

abstract class _ConfirmedPlanDetailResponseDto
    implements ConfirmedPlanDetailResponseDto {
  const factory _ConfirmedPlanDetailResponseDto({
    required final int confirmPlanId,
    final String? title,
    final String? startDate,
    final String? endDate,
    final int? memberCount,
    final String? memberType,
    final String? budgetRange,
    final String? foodBudgetRange,
    final LodgingDto? lodging,
    final FlightDto? flight,
    final List<CourseDto> courses,
    final num? lowTotalCost,
    final num? highTotalCost,
  }) = _$ConfirmedPlanDetailResponseDtoImpl;

  factory _ConfirmedPlanDetailResponseDto.fromJson(Map<String, dynamic> json) =
      _$ConfirmedPlanDetailResponseDtoImpl.fromJson;

  @override
  int get confirmPlanId;
  @override
  String? get title;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  int? get memberCount;
  @override
  String? get memberType;
  @override
  String? get budgetRange; // 지갑 기준만 사용
  @override
  String? get foodBudgetRange; // 목표 기준만 사용
  @override
  LodgingDto? get lodging;
  @override
  FlightDto? get flight;
  @override
  List<CourseDto> get courses;
  @override
  num? get lowTotalCost;
  @override
  num? get highTotalCost;

  /// Create a copy of ConfirmedPlanDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmedPlanDetailResponseDtoImplCopyWith<
    _$ConfirmedPlanDetailResponseDtoImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
