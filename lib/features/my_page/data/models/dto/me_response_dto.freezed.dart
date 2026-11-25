// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'me_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MeResponseDto _$MeResponseDtoFromJson(Map<String, dynamic> json) {
  return _MeResponseDto.fromJson(json);
}

/// @nodoc
mixin _$MeResponseDto {
  int? get userId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  /// Serializes this MeResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeResponseDtoCopyWith<MeResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeResponseDtoCopyWith<$Res> {
  factory $MeResponseDtoCopyWith(
    MeResponseDto value,
    $Res Function(MeResponseDto) then,
  ) = _$MeResponseDtoCopyWithImpl<$Res, MeResponseDto>;
  @useResult
  $Res call({
    int? userId,
    String? email,
    String? nickname,
    String? profileImageUrl,
  });
}

/// @nodoc
class _$MeResponseDtoCopyWithImpl<$Res, $Val extends MeResponseDto>
    implements $MeResponseDtoCopyWith<$Res> {
  _$MeResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? email = freezed,
    Object? nickname = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            profileImageUrl: freezed == profileImageUrl
                ? _value.profileImageUrl
                : profileImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MeResponseDtoImplCopyWith<$Res>
    implements $MeResponseDtoCopyWith<$Res> {
  factory _$$MeResponseDtoImplCopyWith(
    _$MeResponseDtoImpl value,
    $Res Function(_$MeResponseDtoImpl) then,
  ) = __$$MeResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? userId,
    String? email,
    String? nickname,
    String? profileImageUrl,
  });
}

/// @nodoc
class __$$MeResponseDtoImplCopyWithImpl<$Res>
    extends _$MeResponseDtoCopyWithImpl<$Res, _$MeResponseDtoImpl>
    implements _$$MeResponseDtoImplCopyWith<$Res> {
  __$$MeResponseDtoImplCopyWithImpl(
    _$MeResponseDtoImpl _value,
    $Res Function(_$MeResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? email = freezed,
    Object? nickname = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(
      _$MeResponseDtoImpl(
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileImageUrl: freezed == profileImageUrl
            ? _value.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MeResponseDtoImpl implements _MeResponseDto {
  const _$MeResponseDtoImpl({
    this.userId,
    this.email,
    this.nickname,
    this.profileImageUrl,
  });

  factory _$MeResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeResponseDtoImplFromJson(json);

  @override
  final int? userId;
  @override
  final String? email;
  @override
  final String? nickname;
  @override
  final String? profileImageUrl;

  @override
  String toString() {
    return 'MeResponseDto(userId: $userId, email: $email, nickname: $nickname, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeResponseDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, email, nickname, profileImageUrl);

  /// Create a copy of MeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeResponseDtoImplCopyWith<_$MeResponseDtoImpl> get copyWith =>
      __$$MeResponseDtoImplCopyWithImpl<_$MeResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeResponseDtoImplToJson(this);
  }
}

abstract class _MeResponseDto implements MeResponseDto {
  const factory _MeResponseDto({
    final int? userId,
    final String? email,
    final String? nickname,
    final String? profileImageUrl,
  }) = _$MeResponseDtoImpl;

  factory _MeResponseDto.fromJson(Map<String, dynamic> json) =
      _$MeResponseDtoImpl.fromJson;

  @override
  int? get userId;
  @override
  String? get email;
  @override
  String? get nickname;
  @override
  String? get profileImageUrl;

  /// Create a copy of MeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeResponseDtoImplCopyWith<_$MeResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
