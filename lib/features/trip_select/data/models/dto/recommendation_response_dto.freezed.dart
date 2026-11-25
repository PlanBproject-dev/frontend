// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecommendationResponseDto _$RecommendationResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _RecommendationResponseDto.fromJson(json);
}

/// @nodoc
mixin _$RecommendationResponseDto {
  // 모르는 상태값이 오면: 앱이 죽지 않고 null로 처리 (Repository에서 실패로 처리)
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  RecommendationStatus? get status => throw _privateConstructorUsedError;
  List<RecommendationItemDto> get recommendations =>
      throw _privateConstructorUsedError;

  /// Serializes this RecommendationResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendationResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationResponseDtoCopyWith<RecommendationResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationResponseDtoCopyWith<$Res> {
  factory $RecommendationResponseDtoCopyWith(
    RecommendationResponseDto value,
    $Res Function(RecommendationResponseDto) then,
  ) = _$RecommendationResponseDtoCopyWithImpl<$Res, RecommendationResponseDto>;
  @useResult
  $Res call({
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    RecommendationStatus? status,
    List<RecommendationItemDto> recommendations,
  });
}

/// @nodoc
class _$RecommendationResponseDtoCopyWithImpl<
  $Res,
  $Val extends RecommendationResponseDto
>
    implements $RecommendationResponseDtoCopyWith<$Res> {
  _$RecommendationResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendationResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed, Object? recommendations = null}) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as RecommendationStatus?,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<RecommendationItemDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecommendationResponseDtoImplCopyWith<$Res>
    implements $RecommendationResponseDtoCopyWith<$Res> {
  factory _$$RecommendationResponseDtoImplCopyWith(
    _$RecommendationResponseDtoImpl value,
    $Res Function(_$RecommendationResponseDtoImpl) then,
  ) = __$$RecommendationResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    RecommendationStatus? status,
    List<RecommendationItemDto> recommendations,
  });
}

/// @nodoc
class __$$RecommendationResponseDtoImplCopyWithImpl<$Res>
    extends
        _$RecommendationResponseDtoCopyWithImpl<
          $Res,
          _$RecommendationResponseDtoImpl
        >
    implements _$$RecommendationResponseDtoImplCopyWith<$Res> {
  __$$RecommendationResponseDtoImplCopyWithImpl(
    _$RecommendationResponseDtoImpl _value,
    $Res Function(_$RecommendationResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendationResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed, Object? recommendations = null}) {
    return _then(
      _$RecommendationResponseDtoImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecommendationStatus?,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<RecommendationItemDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationResponseDtoImpl implements _RecommendationResponseDto {
  const _$RecommendationResponseDtoImpl({
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status,
    final List<RecommendationItemDto> recommendations = const [],
  }) : _recommendations = recommendations;

  factory _$RecommendationResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationResponseDtoImplFromJson(json);

  // 모르는 상태값이 오면: 앱이 죽지 않고 null로 처리 (Repository에서 실패로 처리)
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final RecommendationStatus? status;
  final List<RecommendationItemDto> _recommendations;
  @override
  @JsonKey()
  List<RecommendationItemDto> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'RecommendationResponseDto(status: $status, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationResponseDtoImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_recommendations),
  );

  /// Create a copy of RecommendationResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationResponseDtoImplCopyWith<_$RecommendationResponseDtoImpl>
  get copyWith =>
      __$$RecommendationResponseDtoImplCopyWithImpl<
        _$RecommendationResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationResponseDtoImplToJson(this);
  }
}

abstract class _RecommendationResponseDto implements RecommendationResponseDto {
  const factory _RecommendationResponseDto({
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    final RecommendationStatus? status,
    final List<RecommendationItemDto> recommendations,
  }) = _$RecommendationResponseDtoImpl;

  factory _RecommendationResponseDto.fromJson(Map<String, dynamic> json) =
      _$RecommendationResponseDtoImpl.fromJson;

  // 모르는 상태값이 오면: 앱이 죽지 않고 null로 처리 (Repository에서 실패로 처리)
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  RecommendationStatus? get status;
  @override
  List<RecommendationItemDto> get recommendations;

  /// Create a copy of RecommendationResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationResponseDtoImplCopyWith<_$RecommendationResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RecommendationItemDto _$RecommendationItemDtoFromJson(
  Map<String, dynamic> json,
) {
  return _RecommendationItemDto.fromJson(json);
}

/// @nodoc
mixin _$RecommendationItemDto {
  int get recommendationId => throw _privateConstructorUsedError;
  String? get recommendationValue =>
      throw _privateConstructorUsedError; // RANK_1~6 / LEVEL_HIGH/MEDIUM/LOW
  // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Destination? get destination => throw _privateConstructorUsedError;
  num? get lowTotalCost => throw _privateConstructorUsedError;
  num? get highTotalCost => throw _privateConstructorUsedError;
  LodgingDto? get lodging => throw _privateConstructorUsedError;
  FlightDto? get flight => throw _privateConstructorUsedError;
  List<CourseDto> get courses => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;

  /// Serializes this RecommendationItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendationItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationItemDtoCopyWith<RecommendationItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationItemDtoCopyWith<$Res> {
  factory $RecommendationItemDtoCopyWith(
    RecommendationItemDto value,
    $Res Function(RecommendationItemDto) then,
  ) = _$RecommendationItemDtoCopyWithImpl<$Res, RecommendationItemDto>;
  @useResult
  $Res call({
    int recommendationId,
    String? recommendationValue,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    Destination? destination,
    num? lowTotalCost,
    num? highTotalCost,
    LodgingDto? lodging,
    FlightDto? flight,
    List<CourseDto> courses,
    List<String> hashtags,
    String? summary,
  });

  $LodgingDtoCopyWith<$Res>? get lodging;
  $FlightDtoCopyWith<$Res>? get flight;
}

/// @nodoc
class _$RecommendationItemDtoCopyWithImpl<
  $Res,
  $Val extends RecommendationItemDto
>
    implements $RecommendationItemDtoCopyWith<$Res> {
  _$RecommendationItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendationItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationId = null,
    Object? recommendationValue = freezed,
    Object? destination = freezed,
    Object? lowTotalCost = freezed,
    Object? highTotalCost = freezed,
    Object? lodging = freezed,
    Object? flight = freezed,
    Object? courses = null,
    Object? hashtags = null,
    Object? summary = freezed,
  }) {
    return _then(
      _value.copyWith(
            recommendationId: null == recommendationId
                ? _value.recommendationId
                : recommendationId // ignore: cast_nullable_to_non_nullable
                      as int,
            recommendationValue: freezed == recommendationValue
                ? _value.recommendationValue
                : recommendationValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            destination: freezed == destination
                ? _value.destination
                : destination // ignore: cast_nullable_to_non_nullable
                      as Destination?,
            lowTotalCost: freezed == lowTotalCost
                ? _value.lowTotalCost
                : lowTotalCost // ignore: cast_nullable_to_non_nullable
                      as num?,
            highTotalCost: freezed == highTotalCost
                ? _value.highTotalCost
                : highTotalCost // ignore: cast_nullable_to_non_nullable
                      as num?,
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
            hashtags: null == hashtags
                ? _value.hashtags
                : hashtags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of RecommendationItemDto
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

  /// Create a copy of RecommendationItemDto
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
abstract class _$$RecommendationItemDtoImplCopyWith<$Res>
    implements $RecommendationItemDtoCopyWith<$Res> {
  factory _$$RecommendationItemDtoImplCopyWith(
    _$RecommendationItemDtoImpl value,
    $Res Function(_$RecommendationItemDtoImpl) then,
  ) = __$$RecommendationItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int recommendationId,
    String? recommendationValue,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    Destination? destination,
    num? lowTotalCost,
    num? highTotalCost,
    LodgingDto? lodging,
    FlightDto? flight,
    List<CourseDto> courses,
    List<String> hashtags,
    String? summary,
  });

  @override
  $LodgingDtoCopyWith<$Res>? get lodging;
  @override
  $FlightDtoCopyWith<$Res>? get flight;
}

/// @nodoc
class __$$RecommendationItemDtoImplCopyWithImpl<$Res>
    extends
        _$RecommendationItemDtoCopyWithImpl<$Res, _$RecommendationItemDtoImpl>
    implements _$$RecommendationItemDtoImplCopyWith<$Res> {
  __$$RecommendationItemDtoImplCopyWithImpl(
    _$RecommendationItemDtoImpl _value,
    $Res Function(_$RecommendationItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendationItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationId = null,
    Object? recommendationValue = freezed,
    Object? destination = freezed,
    Object? lowTotalCost = freezed,
    Object? highTotalCost = freezed,
    Object? lodging = freezed,
    Object? flight = freezed,
    Object? courses = null,
    Object? hashtags = null,
    Object? summary = freezed,
  }) {
    return _then(
      _$RecommendationItemDtoImpl(
        recommendationId: null == recommendationId
            ? _value.recommendationId
            : recommendationId // ignore: cast_nullable_to_non_nullable
                  as int,
        recommendationValue: freezed == recommendationValue
            ? _value.recommendationValue
            : recommendationValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        destination: freezed == destination
            ? _value.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as Destination?,
        lowTotalCost: freezed == lowTotalCost
            ? _value.lowTotalCost
            : lowTotalCost // ignore: cast_nullable_to_non_nullable
                  as num?,
        highTotalCost: freezed == highTotalCost
            ? _value.highTotalCost
            : highTotalCost // ignore: cast_nullable_to_non_nullable
                  as num?,
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
        hashtags: null == hashtags
            ? _value._hashtags
            : hashtags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationItemDtoImpl implements _RecommendationItemDto {
  const _$RecommendationItemDtoImpl({
    required this.recommendationId,
    this.recommendationValue,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    this.destination,
    this.lowTotalCost,
    this.highTotalCost,
    this.lodging,
    this.flight,
    final List<CourseDto> courses = const [],
    final List<String> hashtags = const [],
    this.summary,
  }) : _courses = courses,
       _hashtags = hashtags;

  factory _$RecommendationItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationItemDtoImplFromJson(json);

  @override
  final int recommendationId;
  @override
  final String? recommendationValue;
  // RANK_1~6 / LEVEL_HIGH/MEDIUM/LOW
  // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Destination? destination;
  @override
  final num? lowTotalCost;
  @override
  final num? highTotalCost;
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

  final List<String> _hashtags;
  @override
  @JsonKey()
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  final String? summary;

  @override
  String toString() {
    return 'RecommendationItemDto(recommendationId: $recommendationId, recommendationValue: $recommendationValue, destination: $destination, lowTotalCost: $lowTotalCost, highTotalCost: $highTotalCost, lodging: $lodging, flight: $flight, courses: $courses, hashtags: $hashtags, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationItemDtoImpl &&
            (identical(other.recommendationId, recommendationId) ||
                other.recommendationId == recommendationId) &&
            (identical(other.recommendationValue, recommendationValue) ||
                other.recommendationValue == recommendationValue) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.lowTotalCost, lowTotalCost) ||
                other.lowTotalCost == lowTotalCost) &&
            (identical(other.highTotalCost, highTotalCost) ||
                other.highTotalCost == highTotalCost) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.flight, flight) || other.flight == flight) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    recommendationId,
    recommendationValue,
    destination,
    lowTotalCost,
    highTotalCost,
    lodging,
    flight,
    const DeepCollectionEquality().hash(_courses),
    const DeepCollectionEquality().hash(_hashtags),
    summary,
  );

  /// Create a copy of RecommendationItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationItemDtoImplCopyWith<_$RecommendationItemDtoImpl>
  get copyWith =>
      __$$RecommendationItemDtoImplCopyWithImpl<_$RecommendationItemDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationItemDtoImplToJson(this);
  }
}

abstract class _RecommendationItemDto implements RecommendationItemDto {
  const factory _RecommendationItemDto({
    required final int recommendationId,
    final String? recommendationValue,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    final Destination? destination,
    final num? lowTotalCost,
    final num? highTotalCost,
    final LodgingDto? lodging,
    final FlightDto? flight,
    final List<CourseDto> courses,
    final List<String> hashtags,
    final String? summary,
  }) = _$RecommendationItemDtoImpl;

  factory _RecommendationItemDto.fromJson(Map<String, dynamic> json) =
      _$RecommendationItemDtoImpl.fromJson;

  @override
  int get recommendationId;
  @override
  String? get recommendationValue; // RANK_1~6 / LEVEL_HIGH/MEDIUM/LOW
  // 모르는 여행지가 오면: 앱이 죽지 않고 null로 처리
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Destination? get destination;
  @override
  num? get lowTotalCost;
  @override
  num? get highTotalCost;
  @override
  LodgingDto? get lodging;
  @override
  FlightDto? get flight;
  @override
  List<CourseDto> get courses;
  @override
  List<String> get hashtags;
  @override
  String? get summary;

  /// Create a copy of RecommendationItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationItemDtoImplCopyWith<_$RecommendationItemDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LodgingDto _$LodgingDtoFromJson(Map<String, dynamic> json) {
  return _LodgingDto.fromJson(json);
}

/// @nodoc
mixin _$LodgingDto {
  String? get lodgingType =>
      throw _privateConstructorUsedError; // HOTEL, HOSTEL, RENTAL, GUESTHOUSE, RESORT, POOL_VILLA
  int? get nights => throw _privateConstructorUsedError;
  String? get roomType => throw _privateConstructorUsedError;
  num? get lowCost => throw _privateConstructorUsedError;
  num? get highCost => throw _privateConstructorUsedError;

  /// Serializes this LodgingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LodgingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LodgingDtoCopyWith<LodgingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LodgingDtoCopyWith<$Res> {
  factory $LodgingDtoCopyWith(
    LodgingDto value,
    $Res Function(LodgingDto) then,
  ) = _$LodgingDtoCopyWithImpl<$Res, LodgingDto>;
  @useResult
  $Res call({
    String? lodgingType,
    int? nights,
    String? roomType,
    num? lowCost,
    num? highCost,
  });
}

/// @nodoc
class _$LodgingDtoCopyWithImpl<$Res, $Val extends LodgingDto>
    implements $LodgingDtoCopyWith<$Res> {
  _$LodgingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LodgingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lodgingType = freezed,
    Object? nights = freezed,
    Object? roomType = freezed,
    Object? lowCost = freezed,
    Object? highCost = freezed,
  }) {
    return _then(
      _value.copyWith(
            lodgingType: freezed == lodgingType
                ? _value.lodgingType
                : lodgingType // ignore: cast_nullable_to_non_nullable
                      as String?,
            nights: freezed == nights
                ? _value.nights
                : nights // ignore: cast_nullable_to_non_nullable
                      as int?,
            roomType: freezed == roomType
                ? _value.roomType
                : roomType // ignore: cast_nullable_to_non_nullable
                      as String?,
            lowCost: freezed == lowCost
                ? _value.lowCost
                : lowCost // ignore: cast_nullable_to_non_nullable
                      as num?,
            highCost: freezed == highCost
                ? _value.highCost
                : highCost // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LodgingDtoImplCopyWith<$Res>
    implements $LodgingDtoCopyWith<$Res> {
  factory _$$LodgingDtoImplCopyWith(
    _$LodgingDtoImpl value,
    $Res Function(_$LodgingDtoImpl) then,
  ) = __$$LodgingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? lodgingType,
    int? nights,
    String? roomType,
    num? lowCost,
    num? highCost,
  });
}

/// @nodoc
class __$$LodgingDtoImplCopyWithImpl<$Res>
    extends _$LodgingDtoCopyWithImpl<$Res, _$LodgingDtoImpl>
    implements _$$LodgingDtoImplCopyWith<$Res> {
  __$$LodgingDtoImplCopyWithImpl(
    _$LodgingDtoImpl _value,
    $Res Function(_$LodgingDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LodgingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lodgingType = freezed,
    Object? nights = freezed,
    Object? roomType = freezed,
    Object? lowCost = freezed,
    Object? highCost = freezed,
  }) {
    return _then(
      _$LodgingDtoImpl(
        lodgingType: freezed == lodgingType
            ? _value.lodgingType
            : lodgingType // ignore: cast_nullable_to_non_nullable
                  as String?,
        nights: freezed == nights
            ? _value.nights
            : nights // ignore: cast_nullable_to_non_nullable
                  as int?,
        roomType: freezed == roomType
            ? _value.roomType
            : roomType // ignore: cast_nullable_to_non_nullable
                  as String?,
        lowCost: freezed == lowCost
            ? _value.lowCost
            : lowCost // ignore: cast_nullable_to_non_nullable
                  as num?,
        highCost: freezed == highCost
            ? _value.highCost
            : highCost // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LodgingDtoImpl implements _LodgingDto {
  const _$LodgingDtoImpl({
    this.lodgingType,
    this.nights,
    this.roomType,
    this.lowCost,
    this.highCost,
  });

  factory _$LodgingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LodgingDtoImplFromJson(json);

  @override
  final String? lodgingType;
  // HOTEL, HOSTEL, RENTAL, GUESTHOUSE, RESORT, POOL_VILLA
  @override
  final int? nights;
  @override
  final String? roomType;
  @override
  final num? lowCost;
  @override
  final num? highCost;

  @override
  String toString() {
    return 'LodgingDto(lodgingType: $lodgingType, nights: $nights, roomType: $roomType, lowCost: $lowCost, highCost: $highCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LodgingDtoImpl &&
            (identical(other.lodgingType, lodgingType) ||
                other.lodgingType == lodgingType) &&
            (identical(other.nights, nights) || other.nights == nights) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.lowCost, lowCost) || other.lowCost == lowCost) &&
            (identical(other.highCost, highCost) ||
                other.highCost == highCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lodgingType,
    nights,
    roomType,
    lowCost,
    highCost,
  );

  /// Create a copy of LodgingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LodgingDtoImplCopyWith<_$LodgingDtoImpl> get copyWith =>
      __$$LodgingDtoImplCopyWithImpl<_$LodgingDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LodgingDtoImplToJson(this);
  }
}

abstract class _LodgingDto implements LodgingDto {
  const factory _LodgingDto({
    final String? lodgingType,
    final int? nights,
    final String? roomType,
    final num? lowCost,
    final num? highCost,
  }) = _$LodgingDtoImpl;

  factory _LodgingDto.fromJson(Map<String, dynamic> json) =
      _$LodgingDtoImpl.fromJson;

  @override
  String? get lodgingType; // HOTEL, HOSTEL, RENTAL, GUESTHOUSE, RESORT, POOL_VILLA
  @override
  int? get nights;
  @override
  String? get roomType;
  @override
  num? get lowCost;
  @override
  num? get highCost;

  /// Create a copy of LodgingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LodgingDtoImplCopyWith<_$LodgingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightDto _$FlightDtoFromJson(Map<String, dynamic> json) {
  return _FlightDto.fromJson(json);
}

/// @nodoc
mixin _$FlightDto {
  String? get flightType =>
      throw _privateConstructorUsedError; // LOW_COST, MAJOR
  String? get flightRoute =>
      throw _privateConstructorUsedError; // DIRECT, TRANSFER
  bool? get isRoundFlight => throw _privateConstructorUsedError;
  num? get lowCost => throw _privateConstructorUsedError;
  num? get highCost => throw _privateConstructorUsedError;

  /// Serializes this FlightDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlightDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightDtoCopyWith<FlightDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightDtoCopyWith<$Res> {
  factory $FlightDtoCopyWith(FlightDto value, $Res Function(FlightDto) then) =
      _$FlightDtoCopyWithImpl<$Res, FlightDto>;
  @useResult
  $Res call({
    String? flightType,
    String? flightRoute,
    bool? isRoundFlight,
    num? lowCost,
    num? highCost,
  });
}

/// @nodoc
class _$FlightDtoCopyWithImpl<$Res, $Val extends FlightDto>
    implements $FlightDtoCopyWith<$Res> {
  _$FlightDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlightDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightType = freezed,
    Object? flightRoute = freezed,
    Object? isRoundFlight = freezed,
    Object? lowCost = freezed,
    Object? highCost = freezed,
  }) {
    return _then(
      _value.copyWith(
            flightType: freezed == flightType
                ? _value.flightType
                : flightType // ignore: cast_nullable_to_non_nullable
                      as String?,
            flightRoute: freezed == flightRoute
                ? _value.flightRoute
                : flightRoute // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRoundFlight: freezed == isRoundFlight
                ? _value.isRoundFlight
                : isRoundFlight // ignore: cast_nullable_to_non_nullable
                      as bool?,
            lowCost: freezed == lowCost
                ? _value.lowCost
                : lowCost // ignore: cast_nullable_to_non_nullable
                      as num?,
            highCost: freezed == highCost
                ? _value.highCost
                : highCost // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FlightDtoImplCopyWith<$Res>
    implements $FlightDtoCopyWith<$Res> {
  factory _$$FlightDtoImplCopyWith(
    _$FlightDtoImpl value,
    $Res Function(_$FlightDtoImpl) then,
  ) = __$$FlightDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? flightType,
    String? flightRoute,
    bool? isRoundFlight,
    num? lowCost,
    num? highCost,
  });
}

/// @nodoc
class __$$FlightDtoImplCopyWithImpl<$Res>
    extends _$FlightDtoCopyWithImpl<$Res, _$FlightDtoImpl>
    implements _$$FlightDtoImplCopyWith<$Res> {
  __$$FlightDtoImplCopyWithImpl(
    _$FlightDtoImpl _value,
    $Res Function(_$FlightDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlightDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightType = freezed,
    Object? flightRoute = freezed,
    Object? isRoundFlight = freezed,
    Object? lowCost = freezed,
    Object? highCost = freezed,
  }) {
    return _then(
      _$FlightDtoImpl(
        flightType: freezed == flightType
            ? _value.flightType
            : flightType // ignore: cast_nullable_to_non_nullable
                  as String?,
        flightRoute: freezed == flightRoute
            ? _value.flightRoute
            : flightRoute // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRoundFlight: freezed == isRoundFlight
            ? _value.isRoundFlight
            : isRoundFlight // ignore: cast_nullable_to_non_nullable
                  as bool?,
        lowCost: freezed == lowCost
            ? _value.lowCost
            : lowCost // ignore: cast_nullable_to_non_nullable
                  as num?,
        highCost: freezed == highCost
            ? _value.highCost
            : highCost // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightDtoImpl implements _FlightDto {
  const _$FlightDtoImpl({
    this.flightType,
    this.flightRoute,
    this.isRoundFlight,
    this.lowCost,
    this.highCost,
  });

  factory _$FlightDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightDtoImplFromJson(json);

  @override
  final String? flightType;
  // LOW_COST, MAJOR
  @override
  final String? flightRoute;
  // DIRECT, TRANSFER
  @override
  final bool? isRoundFlight;
  @override
  final num? lowCost;
  @override
  final num? highCost;

  @override
  String toString() {
    return 'FlightDto(flightType: $flightType, flightRoute: $flightRoute, isRoundFlight: $isRoundFlight, lowCost: $lowCost, highCost: $highCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightDtoImpl &&
            (identical(other.flightType, flightType) ||
                other.flightType == flightType) &&
            (identical(other.flightRoute, flightRoute) ||
                other.flightRoute == flightRoute) &&
            (identical(other.isRoundFlight, isRoundFlight) ||
                other.isRoundFlight == isRoundFlight) &&
            (identical(other.lowCost, lowCost) || other.lowCost == lowCost) &&
            (identical(other.highCost, highCost) ||
                other.highCost == highCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    flightType,
    flightRoute,
    isRoundFlight,
    lowCost,
    highCost,
  );

  /// Create a copy of FlightDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightDtoImplCopyWith<_$FlightDtoImpl> get copyWith =>
      __$$FlightDtoImplCopyWithImpl<_$FlightDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightDtoImplToJson(this);
  }
}

abstract class _FlightDto implements FlightDto {
  const factory _FlightDto({
    final String? flightType,
    final String? flightRoute,
    final bool? isRoundFlight,
    final num? lowCost,
    final num? highCost,
  }) = _$FlightDtoImpl;

  factory _FlightDto.fromJson(Map<String, dynamic> json) =
      _$FlightDtoImpl.fromJson;

  @override
  String? get flightType; // LOW_COST, MAJOR
  @override
  String? get flightRoute; // DIRECT, TRANSFER
  @override
  bool? get isRoundFlight;
  @override
  num? get lowCost;
  @override
  num? get highCost;

  /// Create a copy of FlightDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightDtoImplCopyWith<_$FlightDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) {
  return _CourseDto.fromJson(json);
}

/// @nodoc
mixin _$CourseDto {
  String? get content => throw _privateConstructorUsedError;
  num? get cost => throw _privateConstructorUsedError;

  /// Serializes this CourseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDtoCopyWith<CourseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDtoCopyWith<$Res> {
  factory $CourseDtoCopyWith(CourseDto value, $Res Function(CourseDto) then) =
      _$CourseDtoCopyWithImpl<$Res, CourseDto>;
  @useResult
  $Res call({String? content, num? cost});
}

/// @nodoc
class _$CourseDtoCopyWithImpl<$Res, $Val extends CourseDto>
    implements $CourseDtoCopyWith<$Res> {
  _$CourseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = freezed, Object? cost = freezed}) {
    return _then(
      _value.copyWith(
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            cost: freezed == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseDtoImplCopyWith<$Res>
    implements $CourseDtoCopyWith<$Res> {
  factory _$$CourseDtoImplCopyWith(
    _$CourseDtoImpl value,
    $Res Function(_$CourseDtoImpl) then,
  ) = __$$CourseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? content, num? cost});
}

/// @nodoc
class __$$CourseDtoImplCopyWithImpl<$Res>
    extends _$CourseDtoCopyWithImpl<$Res, _$CourseDtoImpl>
    implements _$$CourseDtoImplCopyWith<$Res> {
  __$$CourseDtoImplCopyWithImpl(
    _$CourseDtoImpl _value,
    $Res Function(_$CourseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = freezed, Object? cost = freezed}) {
    return _then(
      _$CourseDtoImpl(
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        cost: freezed == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDtoImpl implements _CourseDto {
  const _$CourseDtoImpl({this.content, this.cost});

  factory _$CourseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDtoImplFromJson(json);

  @override
  final String? content;
  @override
  final num? cost;

  @override
  String toString() {
    return 'CourseDto(content: $content, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDtoImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, cost);

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDtoImplCopyWith<_$CourseDtoImpl> get copyWith =>
      __$$CourseDtoImplCopyWithImpl<_$CourseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDtoImplToJson(this);
  }
}

abstract class _CourseDto implements CourseDto {
  const factory _CourseDto({final String? content, final num? cost}) =
      _$CourseDtoImpl;

  factory _CourseDto.fromJson(Map<String, dynamic> json) =
      _$CourseDtoImpl.fromJson;

  @override
  String? get content;
  @override
  num? get cost;

  /// Create a copy of CourseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDtoImplCopyWith<_$CourseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
