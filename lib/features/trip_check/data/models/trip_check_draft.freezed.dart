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
  DateTimeRange<DateTime>? get travelPeriod =>
      throw _privateConstructorUsedError; // 여행 가능 시기 (시작일만 고르면 시작일 = 종료일)
  int? get peopleCount =>
      throw _privateConstructorUsedError; // 여행 인원 (비어 있으면 null)
  CompanionType? get companionType => throw _privateConstructorUsedError;

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
    DateTimeRange<DateTime>? travelPeriod,
    int? peopleCount,
    CompanionType? companionType,
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
    Object? travelPeriod = freezed,
    Object? peopleCount = freezed,
    Object? companionType = freezed,
  }) {
    return _then(
      _value.copyWith(
            tripType: freezed == tripType
                ? _value.tripType
                : tripType // ignore: cast_nullable_to_non_nullable
                      as TripSelectionType?,
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
    DateTimeRange<DateTime>? travelPeriod,
    int? peopleCount,
    CompanionType? companionType,
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
    Object? travelPeriod = freezed,
    Object? peopleCount = freezed,
    Object? companionType = freezed,
  }) {
    return _then(
      _$TripCheckDraftImpl(
        tripType: freezed == tripType
            ? _value.tripType
            : tripType // ignore: cast_nullable_to_non_nullable
                  as TripSelectionType?,
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
      ),
    );
  }
}

/// @nodoc

class _$TripCheckDraftImpl implements _TripCheckDraft {
  const _$TripCheckDraftImpl({
    this.tripType,
    this.travelPeriod,
    this.peopleCount,
    this.companionType,
  });

  @override
  final TripSelectionType? tripType;
  // Step 1 여행 계획 기준 (null이면 미선택)
  // 기본 정보
  @override
  final DateTimeRange<DateTime>? travelPeriod;
  // 여행 가능 시기 (시작일만 고르면 시작일 = 종료일)
  @override
  final int? peopleCount;
  // 여행 인원 (비어 있으면 null)
  @override
  final CompanionType? companionType;

  @override
  String toString() {
    return 'TripCheckDraft(tripType: $tripType, travelPeriod: $travelPeriod, peopleCount: $peopleCount, companionType: $companionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripCheckDraftImpl &&
            (identical(other.tripType, tripType) ||
                other.tripType == tripType) &&
            (identical(other.travelPeriod, travelPeriod) ||
                other.travelPeriod == travelPeriod) &&
            (identical(other.peopleCount, peopleCount) ||
                other.peopleCount == peopleCount) &&
            (identical(other.companionType, companionType) ||
                other.companionType == companionType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tripType,
    travelPeriod,
    peopleCount,
    companionType,
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
    final DateTimeRange<DateTime>? travelPeriod,
    final int? peopleCount,
    final CompanionType? companionType,
  }) = _$TripCheckDraftImpl;

  @override
  TripSelectionType? get tripType; // Step 1 여행 계획 기준 (null이면 미선택)
  // 기본 정보
  @override
  DateTimeRange<DateTime>? get travelPeriod; // 여행 가능 시기 (시작일만 고르면 시작일 = 종료일)
  @override
  int? get peopleCount; // 여행 인원 (비어 있으면 null)
  @override
  CompanionType? get companionType;

  /// Create a copy of TripCheckDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripCheckDraftImplCopyWith<_$TripCheckDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
