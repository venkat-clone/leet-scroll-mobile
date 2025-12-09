// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  UserModel get user => throw _privateConstructorUsedError;
  ProfileStats get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
    ProfileModel value,
    $Res Function(ProfileModel) then,
  ) = _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({UserModel user, ProfileStats stats});

  $UserModelCopyWith<$Res> get user;
  $ProfileStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? stats = null}) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as ProfileStats,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileStatsCopyWith<$Res> get stats {
    return $ProfileStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
    _$ProfileModelImpl value,
    $Res Function(_$ProfileModelImpl) then,
  ) = __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel user, ProfileStats stats});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $ProfileStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
    _$ProfileModelImpl _value,
    $Res Function(_$ProfileModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? stats = null}) {
    return _then(
      _$ProfileModelImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        stats: null == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as ProfileStats,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl implements _ProfileModel {
  const _$ProfileModelImpl({required this.user, required this.stats});

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final ProfileStats stats;

  @override
  String toString() {
    return 'ProfileModel(user: $user, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, stats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(this);
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel({
    required final UserModel user,
    required final ProfileStats stats,
  }) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  ProfileStats get stats;
  @override
  @JsonKey(ignore: true)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileStats _$ProfileStatsFromJson(Map<String, dynamic> json) {
  return _ProfileStats.fromJson(json);
}

/// @nodoc
mixin _$ProfileStats {
  int get correctAnswers => throw _privateConstructorUsedError;
  int get wrongAnswers => throw _privateConstructorUsedError;
  int get questionsAttempted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileStatsCopyWith<ProfileStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStatsCopyWith<$Res> {
  factory $ProfileStatsCopyWith(
    ProfileStats value,
    $Res Function(ProfileStats) then,
  ) = _$ProfileStatsCopyWithImpl<$Res, ProfileStats>;
  @useResult
  $Res call({int correctAnswers, int wrongAnswers, int questionsAttempted});
}

/// @nodoc
class _$ProfileStatsCopyWithImpl<$Res, $Val extends ProfileStats>
    implements $ProfileStatsCopyWith<$Res> {
  _$ProfileStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? questionsAttempted = null,
  }) {
    return _then(
      _value.copyWith(
            correctAnswers: null == correctAnswers
                ? _value.correctAnswers
                : correctAnswers // ignore: cast_nullable_to_non_nullable
                      as int,
            wrongAnswers: null == wrongAnswers
                ? _value.wrongAnswers
                : wrongAnswers // ignore: cast_nullable_to_non_nullable
                      as int,
            questionsAttempted: null == questionsAttempted
                ? _value.questionsAttempted
                : questionsAttempted // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileStatsImplCopyWith<$Res>
    implements $ProfileStatsCopyWith<$Res> {
  factory _$$ProfileStatsImplCopyWith(
    _$ProfileStatsImpl value,
    $Res Function(_$ProfileStatsImpl) then,
  ) = __$$ProfileStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int correctAnswers, int wrongAnswers, int questionsAttempted});
}

/// @nodoc
class __$$ProfileStatsImplCopyWithImpl<$Res>
    extends _$ProfileStatsCopyWithImpl<$Res, _$ProfileStatsImpl>
    implements _$$ProfileStatsImplCopyWith<$Res> {
  __$$ProfileStatsImplCopyWithImpl(
    _$ProfileStatsImpl _value,
    $Res Function(_$ProfileStatsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? questionsAttempted = null,
  }) {
    return _then(
      _$ProfileStatsImpl(
        correctAnswers: null == correctAnswers
            ? _value.correctAnswers
            : correctAnswers // ignore: cast_nullable_to_non_nullable
                  as int,
        wrongAnswers: null == wrongAnswers
            ? _value.wrongAnswers
            : wrongAnswers // ignore: cast_nullable_to_non_nullable
                  as int,
        questionsAttempted: null == questionsAttempted
            ? _value.questionsAttempted
            : questionsAttempted // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileStatsImpl implements _ProfileStats {
  const _$ProfileStatsImpl({
    this.correctAnswers = 0,
    this.wrongAnswers = 0,
    this.questionsAttempted = 0,
  });

  factory _$ProfileStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileStatsImplFromJson(json);

  @override
  @JsonKey()
  final int correctAnswers;
  @override
  @JsonKey()
  final int wrongAnswers;
  @override
  @JsonKey()
  final int questionsAttempted;

  @override
  String toString() {
    return 'ProfileStats(correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, questionsAttempted: $questionsAttempted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStatsImpl &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.wrongAnswers, wrongAnswers) ||
                other.wrongAnswers == wrongAnswers) &&
            (identical(other.questionsAttempted, questionsAttempted) ||
                other.questionsAttempted == questionsAttempted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    correctAnswers,
    wrongAnswers,
    questionsAttempted,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStatsImplCopyWith<_$ProfileStatsImpl> get copyWith =>
      __$$ProfileStatsImplCopyWithImpl<_$ProfileStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileStatsImplToJson(this);
  }
}

abstract class _ProfileStats implements ProfileStats {
  const factory _ProfileStats({
    final int correctAnswers,
    final int wrongAnswers,
    final int questionsAttempted,
  }) = _$ProfileStatsImpl;

  factory _ProfileStats.fromJson(Map<String, dynamic> json) =
      _$ProfileStatsImpl.fromJson;

  @override
  int get correctAnswers;
  @override
  int get wrongAnswers;
  @override
  int get questionsAttempted;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStatsImplCopyWith<_$ProfileStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
