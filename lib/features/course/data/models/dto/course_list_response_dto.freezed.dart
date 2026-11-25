// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CourseListResponseDto _$CourseListResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _CourseListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CourseListResponseDto {
  List<CourseItemDto> get courses => throw _privateConstructorUsedError;

  /// Serializes this CourseListResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseListResponseDtoCopyWith<CourseListResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseListResponseDtoCopyWith<$Res> {
  factory $CourseListResponseDtoCopyWith(
    CourseListResponseDto value,
    $Res Function(CourseListResponseDto) then,
  ) = _$CourseListResponseDtoCopyWithImpl<$Res, CourseListResponseDto>;
  @useResult
  $Res call({List<CourseItemDto> courses});
}

/// @nodoc
class _$CourseListResponseDtoCopyWithImpl<
  $Res,
  $Val extends CourseListResponseDto
>
    implements $CourseListResponseDtoCopyWith<$Res> {
  _$CourseListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? courses = null}) {
    return _then(
      _value.copyWith(
            courses: null == courses
                ? _value.courses
                : courses // ignore: cast_nullable_to_non_nullable
                      as List<CourseItemDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseListResponseDtoImplCopyWith<$Res>
    implements $CourseListResponseDtoCopyWith<$Res> {
  factory _$$CourseListResponseDtoImplCopyWith(
    _$CourseListResponseDtoImpl value,
    $Res Function(_$CourseListResponseDtoImpl) then,
  ) = __$$CourseListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CourseItemDto> courses});
}

/// @nodoc
class __$$CourseListResponseDtoImplCopyWithImpl<$Res>
    extends
        _$CourseListResponseDtoCopyWithImpl<$Res, _$CourseListResponseDtoImpl>
    implements _$$CourseListResponseDtoImplCopyWith<$Res> {
  __$$CourseListResponseDtoImplCopyWithImpl(
    _$CourseListResponseDtoImpl _value,
    $Res Function(_$CourseListResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? courses = null}) {
    return _then(
      _$CourseListResponseDtoImpl(
        courses: null == courses
            ? _value._courses
            : courses // ignore: cast_nullable_to_non_nullable
                  as List<CourseItemDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseListResponseDtoImpl implements _CourseListResponseDto {
  const _$CourseListResponseDtoImpl({
    final List<CourseItemDto> courses = const [],
  }) : _courses = courses;

  factory _$CourseListResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseListResponseDtoImplFromJson(json);

  final List<CourseItemDto> _courses;
  @override
  @JsonKey()
  List<CourseItemDto> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  String toString() {
    return 'CourseListResponseDto(courses: $courses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseListResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseListResponseDtoImplCopyWith<_$CourseListResponseDtoImpl>
  get copyWith =>
      __$$CourseListResponseDtoImplCopyWithImpl<_$CourseListResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseListResponseDtoImplToJson(this);
  }
}

abstract class _CourseListResponseDto implements CourseListResponseDto {
  const factory _CourseListResponseDto({final List<CourseItemDto> courses}) =
      _$CourseListResponseDtoImpl;

  factory _CourseListResponseDto.fromJson(Map<String, dynamic> json) =
      _$CourseListResponseDtoImpl.fromJson;

  @override
  List<CourseItemDto> get courses;

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseListResponseDtoImplCopyWith<_$CourseListResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CourseItemDto _$CourseItemDtoFromJson(Map<String, dynamic> json) {
  return _CourseItemDto.fromJson(json);
}

/// @nodoc
mixin _$CourseItemDto {
  int get courseId => throw _privateConstructorUsedError;
  num? get cost => throw _privateConstructorUsedError;
  String? get courseType =>
      throw _privateConstructorUsedError; // BASIC: 플랜 생성 시 만든 코스 / LINK: 웹 링크로 새로 생긴 코스
  List<CoursePlaceDto> get places => throw _privateConstructorUsedError;

  /// Serializes this CourseItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseItemDtoCopyWith<CourseItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseItemDtoCopyWith<$Res> {
  factory $CourseItemDtoCopyWith(
    CourseItemDto value,
    $Res Function(CourseItemDto) then,
  ) = _$CourseItemDtoCopyWithImpl<$Res, CourseItemDto>;
  @useResult
  $Res call({
    int courseId,
    num? cost,
    String? courseType,
    List<CoursePlaceDto> places,
  });
}

/// @nodoc
class _$CourseItemDtoCopyWithImpl<$Res, $Val extends CourseItemDto>
    implements $CourseItemDtoCopyWith<$Res> {
  _$CourseItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? cost = freezed,
    Object? courseType = freezed,
    Object? places = null,
  }) {
    return _then(
      _value.copyWith(
            courseId: null == courseId
                ? _value.courseId
                : courseId // ignore: cast_nullable_to_non_nullable
                      as int,
            cost: freezed == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as num?,
            courseType: freezed == courseType
                ? _value.courseType
                : courseType // ignore: cast_nullable_to_non_nullable
                      as String?,
            places: null == places
                ? _value.places
                : places // ignore: cast_nullable_to_non_nullable
                      as List<CoursePlaceDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseItemDtoImplCopyWith<$Res>
    implements $CourseItemDtoCopyWith<$Res> {
  factory _$$CourseItemDtoImplCopyWith(
    _$CourseItemDtoImpl value,
    $Res Function(_$CourseItemDtoImpl) then,
  ) = __$$CourseItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int courseId,
    num? cost,
    String? courseType,
    List<CoursePlaceDto> places,
  });
}

/// @nodoc
class __$$CourseItemDtoImplCopyWithImpl<$Res>
    extends _$CourseItemDtoCopyWithImpl<$Res, _$CourseItemDtoImpl>
    implements _$$CourseItemDtoImplCopyWith<$Res> {
  __$$CourseItemDtoImplCopyWithImpl(
    _$CourseItemDtoImpl _value,
    $Res Function(_$CourseItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? cost = freezed,
    Object? courseType = freezed,
    Object? places = null,
  }) {
    return _then(
      _$CourseItemDtoImpl(
        courseId: null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                  as int,
        cost: freezed == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as num?,
        courseType: freezed == courseType
            ? _value.courseType
            : courseType // ignore: cast_nullable_to_non_nullable
                  as String?,
        places: null == places
            ? _value._places
            : places // ignore: cast_nullable_to_non_nullable
                  as List<CoursePlaceDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseItemDtoImpl implements _CourseItemDto {
  const _$CourseItemDtoImpl({
    required this.courseId,
    this.cost,
    this.courseType,
    final List<CoursePlaceDto> places = const [],
  }) : _places = places;

  factory _$CourseItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseItemDtoImplFromJson(json);

  @override
  final int courseId;
  @override
  final num? cost;
  @override
  final String? courseType;
  // BASIC: 플랜 생성 시 만든 코스 / LINK: 웹 링크로 새로 생긴 코스
  final List<CoursePlaceDto> _places;
  // BASIC: 플랜 생성 시 만든 코스 / LINK: 웹 링크로 새로 생긴 코스
  @override
  @JsonKey()
  List<CoursePlaceDto> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'CourseItemDto(courseId: $courseId, cost: $cost, courseType: $courseType, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseItemDtoImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.courseType, courseType) ||
                other.courseType == courseType) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    courseId,
    cost,
    courseType,
    const DeepCollectionEquality().hash(_places),
  );

  /// Create a copy of CourseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseItemDtoImplCopyWith<_$CourseItemDtoImpl> get copyWith =>
      __$$CourseItemDtoImplCopyWithImpl<_$CourseItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseItemDtoImplToJson(this);
  }
}

abstract class _CourseItemDto implements CourseItemDto {
  const factory _CourseItemDto({
    required final int courseId,
    final num? cost,
    final String? courseType,
    final List<CoursePlaceDto> places,
  }) = _$CourseItemDtoImpl;

  factory _CourseItemDto.fromJson(Map<String, dynamic> json) =
      _$CourseItemDtoImpl.fromJson;

  @override
  int get courseId;
  @override
  num? get cost;
  @override
  String? get courseType; // BASIC: 플랜 생성 시 만든 코스 / LINK: 웹 링크로 새로 생긴 코스
  @override
  List<CoursePlaceDto> get places;

  /// Create a copy of CourseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseItemDtoImplCopyWith<_$CourseItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoursePlaceDto _$CoursePlaceDtoFromJson(Map<String, dynamic> json) {
  return _CoursePlaceDto.fromJson(json);
}

/// @nodoc
mixin _$CoursePlaceDto {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get fromLink => throw _privateConstructorUsedError;

  /// Serializes this CoursePlaceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoursePlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoursePlaceDtoCopyWith<CoursePlaceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursePlaceDtoCopyWith<$Res> {
  factory $CoursePlaceDtoCopyWith(
    CoursePlaceDto value,
    $Res Function(CoursePlaceDto) then,
  ) = _$CoursePlaceDtoCopyWithImpl<$Res, CoursePlaceDto>;
  @useResult
  $Res call({String? name, String? description, bool fromLink});
}

/// @nodoc
class _$CoursePlaceDtoCopyWithImpl<$Res, $Val extends CoursePlaceDto>
    implements $CoursePlaceDtoCopyWith<$Res> {
  _$CoursePlaceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoursePlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? fromLink = null,
  }) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            fromLink: null == fromLink
                ? _value.fromLink
                : fromLink // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoursePlaceDtoImplCopyWith<$Res>
    implements $CoursePlaceDtoCopyWith<$Res> {
  factory _$$CoursePlaceDtoImplCopyWith(
    _$CoursePlaceDtoImpl value,
    $Res Function(_$CoursePlaceDtoImpl) then,
  ) = __$$CoursePlaceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? description, bool fromLink});
}

/// @nodoc
class __$$CoursePlaceDtoImplCopyWithImpl<$Res>
    extends _$CoursePlaceDtoCopyWithImpl<$Res, _$CoursePlaceDtoImpl>
    implements _$$CoursePlaceDtoImplCopyWith<$Res> {
  __$$CoursePlaceDtoImplCopyWithImpl(
    _$CoursePlaceDtoImpl _value,
    $Res Function(_$CoursePlaceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoursePlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? fromLink = null,
  }) {
    return _then(
      _$CoursePlaceDtoImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        fromLink: null == fromLink
            ? _value.fromLink
            : fromLink // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoursePlaceDtoImpl implements _CoursePlaceDto {
  const _$CoursePlaceDtoImpl({
    this.name,
    this.description,
    this.fromLink = false,
  });

  factory _$CoursePlaceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoursePlaceDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool fromLink;

  @override
  String toString() {
    return 'CoursePlaceDto(name: $name, description: $description, fromLink: $fromLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoursePlaceDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fromLink, fromLink) ||
                other.fromLink == fromLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, fromLink);

  /// Create a copy of CoursePlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoursePlaceDtoImplCopyWith<_$CoursePlaceDtoImpl> get copyWith =>
      __$$CoursePlaceDtoImplCopyWithImpl<_$CoursePlaceDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CoursePlaceDtoImplToJson(this);
  }
}

abstract class _CoursePlaceDto implements CoursePlaceDto {
  const factory _CoursePlaceDto({
    final String? name,
    final String? description,
    final bool fromLink,
  }) = _$CoursePlaceDtoImpl;

  factory _CoursePlaceDto.fromJson(Map<String, dynamic> json) =
      _$CoursePlaceDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  bool get fromLink;

  /// Create a copy of CoursePlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoursePlaceDtoImplCopyWith<_$CoursePlaceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
