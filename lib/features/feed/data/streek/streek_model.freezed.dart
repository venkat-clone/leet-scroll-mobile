// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streek_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StreekModel _$StreekModelFromJson(Map<String, dynamic> json) {
  return _StreekModel.fromJson(json);
}

/// @nodoc
mixin _$StreekModel {
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  DateTime? get lastActivityDate => throw _privateConstructorUsedError;
  DailyActivityModel? get todayActivity => throw _privateConstructorUsedError;
  List<DailyActivityModel> get dailyActivities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreekModelCopyWith<StreekModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreekModelCopyWith<$Res> {
  factory $StreekModelCopyWith(
    StreekModel value,
    $Res Function(StreekModel) then,
  ) = _$StreekModelCopyWithImpl<$Res, StreekModel>;
  @useResult
  $Res call({
    int currentStreak,
    int longestStreak,
    DateTime? lastActivityDate,
    DailyActivityModel? todayActivity,
    List<DailyActivityModel> dailyActivities,
  });

  $DailyActivityModelCopyWith<$Res>? get todayActivity;
}

/// @nodoc
class _$StreekModelCopyWithImpl<$Res, $Val extends StreekModel>
    implements $StreekModelCopyWith<$Res> {
  _$StreekModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastActivityDate = freezed,
    Object? todayActivity = freezed,
    Object? dailyActivities = null,
  }) {
    return _then(
      _value.copyWith(
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            longestStreak: null == longestStreak
                ? _value.longestStreak
                : longestStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            lastActivityDate: freezed == lastActivityDate
                ? _value.lastActivityDate
                : lastActivityDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            todayActivity: freezed == todayActivity
                ? _value.todayActivity
                : todayActivity // ignore: cast_nullable_to_non_nullable
                      as DailyActivityModel?,
            dailyActivities: null == dailyActivities
                ? _value.dailyActivities
                : dailyActivities // ignore: cast_nullable_to_non_nullable
                      as List<DailyActivityModel>,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $DailyActivityModelCopyWith<$Res>? get todayActivity {
    if (_value.todayActivity == null) {
      return null;
    }

    return $DailyActivityModelCopyWith<$Res>(_value.todayActivity!, (value) {
      return _then(_value.copyWith(todayActivity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StreekModelImplCopyWith<$Res>
    implements $StreekModelCopyWith<$Res> {
  factory _$$StreekModelImplCopyWith(
    _$StreekModelImpl value,
    $Res Function(_$StreekModelImpl) then,
  ) = __$$StreekModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentStreak,
    int longestStreak,
    DateTime? lastActivityDate,
    DailyActivityModel? todayActivity,
    List<DailyActivityModel> dailyActivities,
  });

  @override
  $DailyActivityModelCopyWith<$Res>? get todayActivity;
}

/// @nodoc
class __$$StreekModelImplCopyWithImpl<$Res>
    extends _$StreekModelCopyWithImpl<$Res, _$StreekModelImpl>
    implements _$$StreekModelImplCopyWith<$Res> {
  __$$StreekModelImplCopyWithImpl(
    _$StreekModelImpl _value,
    $Res Function(_$StreekModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastActivityDate = freezed,
    Object? todayActivity = freezed,
    Object? dailyActivities = null,
  }) {
    return _then(
      _$StreekModelImpl(
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        longestStreak: null == longestStreak
            ? _value.longestStreak
            : longestStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        lastActivityDate: freezed == lastActivityDate
            ? _value.lastActivityDate
            : lastActivityDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        todayActivity: freezed == todayActivity
            ? _value.todayActivity
            : todayActivity // ignore: cast_nullable_to_non_nullable
                  as DailyActivityModel?,
        dailyActivities: null == dailyActivities
            ? _value._dailyActivities
            : dailyActivities // ignore: cast_nullable_to_non_nullable
                  as List<DailyActivityModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StreekModelImpl implements _StreekModel {
  _$StreekModelImpl({
    required this.currentStreak,
    required this.longestStreak,
    this.lastActivityDate,
    this.todayActivity,
    required final List<DailyActivityModel> dailyActivities,
  }) : _dailyActivities = dailyActivities;

  factory _$StreekModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreekModelImplFromJson(json);

  @override
  final int currentStreak;
  @override
  final int longestStreak;
  @override
  final DateTime? lastActivityDate;
  @override
  final DailyActivityModel? todayActivity;
  final List<DailyActivityModel> _dailyActivities;
  @override
  List<DailyActivityModel> get dailyActivities {
    if (_dailyActivities is EqualUnmodifiableListView) return _dailyActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyActivities);
  }

  @override
  String toString() {
    return 'StreekModel(currentStreak: $currentStreak, longestStreak: $longestStreak, lastActivityDate: $lastActivityDate, todayActivity: $todayActivity, dailyActivities: $dailyActivities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreekModelImpl &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.lastActivityDate, lastActivityDate) ||
                other.lastActivityDate == lastActivityDate) &&
            (identical(other.todayActivity, todayActivity) ||
                other.todayActivity == todayActivity) &&
            const DeepCollectionEquality().equals(
              other._dailyActivities,
              _dailyActivities,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStreak,
    longestStreak,
    lastActivityDate,
    todayActivity,
    const DeepCollectionEquality().hash(_dailyActivities),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreekModelImplCopyWith<_$StreekModelImpl> get copyWith =>
      __$$StreekModelImplCopyWithImpl<_$StreekModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreekModelImplToJson(this);
  }
}

abstract class _StreekModel implements StreekModel {
  factory _StreekModel({
    required final int currentStreak,
    required final int longestStreak,
    final DateTime? lastActivityDate,
    final DailyActivityModel? todayActivity,
    required final List<DailyActivityModel> dailyActivities,
  }) = _$StreekModelImpl;

  factory _StreekModel.fromJson(Map<String, dynamic> json) =
      _$StreekModelImpl.fromJson;

  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  DateTime? get lastActivityDate;
  @override
  DailyActivityModel? get todayActivity;
  @override
  List<DailyActivityModel> get dailyActivities;
  @override
  @JsonKey(ignore: true)
  _$$StreekModelImplCopyWith<_$StreekModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
