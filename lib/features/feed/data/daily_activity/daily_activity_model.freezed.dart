// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyActivityModel _$DailyActivityModelFromJson(Map<String, dynamic> json) {
  return _DailyActivityModel.fromJson(json);
}

/// @nodoc
mixin _$DailyActivityModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  set userId(String? value) => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  set date(DateTime value) => throw _privateConstructorUsedError;
  int get totalAttempts => throw _privateConstructorUsedError;
  set totalAttempts(int value) => throw _privateConstructorUsedError;
  int get totalCorrect => throw _privateConstructorUsedError;
  set totalCorrect(int value) => throw _privateConstructorUsedError;
  int get totalSkips => throw _privateConstructorUsedError;
  set totalSkips(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyActivityModelCopyWith<DailyActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyActivityModelCopyWith<$Res> {
  factory $DailyActivityModelCopyWith(
    DailyActivityModel value,
    $Res Function(DailyActivityModel) then,
  ) = _$DailyActivityModelCopyWithImpl<$Res, DailyActivityModel>;
  @useResult
  $Res call({
    String? id,
    String? userId,
    DateTime date,
    int totalAttempts,
    int totalCorrect,
    int totalSkips,
  });
}

/// @nodoc
class _$DailyActivityModelCopyWithImpl<$Res, $Val extends DailyActivityModel>
    implements $DailyActivityModelCopyWith<$Res> {
  _$DailyActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? date = null,
    Object? totalAttempts = null,
    Object? totalCorrect = null,
    Object? totalSkips = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            totalAttempts: null == totalAttempts
                ? _value.totalAttempts
                : totalAttempts // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCorrect: null == totalCorrect
                ? _value.totalCorrect
                : totalCorrect // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSkips: null == totalSkips
                ? _value.totalSkips
                : totalSkips // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyActivityModelImplCopyWith<$Res>
    implements $DailyActivityModelCopyWith<$Res> {
  factory _$$DailyActivityModelImplCopyWith(
    _$DailyActivityModelImpl value,
    $Res Function(_$DailyActivityModelImpl) then,
  ) = __$$DailyActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? userId,
    DateTime date,
    int totalAttempts,
    int totalCorrect,
    int totalSkips,
  });
}

/// @nodoc
class __$$DailyActivityModelImplCopyWithImpl<$Res>
    extends _$DailyActivityModelCopyWithImpl<$Res, _$DailyActivityModelImpl>
    implements _$$DailyActivityModelImplCopyWith<$Res> {
  __$$DailyActivityModelImplCopyWithImpl(
    _$DailyActivityModelImpl _value,
    $Res Function(_$DailyActivityModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? date = null,
    Object? totalAttempts = null,
    Object? totalCorrect = null,
    Object? totalSkips = null,
  }) {
    return _then(
      _$DailyActivityModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        totalAttempts: null == totalAttempts
            ? _value.totalAttempts
            : totalAttempts // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCorrect: null == totalCorrect
            ? _value.totalCorrect
            : totalCorrect // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSkips: null == totalSkips
            ? _value.totalSkips
            : totalSkips // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyActivityModelImpl implements _DailyActivityModel {
  _$DailyActivityModelImpl({
    this.id,
    this.userId,
    required this.date,
    required this.totalAttempts,
    required this.totalCorrect,
    required this.totalSkips,
  });

  factory _$DailyActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyActivityModelImplFromJson(json);

  @override
  String? id;
  @override
  String? userId;
  @override
  DateTime date;
  @override
  int totalAttempts;
  @override
  int totalCorrect;
  @override
  int totalSkips;

  @override
  String toString() {
    return 'DailyActivityModel(id: $id, userId: $userId, date: $date, totalAttempts: $totalAttempts, totalCorrect: $totalCorrect, totalSkips: $totalSkips)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyActivityModelImplCopyWith<_$DailyActivityModelImpl> get copyWith =>
      __$$DailyActivityModelImplCopyWithImpl<_$DailyActivityModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyActivityModelImplToJson(this);
  }
}

abstract class _DailyActivityModel implements DailyActivityModel {
  factory _DailyActivityModel({
    String? id,
    String? userId,
    required DateTime date,
    required int totalAttempts,
    required int totalCorrect,
    required int totalSkips,
  }) = _$DailyActivityModelImpl;

  factory _DailyActivityModel.fromJson(Map<String, dynamic> json) =
      _$DailyActivityModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get userId;
  set userId(String? value);
  @override
  DateTime get date;
  set date(DateTime value);
  @override
  int get totalAttempts;
  set totalAttempts(int value);
  @override
  int get totalCorrect;
  set totalCorrect(int value);
  @override
  int get totalSkips;
  set totalSkips(int value);
  @override
  @JsonKey(ignore: true)
  _$$DailyActivityModelImplCopyWith<_$DailyActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
