// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_extract_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LinkExtractResponseDto _$LinkExtractResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _LinkExtractResponseDto.fromJson(json);
}

/// @nodoc
mixin _$LinkExtractResponseDto {
  String? get extractId =>
      throw _privateConstructorUsedError; // 이번 추출 결과 id (코스 추가 요청 때 같이 보냄)
  List<ExtractCandidateDto> get candidates =>
      throw _privateConstructorUsedError;

  /// Serializes this LinkExtractResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkExtractResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkExtractResponseDtoCopyWith<LinkExtractResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkExtractResponseDtoCopyWith<$Res> {
  factory $LinkExtractResponseDtoCopyWith(
    LinkExtractResponseDto value,
    $Res Function(LinkExtractResponseDto) then,
  ) = _$LinkExtractResponseDtoCopyWithImpl<$Res, LinkExtractResponseDto>;
  @useResult
  $Res call({String? extractId, List<ExtractCandidateDto> candidates});
}

/// @nodoc
class _$LinkExtractResponseDtoCopyWithImpl<
  $Res,
  $Val extends LinkExtractResponseDto
>
    implements $LinkExtractResponseDtoCopyWith<$Res> {
  _$LinkExtractResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkExtractResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? extractId = freezed, Object? candidates = null}) {
    return _then(
      _value.copyWith(
            extractId: freezed == extractId
                ? _value.extractId
                : extractId // ignore: cast_nullable_to_non_nullable
                      as String?,
            candidates: null == candidates
                ? _value.candidates
                : candidates // ignore: cast_nullable_to_non_nullable
                      as List<ExtractCandidateDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LinkExtractResponseDtoImplCopyWith<$Res>
    implements $LinkExtractResponseDtoCopyWith<$Res> {
  factory _$$LinkExtractResponseDtoImplCopyWith(
    _$LinkExtractResponseDtoImpl value,
    $Res Function(_$LinkExtractResponseDtoImpl) then,
  ) = __$$LinkExtractResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? extractId, List<ExtractCandidateDto> candidates});
}

/// @nodoc
class __$$LinkExtractResponseDtoImplCopyWithImpl<$Res>
    extends
        _$LinkExtractResponseDtoCopyWithImpl<$Res, _$LinkExtractResponseDtoImpl>
    implements _$$LinkExtractResponseDtoImplCopyWith<$Res> {
  __$$LinkExtractResponseDtoImplCopyWithImpl(
    _$LinkExtractResponseDtoImpl _value,
    $Res Function(_$LinkExtractResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LinkExtractResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? extractId = freezed, Object? candidates = null}) {
    return _then(
      _$LinkExtractResponseDtoImpl(
        extractId: freezed == extractId
            ? _value.extractId
            : extractId // ignore: cast_nullable_to_non_nullable
                  as String?,
        candidates: null == candidates
            ? _value._candidates
            : candidates // ignore: cast_nullable_to_non_nullable
                  as List<ExtractCandidateDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkExtractResponseDtoImpl implements _LinkExtractResponseDto {
  const _$LinkExtractResponseDtoImpl({
    this.extractId,
    final List<ExtractCandidateDto> candidates = const [],
  }) : _candidates = candidates;

  factory _$LinkExtractResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkExtractResponseDtoImplFromJson(json);

  @override
  final String? extractId;
  // 이번 추출 결과 id (코스 추가 요청 때 같이 보냄)
  final List<ExtractCandidateDto> _candidates;
  // 이번 추출 결과 id (코스 추가 요청 때 같이 보냄)
  @override
  @JsonKey()
  List<ExtractCandidateDto> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  @override
  String toString() {
    return 'LinkExtractResponseDto(extractId: $extractId, candidates: $candidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkExtractResponseDtoImpl &&
            (identical(other.extractId, extractId) ||
                other.extractId == extractId) &&
            const DeepCollectionEquality().equals(
              other._candidates,
              _candidates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    extractId,
    const DeepCollectionEquality().hash(_candidates),
  );

  /// Create a copy of LinkExtractResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkExtractResponseDtoImplCopyWith<_$LinkExtractResponseDtoImpl>
  get copyWith =>
      __$$LinkExtractResponseDtoImplCopyWithImpl<_$LinkExtractResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkExtractResponseDtoImplToJson(this);
  }
}

abstract class _LinkExtractResponseDto implements LinkExtractResponseDto {
  const factory _LinkExtractResponseDto({
    final String? extractId,
    final List<ExtractCandidateDto> candidates,
  }) = _$LinkExtractResponseDtoImpl;

  factory _LinkExtractResponseDto.fromJson(Map<String, dynamic> json) =
      _$LinkExtractResponseDtoImpl.fromJson;

  @override
  String? get extractId; // 이번 추출 결과 id (코스 추가 요청 때 같이 보냄)
  @override
  List<ExtractCandidateDto> get candidates;

  /// Create a copy of LinkExtractResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkExtractResponseDtoImplCopyWith<_$LinkExtractResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ExtractCandidateDto _$ExtractCandidateDtoFromJson(Map<String, dynamic> json) {
  return _ExtractCandidateDto.fromJson(json);
}

/// @nodoc
mixin _$ExtractCandidateDto {
  int get index =>
      throw _privateConstructorUsedError; // 추출 결과 안에서의 후보 번호 (코스 추가 요청 때 보냄)
  String? get url => throw _privateConstructorUsedError; // 후보를 찾은 원본 링크
  String? get tag =>
      throw _privateConstructorUsedError; // TOUR | LODGING | FOOD | ACTIVITY | LANDMARK | ETC
  String? get courseName => throw _privateConstructorUsedError;
  List<String> get details => throw _privateConstructorUsedError;
  num? get estimatedCost => throw _privateConstructorUsedError;

  /// Serializes this ExtractCandidateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtractCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtractCandidateDtoCopyWith<ExtractCandidateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtractCandidateDtoCopyWith<$Res> {
  factory $ExtractCandidateDtoCopyWith(
    ExtractCandidateDto value,
    $Res Function(ExtractCandidateDto) then,
  ) = _$ExtractCandidateDtoCopyWithImpl<$Res, ExtractCandidateDto>;
  @useResult
  $Res call({
    int index,
    String? url,
    String? tag,
    String? courseName,
    List<String> details,
    num? estimatedCost,
  });
}

/// @nodoc
class _$ExtractCandidateDtoCopyWithImpl<$Res, $Val extends ExtractCandidateDto>
    implements $ExtractCandidateDtoCopyWith<$Res> {
  _$ExtractCandidateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtractCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? url = freezed,
    Object? tag = freezed,
    Object? courseName = freezed,
    Object? details = null,
    Object? estimatedCost = freezed,
  }) {
    return _then(
      _value.copyWith(
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            tag: freezed == tag
                ? _value.tag
                : tag // ignore: cast_nullable_to_non_nullable
                      as String?,
            courseName: freezed == courseName
                ? _value.courseName
                : courseName // ignore: cast_nullable_to_non_nullable
                      as String?,
            details: null == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            estimatedCost: freezed == estimatedCost
                ? _value.estimatedCost
                : estimatedCost // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtractCandidateDtoImplCopyWith<$Res>
    implements $ExtractCandidateDtoCopyWith<$Res> {
  factory _$$ExtractCandidateDtoImplCopyWith(
    _$ExtractCandidateDtoImpl value,
    $Res Function(_$ExtractCandidateDtoImpl) then,
  ) = __$$ExtractCandidateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int index,
    String? url,
    String? tag,
    String? courseName,
    List<String> details,
    num? estimatedCost,
  });
}

/// @nodoc
class __$$ExtractCandidateDtoImplCopyWithImpl<$Res>
    extends _$ExtractCandidateDtoCopyWithImpl<$Res, _$ExtractCandidateDtoImpl>
    implements _$$ExtractCandidateDtoImplCopyWith<$Res> {
  __$$ExtractCandidateDtoImplCopyWithImpl(
    _$ExtractCandidateDtoImpl _value,
    $Res Function(_$ExtractCandidateDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtractCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? url = freezed,
    Object? tag = freezed,
    Object? courseName = freezed,
    Object? details = null,
    Object? estimatedCost = freezed,
  }) {
    return _then(
      _$ExtractCandidateDtoImpl(
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        tag: freezed == tag
            ? _value.tag
            : tag // ignore: cast_nullable_to_non_nullable
                  as String?,
        courseName: freezed == courseName
            ? _value.courseName
            : courseName // ignore: cast_nullable_to_non_nullable
                  as String?,
        details: null == details
            ? _value._details
            : details // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        estimatedCost: freezed == estimatedCost
            ? _value.estimatedCost
            : estimatedCost // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtractCandidateDtoImpl implements _ExtractCandidateDto {
  const _$ExtractCandidateDtoImpl({
    required this.index,
    this.url,
    this.tag,
    this.courseName,
    final List<String> details = const [],
    this.estimatedCost,
  }) : _details = details;

  factory _$ExtractCandidateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtractCandidateDtoImplFromJson(json);

  @override
  final int index;
  // 추출 결과 안에서의 후보 번호 (코스 추가 요청 때 보냄)
  @override
  final String? url;
  // 후보를 찾은 원본 링크
  @override
  final String? tag;
  // TOUR | LODGING | FOOD | ACTIVITY | LANDMARK | ETC
  @override
  final String? courseName;
  final List<String> _details;
  @override
  @JsonKey()
  List<String> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final num? estimatedCost;

  @override
  String toString() {
    return 'ExtractCandidateDto(index: $index, url: $url, tag: $tag, courseName: $courseName, details: $details, estimatedCost: $estimatedCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtractCandidateDtoImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.estimatedCost, estimatedCost) ||
                other.estimatedCost == estimatedCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    index,
    url,
    tag,
    courseName,
    const DeepCollectionEquality().hash(_details),
    estimatedCost,
  );

  /// Create a copy of ExtractCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtractCandidateDtoImplCopyWith<_$ExtractCandidateDtoImpl> get copyWith =>
      __$$ExtractCandidateDtoImplCopyWithImpl<_$ExtractCandidateDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtractCandidateDtoImplToJson(this);
  }
}

abstract class _ExtractCandidateDto implements ExtractCandidateDto {
  const factory _ExtractCandidateDto({
    required final int index,
    final String? url,
    final String? tag,
    final String? courseName,
    final List<String> details,
    final num? estimatedCost,
  }) = _$ExtractCandidateDtoImpl;

  factory _ExtractCandidateDto.fromJson(Map<String, dynamic> json) =
      _$ExtractCandidateDtoImpl.fromJson;

  @override
  int get index; // 추출 결과 안에서의 후보 번호 (코스 추가 요청 때 보냄)
  @override
  String? get url; // 후보를 찾은 원본 링크
  @override
  String? get tag; // TOUR | LODGING | FOOD | ACTIVITY | LANDMARK | ETC
  @override
  String? get courseName;
  @override
  List<String> get details;
  @override
  num? get estimatedCost;

  /// Create a copy of ExtractCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtractCandidateDtoImplCopyWith<_$ExtractCandidateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
