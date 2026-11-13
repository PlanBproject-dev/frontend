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
  TripSelectionType? get tripType => throw _privateConstructorUsedError;

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
  $Res call({TripSelectionType? tripType});
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
  $Res call({Object? tripType = freezed}) {
    return _then(
      _value.copyWith(
            tripType: freezed == tripType
                ? _value.tripType
                : tripType // ignore: cast_nullable_to_non_nullable
                      as TripSelectionType?,
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
  $Res call({TripSelectionType? tripType});
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
  $Res call({Object? tripType = freezed}) {
    return _then(
      _$TripCheckDraftImpl(
        tripType: freezed == tripType
            ? _value.tripType
            : tripType // ignore: cast_nullable_to_non_nullable
                  as TripSelectionType?,
      ),
    );
  }
}

/// @nodoc

class _$TripCheckDraftImpl implements _TripCheckDraft {
  const _$TripCheckDraftImpl({this.tripType});

  @override
  final TripSelectionType? tripType;

  @override
  String toString() {
    return 'TripCheckDraft(tripType: $tripType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripCheckDraftImpl &&
            (identical(other.tripType, tripType) ||
                other.tripType == tripType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tripType);

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
  const factory _TripCheckDraft({final TripSelectionType? tripType}) =
      _$TripCheckDraftImpl;

  @override
  TripSelectionType? get tripType;

  /// Create a copy of TripCheckDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripCheckDraftImplCopyWith<_$TripCheckDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
