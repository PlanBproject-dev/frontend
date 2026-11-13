// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_check_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TripCheckDraft {
  TripSelectionType? get tripType =>
      throw _privateConstructorUsedError; // Step 1 여행 계획 기준 (null이면 미선택)
  // 기본 정보
  String? get destination =>
      throw _privateConstructorUsedError; // 여행지 (목표 기준 플로우만 사용)
  DateTimeRange<DateTime>? get travelPeriod =>
      throw _privateConstructorUsedError; // 여행 가능 시기 (시작일만 고르면 시작일 = 종료일)
  int? get peopleCount =>
      throw _privateConstructorUsedError; // 여행 인원 (비어 있으면 null)
  CompanionType? get companionType =>
      throw _privateConstructorUsedError; // 여행 구성원 유형
  // 지갑 기준 플로우
  BudgetRange? get maxBudget => throw _privateConstructorUsedError; // 1인당 최대 예산
  // 목표 기준 플로우
  MealBudget? get mealBudget =>
      throw _privateConstructorUsedError; // 1인당 한 끼 식사 예산
  // 세부 취향
  Set<TravelStyle> get travelStyles => throw _privateConstructorUsedError;
  Set<AccommodationType> get accommodationTypes =>
      throw _privateConstructorUsedError;
  Map<FlightPreference, SegmentedChipSide> get flightPreferences =>
      throw _privateConstructorUsedError;

  /// Create a copy of TripCheckDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripCheckDraftCopyWith<TripCheckDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCheckDraftCopyWith<$Res> {
  factory $TripCheckDraftCopyWith(
    TripCheckDraft value,
    $Res Function(TripCheckDraft) then,
  ) = _$TripCheckDraftCopyWithImpl<$Res, TripCheckDraft>;
  @useResult
  $Res call({
    TripSelectionType? tripType,
    String? destination,
    DateTimeRange<DateTime>? travelPeriod,
    int? peopleCount,
    CompanionType? companionType,
    BudgetRange? maxBudget,
    MealBudget? mealBudget,
    Set<TravelStyle> travelStyles,
    Set<AccommodationType> accommodationTypes,
    Map<FlightPreference, SegmentedChipSide> flightPreferences,
  });
}

/// @nodoc
class _$TripCheckDraftCopyWithImpl<$Res, $Val extends TripCheckDraft>
    implements $TripCheckDraftCopyWith<$Res> {
  _$TripCheckDraftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripCheckDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripType = freezed,
    Object? destination = freezed,
    Object? travelPeriod = freezed,
    Object? peopleCount = freezed,
    Object? companionType = freezed,
    Object? maxBudget = freezed,
    Object? mealBudget = freezed,
    Object? travelStyles = null,
    Object? accommodationTypes = null,
    Object? flightPreferences = null,
  }) {
    return _then(
      _value.copyWith(
            tripType: freezed == tripType
                ? _value.tripType
                : tripType // ignore: cast_nullable_to_non_nullable
                      as TripSelectionType?,
            destination: freezed == destination
                ? _value.destination
                : destination // ignore: cast_nullable_to_non_nullable
                      as String?,
            travelPeriod: freezed == travelPeriod
                ? _value.travelPeriod
                : travelPeriod // ignore: cast_nullable_to_non_nullable
                      as DateTimeRange<DateTime>?,
            peopleCount: freezed == peopleCount
                ? _value.peopleCount
                : peopleCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            companionType: freezed == companionType
                ? _value.companionType
                : companionType // ignore: cast_nullable_to_non_nullable
                      as CompanionType?,
            maxBudget: freezed == maxBudget
                ? _value.maxBudget
                : maxBudget // ignore: cast_nullable_to_non_nullable
                      as BudgetRange?,
            mealBudget: freezed == mealBudget
                ? _value.mealBudget
                : mealBudget // ignore: cast_nullable_to_non_nullable
                      as MealBudget?,
            travelStyles: null == travelStyles
                ? _value.travelStyles
                : travelStyles // ignore: cast_nullable_to_non_nullable
                      as Set<TravelStyle>,
            accommodationTypes: null == accommodationTypes
                ? _value.accommodationTypes
                : accommodationTypes // ignore: cast_nullable_to_non_nullable
                      as Set<AccommodationType>,
            flightPreferences: null == flightPreferences
                ? _value.flightPreferences
                : flightPreferences // ignore: cast_nullable_to_non_nullable
                      as Map<FlightPreference, SegmentedChipSide>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TripCheckDraftImplCopyWith<$Res>
    implements $TripCheckDraftCopyWith<$Res> {
  factory _$$TripCheckDraftImplCopyWith(
    _$TripCheckDraftImpl value,
    $Res Function(_$TripCheckDraftImpl) then,
  ) = __$$TripCheckDraftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TripSelectionType? tripType,
    String? destination,
    DateTimeRange<DateTime>? travelPeriod,
    int? peopleCount,
    CompanionType? companionType,
    BudgetRange? maxBudget,
    MealBudget? mealBudget,
    Set<TravelStyle> travelStyles,
    Set<AccommodationType> accommodationTypes,
    Map<FlightPreference, SegmentedChipSide> flightPreferences,
  });
}

/// @nodoc
class __$$TripCheckDraftImplCopyWithImpl<$Res>
    extends _$TripCheckDraftCopyWithImpl<$Res, _$TripCheckDraftImpl>
    implements _$$TripCheckDraftImplCopyWith<$Res> {
  __$$TripCheckDraftImplCopyWithImpl(
    _$TripCheckDraftImpl _value,
    $Res Function(_$TripCheckDraftImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TripCheckDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripType = freezed,
    Object? destination = freezed,
    Object? travelPeriod = freezed,
    Object? peopleCount = freezed,
    Object? companionType = freezed,
    Object? maxBudget = freezed,
    Object? mealBudget = freezed,
    Object? travelStyles = null,
    Object? accommodationTypes = null,
    Object? flightPreferences = null,
  }) {
    return _then(
      _$TripCheckDraftImpl(
        tripType: freezed == tripType
            ? _value.tripType
            : tripType // ignore: cast_nullable_to_non_nullable
                  as TripSelectionType?,
        destination: freezed == destination
            ? _value.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as String?,
        travelPeriod: freezed == travelPeriod
            ? _value.travelPeriod
            : travelPeriod // ignore: cast_nullable_to_non_nullable
                  as DateTimeRange<DateTime>?,
        peopleCount: freezed == peopleCount
            ? _value.peopleCount
            : peopleCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        companionType: freezed == companionType
            ? _value.companionType
            : companionType // ignore: cast_nullable_to_non_nullable
                  as CompanionType?,
        maxBudget: freezed == maxBudget
            ? _value.maxBudget
            : maxBudget // ignore: cast_nullable_to_non_nullable
                  as BudgetRange?,
        mealBudget: freezed == mealBudget
            ? _value.mealBudget
            : mealBudget // ignore: cast_nullable_to_non_nullable
                  as MealBudget?,
        travelStyles: null == travelStyles
            ? _value._travelStyles
            : travelStyles // ignore: cast_nullable_to_non_nullable
                  as Set<TravelStyle>,
        accommodationTypes: null == accommodationTypes
            ? _value._accommodationTypes
            : accommodationTypes // ignore: cast_nullable_to_non_nullable
                  as Set<AccommodationType>,
        flightPreferences: null == flightPreferences
            ? _value._flightPreferences
            : flightPreferences // ignore: cast_nullable_to_non_nullable
                  as Map<FlightPreference, SegmentedChipSide>,
      ),
    );
  }
}

/// @nodoc

class _$TripCheckDraftImpl implements _TripCheckDraft {
  const _$TripCheckDraftImpl({
    this.tripType,
    this.destination,
    this.travelPeriod,
    this.peopleCount,
    this.companionType,
    this.maxBudget,
    this.mealBudget,
    final Set<TravelStyle> travelStyles = const <TravelStyle>{},
    final Set<AccommodationType> accommodationTypes =
        const <AccommodationType>{},
    final Map<FlightPreference, SegmentedChipSide> flightPreferences =
        const <FlightPreference, SegmentedChipSide>{},
  }) : _travelStyles = travelStyles,
       _accommodationTypes = accommodationTypes,
       _flightPreferences = flightPreferences;

  @override
  final TripSelectionType? tripType;
  // Step 1 여행 계획 기준 (null이면 미선택)
  // 기본 정보
  @override
  final String? destination;
  // 여행지 (목표 기준 플로우만 사용)
  @override
  final DateTimeRange<DateTime>? travelPeriod;
  // 여행 가능 시기 (시작일만 고르면 시작일 = 종료일)
  @override
  final int? peopleCount;
  // 여행 인원 (비어 있으면 null)
  @override
  final CompanionType? companionType;
  // 여행 구성원 유형
  // 지갑 기준 플로우
  @override
  final BudgetRange? maxBudget;
  // 1인당 최대 예산
  // 목표 기준 플로우
  @override
  final MealBudget? mealBudget;
  // 1인당 한 끼 식사 예산
  // 세부 취향
  final Set<TravelStyle> _travelStyles;
  // 1인당 한 끼 식사 예산
  // 세부 취향
  @override
  @JsonKey()
  Set<TravelStyle> get travelStyles {
    if (_travelStyles is EqualUnmodifiableSetView) return _travelStyles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_travelStyles);
  }

  final Set<AccommodationType> _accommodationTypes;
  @override
  @JsonKey()
  Set<AccommodationType> get accommodationTypes {
    if (_accommodationTypes is EqualUnmodifiableSetView)
      return _accommodationTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_accommodationTypes);
  }

  final Map<FlightPreference, SegmentedChipSide> _flightPreferences;
  @override
  @JsonKey()
  Map<FlightPreference, SegmentedChipSide> get flightPreferences {
    if (_flightPreferences is EqualUnmodifiableMapView)
      return _flightPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_flightPreferences);
  }

  @override
  String toString() {
    return 'TripCheckDraft(tripType: $tripType, destination: $destination, travelPeriod: $travelPeriod, peopleCount: $peopleCount, companionType: $companionType, maxBudget: $maxBudget, mealBudget: $mealBudget, travelStyles: $travelStyles, accommodationTypes: $accommodationTypes, flightPreferences: $flightPreferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripCheckDraftImpl &&
            (identical(other.tripType, tripType) ||
                other.tripType == tripType) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.travelPeriod, travelPeriod) ||
                other.travelPeriod == travelPeriod) &&
            (identical(other.peopleCount, peopleCount) ||
                other.peopleCount == peopleCount) &&
            (identical(other.companionType, companionType) ||
                other.companionType == companionType) &&
            (identical(other.maxBudget, maxBudget) ||
                other.maxBudget == maxBudget) &&
            (identical(other.mealBudget, mealBudget) ||
                other.mealBudget == mealBudget) &&
            const DeepCollectionEquality().equals(
              other._travelStyles,
              _travelStyles,
            ) &&
            const DeepCollectionEquality().equals(
              other._accommodationTypes,
              _accommodationTypes,
            ) &&
            const DeepCollectionEquality().equals(
              other._flightPreferences,
              _flightPreferences,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tripType,
    destination,
    travelPeriod,
    peopleCount,
    companionType,
    maxBudget,
    mealBudget,
    const DeepCollectionEquality().hash(_travelStyles),
    const DeepCollectionEquality().hash(_accommodationTypes),
    const DeepCollectionEquality().hash(_flightPreferences),
  );

  /// Create a copy of TripCheckDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripCheckDraftImplCopyWith<_$TripCheckDraftImpl> get copyWith =>
      __$$TripCheckDraftImplCopyWithImpl<_$TripCheckDraftImpl>(
        this,
        _$identity,
      );
}

abstract class _TripCheckDraft implements TripCheckDraft {
  const factory _TripCheckDraft({
    final TripSelectionType? tripType,
    final String? destination,
    final DateTimeRange<DateTime>? travelPeriod,
    final int? peopleCount,
    final CompanionType? companionType,
    final BudgetRange? maxBudget,
    final MealBudget? mealBudget,
    final Set<TravelStyle> travelStyles,
    final Set<AccommodationType> accommodationTypes,
    final Map<FlightPreference, SegmentedChipSide> flightPreferences,
  }) = _$TripCheckDraftImpl;

  @override
  TripSelectionType? get tripType; // Step 1 여행 계획 기준 (null이면 미선택)
  // 기본 정보
  @override
  String? get destination; // 여행지 (목표 기준 플로우만 사용)
  @override
  DateTimeRange<DateTime>? get travelPeriod; // 여행 가능 시기 (시작일만 고르면 시작일 = 종료일)
  @override
  int? get peopleCount; // 여행 인원 (비어 있으면 null)
  @override
  CompanionType? get companionType; // 여행 구성원 유형
  // 지갑 기준 플로우
  @override
  BudgetRange? get maxBudget; // 1인당 최대 예산
  // 목표 기준 플로우
  @override
  MealBudget? get mealBudget; // 1인당 한 끼 식사 예산
  // 세부 취향
  @override
  Set<TravelStyle> get travelStyles;
  @override
  Set<AccommodationType> get accommodationTypes;
  @override
  Map<FlightPreference, SegmentedChipSide> get flightPreferences;

  /// Create a copy of TripCheckDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripCheckDraftImplCopyWith<_$TripCheckDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
