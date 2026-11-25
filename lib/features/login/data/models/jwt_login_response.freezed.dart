// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JwtLoginResponse _$JwtLoginResponseFromJson(Map<String, dynamic> json) {
  return _JwtLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$JwtLoginResponse {
  String get jwtAccessToken => throw _privateConstructorUsedError;
  String get jwtRefreshToken => throw _privateConstructorUsedError;
  bool get newUser =>
      throw _privateConstructorUsedError; // true면 첫 로그인 -> 온보딩으로
  int? get userId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  /// Serializes this JwtLoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JwtLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JwtLoginResponseCopyWith<JwtLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtLoginResponseCopyWith<$Res> {
  factory $JwtLoginResponseCopyWith(
    JwtLoginResponse value,
    $Res Function(JwtLoginResponse) then,
  ) = _$JwtLoginResponseCopyWithImpl<$Res, JwtLoginResponse>;
  @useResult
  $Res call({
    String jwtAccessToken,
    String jwtRefreshToken,
    bool newUser,
    int? userId,
    String? email,
    String? nickname,
    String? profileImageUrl,
  });
}

/// @nodoc
class _$JwtLoginResponseCopyWithImpl<$Res, $Val extends JwtLoginResponse>
    implements $JwtLoginResponseCopyWith<$Res> {
  _$JwtLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JwtLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwtAccessToken = null,
    Object? jwtRefreshToken = null,
    Object? newUser = null,
    Object? userId = freezed,
    Object? email = freezed,
    Object? nickname = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            jwtAccessToken: null == jwtAccessToken
                ? _value.jwtAccessToken
                : jwtAccessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            jwtRefreshToken: null == jwtRefreshToken
                ? _value.jwtRefreshToken
                : jwtRefreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            newUser: null == newUser
                ? _value.newUser
                : newUser // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$JwtLoginResponseImplCopyWith<$Res>
    implements $JwtLoginResponseCopyWith<$Res> {
  factory _$$JwtLoginResponseImplCopyWith(
    _$JwtLoginResponseImpl value,
    $Res Function(_$JwtLoginResponseImpl) then,
  ) = __$$JwtLoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String jwtAccessToken,
    String jwtRefreshToken,
    bool newUser,
    int? userId,
    String? email,
    String? nickname,
    String? profileImageUrl,
  });
}

/// @nodoc
class __$$JwtLoginResponseImplCopyWithImpl<$Res>
    extends _$JwtLoginResponseCopyWithImpl<$Res, _$JwtLoginResponseImpl>
    implements _$$JwtLoginResponseImplCopyWith<$Res> {
  __$$JwtLoginResponseImplCopyWithImpl(
    _$JwtLoginResponseImpl _value,
    $Res Function(_$JwtLoginResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JwtLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwtAccessToken = null,
    Object? jwtRefreshToken = null,
    Object? newUser = null,
    Object? userId = freezed,
    Object? email = freezed,
    Object? nickname = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(
      _$JwtLoginResponseImpl(
        jwtAccessToken: null == jwtAccessToken
            ? _value.jwtAccessToken
            : jwtAccessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        jwtRefreshToken: null == jwtRefreshToken
            ? _value.jwtRefreshToken
            : jwtRefreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        newUser: null == newUser
            ? _value.newUser
            : newUser // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$JwtLoginResponseImpl implements _JwtLoginResponse {
  const _$JwtLoginResponseImpl({
    required this.jwtAccessToken,
    required this.jwtRefreshToken,
    this.newUser = false,
    this.userId,
    this.email,
    this.nickname,
    this.profileImageUrl,
  });

  factory _$JwtLoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtLoginResponseImplFromJson(json);

  @override
  final String jwtAccessToken;
  @override
  final String jwtRefreshToken;
  @override
  @JsonKey()
  final bool newUser;
  // true면 첫 로그인 -> 온보딩으로
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
    return 'JwtLoginResponse(jwtAccessToken: $jwtAccessToken, jwtRefreshToken: $jwtRefreshToken, newUser: $newUser, userId: $userId, email: $email, nickname: $nickname, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JwtLoginResponseImpl &&
            (identical(other.jwtAccessToken, jwtAccessToken) ||
                other.jwtAccessToken == jwtAccessToken) &&
            (identical(other.jwtRefreshToken, jwtRefreshToken) ||
                other.jwtRefreshToken == jwtRefreshToken) &&
            (identical(other.newUser, newUser) || other.newUser == newUser) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jwtAccessToken,
    jwtRefreshToken,
    newUser,
    userId,
    email,
    nickname,
    profileImageUrl,
  );

  /// Create a copy of JwtLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtLoginResponseImplCopyWith<_$JwtLoginResponseImpl> get copyWith =>
      __$$JwtLoginResponseImplCopyWithImpl<_$JwtLoginResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtLoginResponseImplToJson(this);
  }
}

abstract class _JwtLoginResponse implements JwtLoginResponse {
  const factory _JwtLoginResponse({
    required final String jwtAccessToken,
    required final String jwtRefreshToken,
    final bool newUser,
    final int? userId,
    final String? email,
    final String? nickname,
    final String? profileImageUrl,
  }) = _$JwtLoginResponseImpl;

  factory _JwtLoginResponse.fromJson(Map<String, dynamic> json) =
      _$JwtLoginResponseImpl.fromJson;

  @override
  String get jwtAccessToken;
  @override
  String get jwtRefreshToken;
  @override
  bool get newUser; // true면 첫 로그인 -> 온보딩으로
  @override
  int? get userId;
  @override
  String? get email;
  @override
  String? get nickname;
  @override
  String? get profileImageUrl;

  /// Create a copy of JwtLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JwtLoginResponseImplCopyWith<_$JwtLoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
