// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlanListResponseDto _$PlanListResponseDtoFromJson(Map<String, dynamic> json) {
  return _PlanListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PlanListResponseDto {
  List<PlanSummaryDto> get ongoingPlans => throw _privateConstructorUsedError;
  List<PlanSummaryDto> get upcomingPlans => throw _privateConstructorUsedError;
  List<PlanSummaryDto> get pastPlans => throw _privateConstructorUsedError;

  /// Serializes this PlanListResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanListResponseDtoCopyWith<PlanListResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanListResponseDtoCopyWith<$Res> {
  factory $PlanListResponseDtoCopyWith(
    PlanListResponseDto value,
    $Res Function(PlanListResponseDto) then,
  ) = _$PlanListResponseDtoCopyWithImpl<$Res, PlanListResponseDto>;
  @useResult
  $Res call({
    List<PlanSummaryDto> ongoingPlans,
    List<PlanSummaryDto> upcomingPlans,
    List<PlanSummaryDto> pastPlans,
  });
}

/// @nodoc
class _$PlanListResponseDtoCopyWithImpl<$Res, $Val extends PlanListResponseDto>
    implements $PlanListResponseDtoCopyWith<$Res> {
  _$PlanListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ongoingPlans = null,
    Object? upcomingPlans = null,
    Object? pastPlans = null,
  }) {
    return _then(
      _value.copyWith(
            ongoingPlans: null == ongoingPlans
                ? _value.ongoingPlans
                : ongoingPlans // ignore: cast_nullable_to_non_nullable
                      as List<PlanSummaryDto>,
            upcomingPlans: null == upcomingPlans
                ? _value.upcomingPlans
                : upcomingPlans // ignore: cast_nullable_to_non_nullable
                      as List<PlanSummaryDto>,
            pastPlans: null == pastPlans
                ? _value.pastPlans
                : pastPlans // ignore: cast_nullable_to_non_nullable
                      as List<PlanSummaryDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanListResponseDtoImplCopyWith<$Res>
    implements $PlanListResponseDtoCopyWith<$Res> {
  factory _$$PlanListResponseDtoImplCopyWith(
    _$PlanListResponseDtoImpl value,
    $Res Function(_$PlanListResponseDtoImpl) then,
  ) = __$$PlanListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<PlanSummaryDto> ongoingPlans,
    List<PlanSummaryDto> upcomingPlans,
    List<PlanSummaryDto> pastPlans,
  });
}

/// @nodoc
class __$$PlanListResponseDtoImplCopyWithImpl<$Res>
    extends _$PlanListResponseDtoCopyWithImpl<$Res, _$PlanListResponseDtoImpl>
    implements _$$PlanListResponseDtoImplCopyWith<$Res> {
  __$$PlanListResponseDtoImplCopyWithImpl(
    _$PlanListResponseDtoImpl _value,
    $Res Function(_$PlanListResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ongoingPlans = null,
    Object? upcomingPlans = null,
    Object? pastPlans = null,
  }) {
    return _then(
      _$PlanListResponseDtoImpl(
        ongoingPlans: null == ongoingPlans
            ? _value._ongoingPlans
            : ongoingPlans // ignore: cast_nullable_to_non_nullable
                  as List<PlanSummaryDto>,
        upcomingPlans: null == upcomingPlans
            ? _value._upcomingPlans
            : upcomingPlans // ignore: cast_nullable_to_non_nullable
                  as List<PlanSummaryDto>,
        pastPlans: null == pastPlans
            ? _value._pastPlans
            : pastPlans // ignore: cast_nullable_to_non_nullable
                  as List<PlanSummaryDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanListResponseDtoImpl implements _PlanListResponseDto {
  const _$PlanListResponseDtoImpl({
    final List<PlanSummaryDto> ongoingPlans = const [],
    final List<PlanSummaryDto> upcomingPlans = const [],
    final List<PlanSummaryDto> pastPlans = const [],
  }) : _ongoingPlans = ongoingPlans,
       _upcomingPlans = upcomingPlans,
       _pastPlans = pastPlans;

  factory _$PlanListResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanListResponseDtoImplFromJson(json);

  final List<PlanSummaryDto> _ongoingPlans;
  @override
  @JsonKey()
  List<PlanSummaryDto> get ongoingPlans {
    if (_ongoingPlans is EqualUnmodifiableListView) return _ongoingPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ongoingPlans);
  }

  final List<PlanSummaryDto> _upcomingPlans;
  @override
  @JsonKey()
  List<PlanSummaryDto> get upcomingPlans {
    if (_upcomingPlans is EqualUnmodifiableListView) return _upcomingPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingPlans);
  }

  final List<PlanSummaryDto> _pastPlans;
  @override
  @JsonKey()
  List<PlanSummaryDto> get pastPlans {
    if (_pastPlans is EqualUnmodifiableListView) return _pastPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastPlans);
  }

  @override
  String toString() {
    return 'PlanListResponseDto(ongoingPlans: $ongoingPlans, upcomingPlans: $upcomingPlans, pastPlans: $pastPlans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanListResponseDtoImpl &&
            const DeepCollectionEquality().equals(
              other._ongoingPlans,
              _ongoingPlans,
            ) &&
            const DeepCollectionEquality().equals(
              other._upcomingPlans,
              _upcomingPlans,
            ) &&
            const DeepCollectionEquality().equals(
              other._pastPlans,
              _pastPlans,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_ongoingPlans),
    const DeepCollectionEquality().hash(_upcomingPlans),
    const DeepCollectionEquality().hash(_pastPlans),
  );

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanListResponseDtoImplCopyWith<_$PlanListResponseDtoImpl> get copyWith =>
      __$$PlanListResponseDtoImplCopyWithImpl<_$PlanListResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanListResponseDtoImplToJson(this);
  }
}

abstract class _PlanListResponseDto implements PlanListResponseDto {
  const factory _PlanListResponseDto({
    final List<PlanSummaryDto> ongoingPlans,
    final List<PlanSummaryDto> upcomingPlans,
    final List<PlanSummaryDto> pastPlans,
  }) = _$PlanListResponseDtoImpl;

  factory _PlanListResponseDto.fromJson(Map<String, dynamic> json) =
      _$PlanListResponseDtoImpl.fromJson;

  @override
  List<PlanSummaryDto> get ongoingPlans;
  @override
  List<PlanSummaryDto> get upcomingPlans;
  @override
  List<PlanSummaryDto> get pastPlans;

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanListResponseDtoImplCopyWith<_$PlanListResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanSummaryDto _$PlanSummaryDtoFromJson(Map<String, dynamic> json) {
  return _PlanSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$PlanSummaryDto {
  int get planId => throw _privateConstructorUsedError;
  int? get confirmedPlanId => throw _privateConstructorUsedError;
  int? get travelGuideId =>
      throw _privateConstructorUsedError; // 월별 여행 준비 가이드 조회용
  String? get title =>
      throw _privateConstructorUsedError; // 서버에 모르는 여행지가 새로 생겨도 앱이 죽지 않고 null로 처리
  Destination? get destination => throw _privateConstructorUsedError;
  String? get destinationImageUrl => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError; // "2026-12-01"
  String? get endDate => throw _privateConstructorUsedError;
  num? get lowTotalCost => throw _privateConstructorUsedError;
  num? get highTotalCost => throw _privateConstructorUsedError;
  int? get dDay => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;

  /// Serializes this PlanSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanSummaryDtoCopyWith<PlanSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanSummaryDtoCopyWith<$Res> {
  factory $PlanSummaryDtoCopyWith(
    PlanSummaryDto value,
    $Res Function(PlanSummaryDto) then,
  ) = _$PlanSummaryDtoCopyWithImpl<$Res, PlanSummaryDto>;
  @useResult
  $Res call({
    int planId,
    int? confirmedPlanId,
    int? travelGuideId,
    String? title,
    Destination? destination,
    String? destinationImageUrl,
    String? startDate,
    String? endDate,
    num? lowTotalCost,
    num? highTotalCost,
    int? dDay,
    List<String> hashtags,
  });
}

/// @nodoc
class _$PlanSummaryDtoCopyWithImpl<$Res, $Val extends PlanSummaryDto>
    implements $PlanSummaryDtoCopyWith<$Res> {
  _$PlanSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? confirmedPlanId = freezed,
    Object? travelGuideId = freezed,
    Object? title = freezed,
    Object? destination = freezed,
    Object? destinationImageUrl = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? lowTotalCost = freezed,
    Object? highTotalCost = freezed,
    Object? dDay = freezed,
    Object? hashtags = null,
  }) {
    return _then(
      _value.copyWith(
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as int,
            confirmedPlanId: freezed == confirmedPlanId
                ? _value.confirmedPlanId
                : confirmedPlanId // ignore: cast_nullable_to_non_nullable
                      as int?,
            travelGuideId: freezed == travelGuideId
                ? _value.travelGuideId
                : travelGuideId // ignore: cast_nullable_to_non_nullable
                      as int?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            destination: freezed == destination
                ? _value.destination
                : destination // ignore: cast_nullable_to_non_nullable
                      as Destination?,
            destinationImageUrl: freezed == destinationImageUrl
                ? _value.destinationImageUrl
                : destinationImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            lowTotalCost: freezed == lowTotalCost
                ? _value.lowTotalCost
                : lowTotalCost // ignore: cast_nullable_to_non_nullable
                      as num?,
            highTotalCost: freezed == highTotalCost
                ? _value.highTotalCost
                : highTotalCost // ignore: cast_nullable_to_non_nullable
                      as num?,
            dDay: freezed == dDay
                ? _value.dDay
                : dDay // ignore: cast_nullable_to_non_nullable
                      as int?,
            hashtags: null == hashtags
                ? _value.hashtags
                : hashtags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanSummaryDtoImplCopyWith<$Res>
    implements $PlanSummaryDtoCopyWith<$Res> {
  factory _$$PlanSummaryDtoImplCopyWith(
    _$PlanSummaryDtoImpl value,
    $Res Function(_$PlanSummaryDtoImpl) then,
  ) = __$$PlanSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int planId,
    int? confirmedPlanId,
    int? travelGuideId,
    String? title,
    Destination? destination,
    String? destinationImageUrl,
    String? startDate,
    String? endDate,
    num? lowTotalCost,
    num? highTotalCost,
    int? dDay,
    List<String> hashtags,
  });
}

/// @nodoc
class __$$PlanSummaryDtoImplCopyWithImpl<$Res>
    extends _$PlanSummaryDtoCopyWithImpl<$Res, _$PlanSummaryDtoImpl>
    implements _$$PlanSummaryDtoImplCopyWith<$Res> {
  __$$PlanSummaryDtoImplCopyWithImpl(
    _$PlanSummaryDtoImpl _value,
    $Res Function(_$PlanSummaryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? confirmedPlanId = freezed,
    Object? travelGuideId = freezed,
    Object? title = freezed,
    Object? destination = freezed,
    Object? destinationImageUrl = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? lowTotalCost = freezed,
    Object? highTotalCost = freezed,
    Object? dDay = freezed,
    Object? hashtags = null,
  }) {
    return _then(
      _$PlanSummaryDtoImpl(
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as int,
        confirmedPlanId: freezed == confirmedPlanId
            ? _value.confirmedPlanId
            : confirmedPlanId // ignore: cast_nullable_to_non_nullable
                  as int?,
        travelGuideId: freezed == travelGuideId
            ? _value.travelGuideId
            : travelGuideId // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        destination: freezed == destination
            ? _value.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as Destination?,
        destinationImageUrl: freezed == destinationImageUrl
            ? _value.destinationImageUrl
            : destinationImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        lowTotalCost: freezed == lowTotalCost
            ? _value.lowTotalCost
            : lowTotalCost // ignore: cast_nullable_to_non_nullable
                  as num?,
        highTotalCost: freezed == highTotalCost
            ? _value.highTotalCost
            : highTotalCost // ignore: cast_nullable_to_non_nullable
                  as num?,
        dDay: freezed == dDay
            ? _value.dDay
            : dDay // ignore: cast_nullable_to_non_nullable
                  as int?,
        hashtags: null == hashtags
            ? _value._hashtags
            : hashtags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanSummaryDtoImpl implements _PlanSummaryDto {
  const _$PlanSummaryDtoImpl({
    required this.planId,
    this.confirmedPlanId,
    this.travelGuideId,
    this.title,
    this.destination,
    this.destinationImageUrl,
    this.startDate,
    this.endDate,
    this.lowTotalCost,
    this.highTotalCost,
    this.dDay,
    final List<String> hashtags = const [],
  }) : _hashtags = hashtags;

  factory _$PlanSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanSummaryDtoImplFromJson(json);

  @override
  final int planId;
  @override
  final int? confirmedPlanId;
  @override
  final int? travelGuideId;
  // 월별 여행 준비 가이드 조회용
  @override
  final String? title;
  // 서버에 모르는 여행지가 새로 생겨도 앱이 죽지 않고 null로 처리
  @override
  final Destination? destination;
  @override
  final String? destinationImageUrl;
  @override
  final String? startDate;
  // "2026-12-01"
  @override
  final String? endDate;
  @override
  final num? lowTotalCost;
  @override
  final num? highTotalCost;
  @override
  final int? dDay;
  final List<String> _hashtags;
  @override
  @JsonKey()
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  String toString() {
    return 'PlanSummaryDto(planId: $planId, confirmedPlanId: $confirmedPlanId, travelGuideId: $travelGuideId, title: $title, destination: $destination, destinationImageUrl: $destinationImageUrl, startDate: $startDate, endDate: $endDate, lowTotalCost: $lowTotalCost, highTotalCost: $highTotalCost, dDay: $dDay, hashtags: $hashtags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanSummaryDtoImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.confirmedPlanId, confirmedPlanId) ||
                other.confirmedPlanId == confirmedPlanId) &&
            (identical(other.travelGuideId, travelGuideId) ||
                other.travelGuideId == travelGuideId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.destinationImageUrl, destinationImageUrl) ||
                other.destinationImageUrl == destinationImageUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.lowTotalCost, lowTotalCost) ||
                other.lowTotalCost == lowTotalCost) &&
            (identical(other.highTotalCost, highTotalCost) ||
                other.highTotalCost == highTotalCost) &&
            (identical(other.dDay, dDay) || other.dDay == dDay) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planId,
    confirmedPlanId,
    travelGuideId,
    title,
    destination,
    destinationImageUrl,
    startDate,
    endDate,
    lowTotalCost,
    highTotalCost,
    dDay,
    const DeepCollectionEquality().hash(_hashtags),
  );

  /// Create a copy of PlanSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanSummaryDtoImplCopyWith<_$PlanSummaryDtoImpl> get copyWith =>
      __$$PlanSummaryDtoImplCopyWithImpl<_$PlanSummaryDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanSummaryDtoImplToJson(this);
  }
}

abstract class _PlanSummaryDto implements PlanSummaryDto {
  const factory _PlanSummaryDto({
    required final int planId,
    final int? confirmedPlanId,
    final int? travelGuideId,
    final String? title,
    final Destination? destination,
    final String? destinationImageUrl,
    final String? startDate,
    final String? endDate,
    final num? lowTotalCost,
    final num? highTotalCost,
    final int? dDay,
    final List<String> hashtags,
  }) = _$PlanSummaryDtoImpl;

  factory _PlanSummaryDto.fromJson(Map<String, dynamic> json) =
      _$PlanSummaryDtoImpl.fromJson;

  @override
  int get planId;
  @override
  int? get confirmedPlanId;
  @override
  int? get travelGuideId; // 월별 여행 준비 가이드 조회용
  @override
  String? get title; // 서버에 모르는 여행지가 새로 생겨도 앱이 죽지 않고 null로 처리
  @override
  Destination? get destination;
  @override
  String? get destinationImageUrl;
  @override
  String? get startDate; // "2026-12-01"
  @override
  String? get endDate;
  @override
  num? get lowTotalCost;
  @override
  num? get highTotalCost;
  @override
  int? get dDay;
  @override
  List<String> get hashtags;

  /// Create a copy of PlanSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanSummaryDtoImplCopyWith<_$PlanSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
