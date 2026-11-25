// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_guide_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TravelGuideResponseDto _$TravelGuideResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _TravelGuideResponseDto.fromJson(json);
}

/// @nodoc
mixin _$TravelGuideResponseDto {
  int? get dDay => throw _privateConstructorUsedError; // 여행 시작일까지 남은 일수
  num? get totalCost => throw _privateConstructorUsedError; // 목표 총 예산
  int? get remainingMonths =>
      throw _privateConstructorUsedError; // 이번 기간 포함 남은 기간 수
  num? get monthlySavingAmount =>
      throw _privateConstructorUsedError; // 월 저축 목표 금액
  num? get accumulatedSavingAmount =>
      throw _privateConstructorUsedError; // 누적 저축 목표 금액
  TravelGuidePeriodDto? get period => throw _privateConstructorUsedError;

  /// Serializes this TravelGuideResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelGuideResponseDtoCopyWith<TravelGuideResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelGuideResponseDtoCopyWith<$Res> {
  factory $TravelGuideResponseDtoCopyWith(
    TravelGuideResponseDto value,
    $Res Function(TravelGuideResponseDto) then,
  ) = _$TravelGuideResponseDtoCopyWithImpl<$Res, TravelGuideResponseDto>;
  @useResult
  $Res call({
    int? dDay,
    num? totalCost,
    int? remainingMonths,
    num? monthlySavingAmount,
    num? accumulatedSavingAmount,
    TravelGuidePeriodDto? period,
  });

  $TravelGuidePeriodDtoCopyWith<$Res>? get period;
}

/// @nodoc
class _$TravelGuideResponseDtoCopyWithImpl<
  $Res,
  $Val extends TravelGuideResponseDto
>
    implements $TravelGuideResponseDtoCopyWith<$Res> {
  _$TravelGuideResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dDay = freezed,
    Object? totalCost = freezed,
    Object? remainingMonths = freezed,
    Object? monthlySavingAmount = freezed,
    Object? accumulatedSavingAmount = freezed,
    Object? period = freezed,
  }) {
    return _then(
      _value.copyWith(
            dDay: freezed == dDay
                ? _value.dDay
                : dDay // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalCost: freezed == totalCost
                ? _value.totalCost
                : totalCost // ignore: cast_nullable_to_non_nullable
                      as num?,
            remainingMonths: freezed == remainingMonths
                ? _value.remainingMonths
                : remainingMonths // ignore: cast_nullable_to_non_nullable
                      as int?,
            monthlySavingAmount: freezed == monthlySavingAmount
                ? _value.monthlySavingAmount
                : monthlySavingAmount // ignore: cast_nullable_to_non_nullable
                      as num?,
            accumulatedSavingAmount: freezed == accumulatedSavingAmount
                ? _value.accumulatedSavingAmount
                : accumulatedSavingAmount // ignore: cast_nullable_to_non_nullable
                      as num?,
            period: freezed == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as TravelGuidePeriodDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of TravelGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravelGuidePeriodDtoCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $TravelGuidePeriodDtoCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelGuideResponseDtoImplCopyWith<$Res>
    implements $TravelGuideResponseDtoCopyWith<$Res> {
  factory _$$TravelGuideResponseDtoImplCopyWith(
    _$TravelGuideResponseDtoImpl value,
    $Res Function(_$TravelGuideResponseDtoImpl) then,
  ) = __$$TravelGuideResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? dDay,
    num? totalCost,
    int? remainingMonths,
    num? monthlySavingAmount,
    num? accumulatedSavingAmount,
    TravelGuidePeriodDto? period,
  });

  @override
  $TravelGuidePeriodDtoCopyWith<$Res>? get period;
}

/// @nodoc
class __$$TravelGuideResponseDtoImplCopyWithImpl<$Res>
    extends
        _$TravelGuideResponseDtoCopyWithImpl<$Res, _$TravelGuideResponseDtoImpl>
    implements _$$TravelGuideResponseDtoImplCopyWith<$Res> {
  __$$TravelGuideResponseDtoImplCopyWithImpl(
    _$TravelGuideResponseDtoImpl _value,
    $Res Function(_$TravelGuideResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TravelGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dDay = freezed,
    Object? totalCost = freezed,
    Object? remainingMonths = freezed,
    Object? monthlySavingAmount = freezed,
    Object? accumulatedSavingAmount = freezed,
    Object? period = freezed,
  }) {
    return _then(
      _$TravelGuideResponseDtoImpl(
        dDay: freezed == dDay
            ? _value.dDay
            : dDay // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalCost: freezed == totalCost
            ? _value.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as num?,
        remainingMonths: freezed == remainingMonths
            ? _value.remainingMonths
            : remainingMonths // ignore: cast_nullable_to_non_nullable
                  as int?,
        monthlySavingAmount: freezed == monthlySavingAmount
            ? _value.monthlySavingAmount
            : monthlySavingAmount // ignore: cast_nullable_to_non_nullable
                  as num?,
        accumulatedSavingAmount: freezed == accumulatedSavingAmount
            ? _value.accumulatedSavingAmount
            : accumulatedSavingAmount // ignore: cast_nullable_to_non_nullable
                  as num?,
        period: freezed == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as TravelGuidePeriodDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelGuideResponseDtoImpl implements _TravelGuideResponseDto {
  const _$TravelGuideResponseDtoImpl({
    this.dDay,
    this.totalCost,
    this.remainingMonths,
    this.monthlySavingAmount,
    this.accumulatedSavingAmount,
    this.period,
  });

  factory _$TravelGuideResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelGuideResponseDtoImplFromJson(json);

  @override
  final int? dDay;
  // 여행 시작일까지 남은 일수
  @override
  final num? totalCost;
  // 목표 총 예산
  @override
  final int? remainingMonths;
  // 이번 기간 포함 남은 기간 수
  @override
  final num? monthlySavingAmount;
  // 월 저축 목표 금액
  @override
  final num? accumulatedSavingAmount;
  // 누적 저축 목표 금액
  @override
  final TravelGuidePeriodDto? period;

  @override
  String toString() {
    return 'TravelGuideResponseDto(dDay: $dDay, totalCost: $totalCost, remainingMonths: $remainingMonths, monthlySavingAmount: $monthlySavingAmount, accumulatedSavingAmount: $accumulatedSavingAmount, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelGuideResponseDtoImpl &&
            (identical(other.dDay, dDay) || other.dDay == dDay) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.remainingMonths, remainingMonths) ||
                other.remainingMonths == remainingMonths) &&
            (identical(other.monthlySavingAmount, monthlySavingAmount) ||
                other.monthlySavingAmount == monthlySavingAmount) &&
            (identical(
                  other.accumulatedSavingAmount,
                  accumulatedSavingAmount,
                ) ||
                other.accumulatedSavingAmount == accumulatedSavingAmount) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dDay,
    totalCost,
    remainingMonths,
    monthlySavingAmount,
    accumulatedSavingAmount,
    period,
  );

  /// Create a copy of TravelGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelGuideResponseDtoImplCopyWith<_$TravelGuideResponseDtoImpl>
  get copyWith =>
      __$$TravelGuideResponseDtoImplCopyWithImpl<_$TravelGuideResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelGuideResponseDtoImplToJson(this);
  }
}

abstract class _TravelGuideResponseDto implements TravelGuideResponseDto {
  const factory _TravelGuideResponseDto({
    final int? dDay,
    final num? totalCost,
    final int? remainingMonths,
    final num? monthlySavingAmount,
    final num? accumulatedSavingAmount,
    final TravelGuidePeriodDto? period,
  }) = _$TravelGuideResponseDtoImpl;

  factory _TravelGuideResponseDto.fromJson(Map<String, dynamic> json) =
      _$TravelGuideResponseDtoImpl.fromJson;

  @override
  int? get dDay; // 여행 시작일까지 남은 일수
  @override
  num? get totalCost; // 목표 총 예산
  @override
  int? get remainingMonths; // 이번 기간 포함 남은 기간 수
  @override
  num? get monthlySavingAmount; // 월 저축 목표 금액
  @override
  num? get accumulatedSavingAmount; // 누적 저축 목표 금액
  @override
  TravelGuidePeriodDto? get period;

  /// Create a copy of TravelGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelGuideResponseDtoImplCopyWith<_$TravelGuideResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TravelGuidePeriodDto _$TravelGuidePeriodDtoFromJson(Map<String, dynamic> json) {
  return _TravelGuidePeriodDto.fromJson(json);
}

/// @nodoc
mixin _$TravelGuidePeriodDto {
  String? get periodStart => throw _privateConstructorUsedError;
  String? get periodEnd => throw _privateConstructorUsedError;
  TravelGuideSavingDto? get saving =>
      throw _privateConstructorUsedError; // 저축 목표 (마지막 자투리 기간이면 없음)
  List<TravelGuideTodoDto> get todos => throw _privateConstructorUsedError;

  /// Serializes this TravelGuidePeriodDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelGuidePeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelGuidePeriodDtoCopyWith<TravelGuidePeriodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelGuidePeriodDtoCopyWith<$Res> {
  factory $TravelGuidePeriodDtoCopyWith(
    TravelGuidePeriodDto value,
    $Res Function(TravelGuidePeriodDto) then,
  ) = _$TravelGuidePeriodDtoCopyWithImpl<$Res, TravelGuidePeriodDto>;
  @useResult
  $Res call({
    String? periodStart,
    String? periodEnd,
    TravelGuideSavingDto? saving,
    List<TravelGuideTodoDto> todos,
  });

  $TravelGuideSavingDtoCopyWith<$Res>? get saving;
}

/// @nodoc
class _$TravelGuidePeriodDtoCopyWithImpl<
  $Res,
  $Val extends TravelGuidePeriodDto
>
    implements $TravelGuidePeriodDtoCopyWith<$Res> {
  _$TravelGuidePeriodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelGuidePeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? saving = freezed,
    Object? todos = null,
  }) {
    return _then(
      _value.copyWith(
            periodStart: freezed == periodStart
                ? _value.periodStart
                : periodStart // ignore: cast_nullable_to_non_nullable
                      as String?,
            periodEnd: freezed == periodEnd
                ? _value.periodEnd
                : periodEnd // ignore: cast_nullable_to_non_nullable
                      as String?,
            saving: freezed == saving
                ? _value.saving
                : saving // ignore: cast_nullable_to_non_nullable
                      as TravelGuideSavingDto?,
            todos: null == todos
                ? _value.todos
                : todos // ignore: cast_nullable_to_non_nullable
                      as List<TravelGuideTodoDto>,
          )
          as $Val,
    );
  }

  /// Create a copy of TravelGuidePeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravelGuideSavingDtoCopyWith<$Res>? get saving {
    if (_value.saving == null) {
      return null;
    }

    return $TravelGuideSavingDtoCopyWith<$Res>(_value.saving!, (value) {
      return _then(_value.copyWith(saving: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelGuidePeriodDtoImplCopyWith<$Res>
    implements $TravelGuidePeriodDtoCopyWith<$Res> {
  factory _$$TravelGuidePeriodDtoImplCopyWith(
    _$TravelGuidePeriodDtoImpl value,
    $Res Function(_$TravelGuidePeriodDtoImpl) then,
  ) = __$$TravelGuidePeriodDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? periodStart,
    String? periodEnd,
    TravelGuideSavingDto? saving,
    List<TravelGuideTodoDto> todos,
  });

  @override
  $TravelGuideSavingDtoCopyWith<$Res>? get saving;
}

/// @nodoc
class __$$TravelGuidePeriodDtoImplCopyWithImpl<$Res>
    extends _$TravelGuidePeriodDtoCopyWithImpl<$Res, _$TravelGuidePeriodDtoImpl>
    implements _$$TravelGuidePeriodDtoImplCopyWith<$Res> {
  __$$TravelGuidePeriodDtoImplCopyWithImpl(
    _$TravelGuidePeriodDtoImpl _value,
    $Res Function(_$TravelGuidePeriodDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TravelGuidePeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? saving = freezed,
    Object? todos = null,
  }) {
    return _then(
      _$TravelGuidePeriodDtoImpl(
        periodStart: freezed == periodStart
            ? _value.periodStart
            : periodStart // ignore: cast_nullable_to_non_nullable
                  as String?,
        periodEnd: freezed == periodEnd
            ? _value.periodEnd
            : periodEnd // ignore: cast_nullable_to_non_nullable
                  as String?,
        saving: freezed == saving
            ? _value.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as TravelGuideSavingDto?,
        todos: null == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<TravelGuideTodoDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelGuidePeriodDtoImpl implements _TravelGuidePeriodDto {
  const _$TravelGuidePeriodDtoImpl({
    this.periodStart,
    this.periodEnd,
    this.saving,
    final List<TravelGuideTodoDto> todos = const [],
  }) : _todos = todos;

  factory _$TravelGuidePeriodDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelGuidePeriodDtoImplFromJson(json);

  @override
  final String? periodStart;
  @override
  final String? periodEnd;
  @override
  final TravelGuideSavingDto? saving;
  // 저축 목표 (마지막 자투리 기간이면 없음)
  final List<TravelGuideTodoDto> _todos;
  // 저축 목표 (마지막 자투리 기간이면 없음)
  @override
  @JsonKey()
  List<TravelGuideTodoDto> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'TravelGuidePeriodDto(periodStart: $periodStart, periodEnd: $periodEnd, saving: $saving, todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelGuidePeriodDtoImpl &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    periodStart,
    periodEnd,
    saving,
    const DeepCollectionEquality().hash(_todos),
  );

  /// Create a copy of TravelGuidePeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelGuidePeriodDtoImplCopyWith<_$TravelGuidePeriodDtoImpl>
  get copyWith =>
      __$$TravelGuidePeriodDtoImplCopyWithImpl<_$TravelGuidePeriodDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelGuidePeriodDtoImplToJson(this);
  }
}

abstract class _TravelGuidePeriodDto implements TravelGuidePeriodDto {
  const factory _TravelGuidePeriodDto({
    final String? periodStart,
    final String? periodEnd,
    final TravelGuideSavingDto? saving,
    final List<TravelGuideTodoDto> todos,
  }) = _$TravelGuidePeriodDtoImpl;

  factory _TravelGuidePeriodDto.fromJson(Map<String, dynamic> json) =
      _$TravelGuidePeriodDtoImpl.fromJson;

  @override
  String? get periodStart;
  @override
  String? get periodEnd;
  @override
  TravelGuideSavingDto? get saving; // 저축 목표 (마지막 자투리 기간이면 없음)
  @override
  List<TravelGuideTodoDto> get todos;

  /// Create a copy of TravelGuidePeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelGuidePeriodDtoImplCopyWith<_$TravelGuidePeriodDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TravelGuideSavingDto _$TravelGuideSavingDtoFromJson(Map<String, dynamic> json) {
  return _TravelGuideSavingDto.fromJson(json);
}

/// @nodoc
mixin _$TravelGuideSavingDto {
  int get savingId =>
      throw _privateConstructorUsedError; // 저축 체크 API(PATCH /guides/savings/{savingId})용
  String? get periodStart => throw _privateConstructorUsedError;
  String? get periodEnd => throw _privateConstructorUsedError;
  num? get amount => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this TravelGuideSavingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelGuideSavingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelGuideSavingDtoCopyWith<TravelGuideSavingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelGuideSavingDtoCopyWith<$Res> {
  factory $TravelGuideSavingDtoCopyWith(
    TravelGuideSavingDto value,
    $Res Function(TravelGuideSavingDto) then,
  ) = _$TravelGuideSavingDtoCopyWithImpl<$Res, TravelGuideSavingDto>;
  @useResult
  $Res call({
    int savingId,
    String? periodStart,
    String? periodEnd,
    num? amount,
    bool isCompleted,
  });
}

/// @nodoc
class _$TravelGuideSavingDtoCopyWithImpl<
  $Res,
  $Val extends TravelGuideSavingDto
>
    implements $TravelGuideSavingDtoCopyWith<$Res> {
  _$TravelGuideSavingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelGuideSavingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savingId = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? amount = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            savingId: null == savingId
                ? _value.savingId
                : savingId // ignore: cast_nullable_to_non_nullable
                      as int,
            periodStart: freezed == periodStart
                ? _value.periodStart
                : periodStart // ignore: cast_nullable_to_non_nullable
                      as String?,
            periodEnd: freezed == periodEnd
                ? _value.periodEnd
                : periodEnd // ignore: cast_nullable_to_non_nullable
                      as String?,
            amount: freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as num?,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TravelGuideSavingDtoImplCopyWith<$Res>
    implements $TravelGuideSavingDtoCopyWith<$Res> {
  factory _$$TravelGuideSavingDtoImplCopyWith(
    _$TravelGuideSavingDtoImpl value,
    $Res Function(_$TravelGuideSavingDtoImpl) then,
  ) = __$$TravelGuideSavingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int savingId,
    String? periodStart,
    String? periodEnd,
    num? amount,
    bool isCompleted,
  });
}

/// @nodoc
class __$$TravelGuideSavingDtoImplCopyWithImpl<$Res>
    extends _$TravelGuideSavingDtoCopyWithImpl<$Res, _$TravelGuideSavingDtoImpl>
    implements _$$TravelGuideSavingDtoImplCopyWith<$Res> {
  __$$TravelGuideSavingDtoImplCopyWithImpl(
    _$TravelGuideSavingDtoImpl _value,
    $Res Function(_$TravelGuideSavingDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TravelGuideSavingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savingId = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? amount = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _$TravelGuideSavingDtoImpl(
        savingId: null == savingId
            ? _value.savingId
            : savingId // ignore: cast_nullable_to_non_nullable
                  as int,
        periodStart: freezed == periodStart
            ? _value.periodStart
            : periodStart // ignore: cast_nullable_to_non_nullable
                  as String?,
        periodEnd: freezed == periodEnd
            ? _value.periodEnd
            : periodEnd // ignore: cast_nullable_to_non_nullable
                  as String?,
        amount: freezed == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as num?,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelGuideSavingDtoImpl implements _TravelGuideSavingDto {
  const _$TravelGuideSavingDtoImpl({
    required this.savingId,
    this.periodStart,
    this.periodEnd,
    this.amount,
    this.isCompleted = false,
  });

  factory _$TravelGuideSavingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelGuideSavingDtoImplFromJson(json);

  @override
  final int savingId;
  // 저축 체크 API(PATCH /guides/savings/{savingId})용
  @override
  final String? periodStart;
  @override
  final String? periodEnd;
  @override
  final num? amount;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'TravelGuideSavingDto(savingId: $savingId, periodStart: $periodStart, periodEnd: $periodEnd, amount: $amount, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelGuideSavingDtoImpl &&
            (identical(other.savingId, savingId) ||
                other.savingId == savingId) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    savingId,
    periodStart,
    periodEnd,
    amount,
    isCompleted,
  );

  /// Create a copy of TravelGuideSavingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelGuideSavingDtoImplCopyWith<_$TravelGuideSavingDtoImpl>
  get copyWith =>
      __$$TravelGuideSavingDtoImplCopyWithImpl<_$TravelGuideSavingDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelGuideSavingDtoImplToJson(this);
  }
}

abstract class _TravelGuideSavingDto implements TravelGuideSavingDto {
  const factory _TravelGuideSavingDto({
    required final int savingId,
    final String? periodStart,
    final String? periodEnd,
    final num? amount,
    final bool isCompleted,
  }) = _$TravelGuideSavingDtoImpl;

  factory _TravelGuideSavingDto.fromJson(Map<String, dynamic> json) =
      _$TravelGuideSavingDtoImpl.fromJson;

  @override
  int get savingId; // 저축 체크 API(PATCH /guides/savings/{savingId})용
  @override
  String? get periodStart;
  @override
  String? get periodEnd;
  @override
  num? get amount;
  @override
  bool get isCompleted;

  /// Create a copy of TravelGuideSavingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelGuideSavingDtoImplCopyWith<_$TravelGuideSavingDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TravelGuideTodoDto _$TravelGuideTodoDtoFromJson(Map<String, dynamic> json) {
  return _TravelGuideTodoDto.fromJson(json);
}

/// @nodoc
mixin _$TravelGuideTodoDto {
  int get todoPeriodId =>
      throw _privateConstructorUsedError; // Todo 체크 API(PATCH /guides/todos/{todoPeriodId})용
  bool get isCarriedOver =>
      throw _privateConstructorUsedError; // true: 지난 기간에서 못 한 항목이 이번 기간으로 이월됨
  int? get todoId => throw _privateConstructorUsedError;
  int? get recommendationDetailId => throw _privateConstructorUsedError;
  String? get detailType =>
      throw _privateConstructorUsedError; // COURSE / LODGING / FLIGHT
  String? get content => throw _privateConstructorUsedError;
  num? get cost => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this TravelGuideTodoDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelGuideTodoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelGuideTodoDtoCopyWith<TravelGuideTodoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelGuideTodoDtoCopyWith<$Res> {
  factory $TravelGuideTodoDtoCopyWith(
    TravelGuideTodoDto value,
    $Res Function(TravelGuideTodoDto) then,
  ) = _$TravelGuideTodoDtoCopyWithImpl<$Res, TravelGuideTodoDto>;
  @useResult
  $Res call({
    int todoPeriodId,
    bool isCarriedOver,
    int? todoId,
    int? recommendationDetailId,
    String? detailType,
    String? content,
    num? cost,
    bool isCompleted,
  });
}

/// @nodoc
class _$TravelGuideTodoDtoCopyWithImpl<$Res, $Val extends TravelGuideTodoDto>
    implements $TravelGuideTodoDtoCopyWith<$Res> {
  _$TravelGuideTodoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelGuideTodoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoPeriodId = null,
    Object? isCarriedOver = null,
    Object? todoId = freezed,
    Object? recommendationDetailId = freezed,
    Object? detailType = freezed,
    Object? content = freezed,
    Object? cost = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            todoPeriodId: null == todoPeriodId
                ? _value.todoPeriodId
                : todoPeriodId // ignore: cast_nullable_to_non_nullable
                      as int,
            isCarriedOver: null == isCarriedOver
                ? _value.isCarriedOver
                : isCarriedOver // ignore: cast_nullable_to_non_nullable
                      as bool,
            todoId: freezed == todoId
                ? _value.todoId
                : todoId // ignore: cast_nullable_to_non_nullable
                      as int?,
            recommendationDetailId: freezed == recommendationDetailId
                ? _value.recommendationDetailId
                : recommendationDetailId // ignore: cast_nullable_to_non_nullable
                      as int?,
            detailType: freezed == detailType
                ? _value.detailType
                : detailType // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            cost: freezed == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as num?,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TravelGuideTodoDtoImplCopyWith<$Res>
    implements $TravelGuideTodoDtoCopyWith<$Res> {
  factory _$$TravelGuideTodoDtoImplCopyWith(
    _$TravelGuideTodoDtoImpl value,
    $Res Function(_$TravelGuideTodoDtoImpl) then,
  ) = __$$TravelGuideTodoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int todoPeriodId,
    bool isCarriedOver,
    int? todoId,
    int? recommendationDetailId,
    String? detailType,
    String? content,
    num? cost,
    bool isCompleted,
  });
}

/// @nodoc
class __$$TravelGuideTodoDtoImplCopyWithImpl<$Res>
    extends _$TravelGuideTodoDtoCopyWithImpl<$Res, _$TravelGuideTodoDtoImpl>
    implements _$$TravelGuideTodoDtoImplCopyWith<$Res> {
  __$$TravelGuideTodoDtoImplCopyWithImpl(
    _$TravelGuideTodoDtoImpl _value,
    $Res Function(_$TravelGuideTodoDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TravelGuideTodoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoPeriodId = null,
    Object? isCarriedOver = null,
    Object? todoId = freezed,
    Object? recommendationDetailId = freezed,
    Object? detailType = freezed,
    Object? content = freezed,
    Object? cost = freezed,
    Object? isCompleted = null,
  }) {
    return _then(
      _$TravelGuideTodoDtoImpl(
        todoPeriodId: null == todoPeriodId
            ? _value.todoPeriodId
            : todoPeriodId // ignore: cast_nullable_to_non_nullable
                  as int,
        isCarriedOver: null == isCarriedOver
            ? _value.isCarriedOver
            : isCarriedOver // ignore: cast_nullable_to_non_nullable
                  as bool,
        todoId: freezed == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as int?,
        recommendationDetailId: freezed == recommendationDetailId
            ? _value.recommendationDetailId
            : recommendationDetailId // ignore: cast_nullable_to_non_nullable
                  as int?,
        detailType: freezed == detailType
            ? _value.detailType
            : detailType // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        cost: freezed == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as num?,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelGuideTodoDtoImpl implements _TravelGuideTodoDto {
  const _$TravelGuideTodoDtoImpl({
    required this.todoPeriodId,
    this.isCarriedOver = false,
    this.todoId,
    this.recommendationDetailId,
    this.detailType,
    this.content,
    this.cost,
    this.isCompleted = false,
  });

  factory _$TravelGuideTodoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelGuideTodoDtoImplFromJson(json);

  @override
  final int todoPeriodId;
  // Todo 체크 API(PATCH /guides/todos/{todoPeriodId})용
  @override
  @JsonKey()
  final bool isCarriedOver;
  // true: 지난 기간에서 못 한 항목이 이번 기간으로 이월됨
  @override
  final int? todoId;
  @override
  final int? recommendationDetailId;
  @override
  final String? detailType;
  // COURSE / LODGING / FLIGHT
  @override
  final String? content;
  @override
  final num? cost;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'TravelGuideTodoDto(todoPeriodId: $todoPeriodId, isCarriedOver: $isCarriedOver, todoId: $todoId, recommendationDetailId: $recommendationDetailId, detailType: $detailType, content: $content, cost: $cost, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelGuideTodoDtoImpl &&
            (identical(other.todoPeriodId, todoPeriodId) ||
                other.todoPeriodId == todoPeriodId) &&
            (identical(other.isCarriedOver, isCarriedOver) ||
                other.isCarriedOver == isCarriedOver) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.recommendationDetailId, recommendationDetailId) ||
                other.recommendationDetailId == recommendationDetailId) &&
            (identical(other.detailType, detailType) ||
                other.detailType == detailType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    todoPeriodId,
    isCarriedOver,
    todoId,
    recommendationDetailId,
    detailType,
    content,
    cost,
    isCompleted,
  );

  /// Create a copy of TravelGuideTodoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelGuideTodoDtoImplCopyWith<_$TravelGuideTodoDtoImpl> get copyWith =>
      __$$TravelGuideTodoDtoImplCopyWithImpl<_$TravelGuideTodoDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelGuideTodoDtoImplToJson(this);
  }
}

abstract class _TravelGuideTodoDto implements TravelGuideTodoDto {
  const factory _TravelGuideTodoDto({
    required final int todoPeriodId,
    final bool isCarriedOver,
    final int? todoId,
    final int? recommendationDetailId,
    final String? detailType,
    final String? content,
    final num? cost,
    final bool isCompleted,
  }) = _$TravelGuideTodoDtoImpl;

  factory _TravelGuideTodoDto.fromJson(Map<String, dynamic> json) =
      _$TravelGuideTodoDtoImpl.fromJson;

  @override
  int get todoPeriodId; // Todo 체크 API(PATCH /guides/todos/{todoPeriodId})용
  @override
  bool get isCarriedOver; // true: 지난 기간에서 못 한 항목이 이번 기간으로 이월됨
  @override
  int? get todoId;
  @override
  int? get recommendationDetailId;
  @override
  String? get detailType; // COURSE / LODGING / FLIGHT
  @override
  String? get content;
  @override
  num? get cost;
  @override
  bool get isCompleted;

  /// Create a copy of TravelGuideTodoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelGuideTodoDtoImplCopyWith<_$TravelGuideTodoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AllTimelineGuideResponseDto _$AllTimelineGuideResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _AllTimelineGuideResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AllTimelineGuideResponseDto {
  List<TravelGuidePeriodDto> get periods => throw _privateConstructorUsedError;

  /// Serializes this AllTimelineGuideResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllTimelineGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllTimelineGuideResponseDtoCopyWith<AllTimelineGuideResponseDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTimelineGuideResponseDtoCopyWith<$Res> {
  factory $AllTimelineGuideResponseDtoCopyWith(
    AllTimelineGuideResponseDto value,
    $Res Function(AllTimelineGuideResponseDto) then,
  ) =
      _$AllTimelineGuideResponseDtoCopyWithImpl<
        $Res,
        AllTimelineGuideResponseDto
      >;
  @useResult
  $Res call({List<TravelGuidePeriodDto> periods});
}

/// @nodoc
class _$AllTimelineGuideResponseDtoCopyWithImpl<
  $Res,
  $Val extends AllTimelineGuideResponseDto
>
    implements $AllTimelineGuideResponseDtoCopyWith<$Res> {
  _$AllTimelineGuideResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllTimelineGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? periods = null}) {
    return _then(
      _value.copyWith(
            periods: null == periods
                ? _value.periods
                : periods // ignore: cast_nullable_to_non_nullable
                      as List<TravelGuidePeriodDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AllTimelineGuideResponseDtoImplCopyWith<$Res>
    implements $AllTimelineGuideResponseDtoCopyWith<$Res> {
  factory _$$AllTimelineGuideResponseDtoImplCopyWith(
    _$AllTimelineGuideResponseDtoImpl value,
    $Res Function(_$AllTimelineGuideResponseDtoImpl) then,
  ) = __$$AllTimelineGuideResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TravelGuidePeriodDto> periods});
}

/// @nodoc
class __$$AllTimelineGuideResponseDtoImplCopyWithImpl<$Res>
    extends
        _$AllTimelineGuideResponseDtoCopyWithImpl<
          $Res,
          _$AllTimelineGuideResponseDtoImpl
        >
    implements _$$AllTimelineGuideResponseDtoImplCopyWith<$Res> {
  __$$AllTimelineGuideResponseDtoImplCopyWithImpl(
    _$AllTimelineGuideResponseDtoImpl _value,
    $Res Function(_$AllTimelineGuideResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AllTimelineGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? periods = null}) {
    return _then(
      _$AllTimelineGuideResponseDtoImpl(
        periods: null == periods
            ? _value._periods
            : periods // ignore: cast_nullable_to_non_nullable
                  as List<TravelGuidePeriodDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AllTimelineGuideResponseDtoImpl
    implements _AllTimelineGuideResponseDto {
  const _$AllTimelineGuideResponseDtoImpl({
    final List<TravelGuidePeriodDto> periods = const [],
  }) : _periods = periods;

  factory _$AllTimelineGuideResponseDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AllTimelineGuideResponseDtoImplFromJson(json);

  final List<TravelGuidePeriodDto> _periods;
  @override
  @JsonKey()
  List<TravelGuidePeriodDto> get periods {
    if (_periods is EqualUnmodifiableListView) return _periods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periods);
  }

  @override
  String toString() {
    return 'AllTimelineGuideResponseDto(periods: $periods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllTimelineGuideResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._periods, _periods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_periods));

  /// Create a copy of AllTimelineGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllTimelineGuideResponseDtoImplCopyWith<_$AllTimelineGuideResponseDtoImpl>
  get copyWith =>
      __$$AllTimelineGuideResponseDtoImplCopyWithImpl<
        _$AllTimelineGuideResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllTimelineGuideResponseDtoImplToJson(this);
  }
}

abstract class _AllTimelineGuideResponseDto
    implements AllTimelineGuideResponseDto {
  const factory _AllTimelineGuideResponseDto({
    final List<TravelGuidePeriodDto> periods,
  }) = _$AllTimelineGuideResponseDtoImpl;

  factory _AllTimelineGuideResponseDto.fromJson(Map<String, dynamic> json) =
      _$AllTimelineGuideResponseDtoImpl.fromJson;

  @override
  List<TravelGuidePeriodDto> get periods;

  /// Create a copy of AllTimelineGuideResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllTimelineGuideResponseDtoImplCopyWith<_$AllTimelineGuideResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
