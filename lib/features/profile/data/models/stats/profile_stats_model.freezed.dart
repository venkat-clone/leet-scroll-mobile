// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileStatsModel _$ProfileStatsModelFromJson(Map<String, dynamic> json) {
  return _StatsModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileStatsModel {
  int get correctAnswers => throw _privateConstructorUsedError;
  set correctAnswers(int value) => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  set score(int value) => throw _privateConstructorUsedError;
  int get submissions => throw _privateConstructorUsedError;
  set submissions(int value) => throw _privateConstructorUsedError;
  int get wrongAnswers => throw _privateConstructorUsedError;
  set wrongAnswers(int value) => throw _privateConstructorUsedError;
  int get questionsAttempted => throw _privateConstructorUsedError;
  set questionsAttempted(int value) => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  set rank(int value) => throw _privateConstructorUsedError;
  int? get nextRankedUserPoints => throw _privateConstructorUsedError;
  set nextRankedUserPoints(int? value) => throw _privateConstructorUsedError;
  int get noOfUsers => throw _privateConstructorUsedError;
  set noOfUsers(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileStatsModelCopyWith<ProfileStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStatsModelCopyWith<$Res> {
  factory $ProfileStatsModelCopyWith(
    ProfileStatsModel value,
    $Res Function(ProfileStatsModel) then,
  ) = _$ProfileStatsModelCopyWithImpl<$Res, ProfileStatsModel>;
  @useResult
  $Res call({
    int correctAnswers,
    int score,
    int submissions,
    int wrongAnswers,
    int questionsAttempted,
    int rank,
    int? nextRankedUserPoints,
    int noOfUsers,
  });
}

/// @nodoc
class _$ProfileStatsModelCopyWithImpl<$Res, $Val extends ProfileStatsModel>
    implements $ProfileStatsModelCopyWith<$Res> {
  _$ProfileStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctAnswers = null,
    Object? score = null,
    Object? submissions = null,
    Object? wrongAnswers = null,
    Object? questionsAttempted = null,
    Object? rank = null,
    Object? nextRankedUserPoints = freezed,
    Object? noOfUsers = null,
  }) {
    return _then(
      _value.copyWith(
            correctAnswers: null == correctAnswers
                ? _value.correctAnswers
                : correctAnswers // ignore: cast_nullable_to_non_nullable
                      as int,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as int,
            submissions: null == submissions
                ? _value.submissions
                : submissions // ignore: cast_nullable_to_non_nullable
                      as int,
            wrongAnswers: null == wrongAnswers
                ? _value.wrongAnswers
                : wrongAnswers // ignore: cast_nullable_to_non_nullable
                      as int,
            questionsAttempted: null == questionsAttempted
                ? _value.questionsAttempted
                : questionsAttempted // ignore: cast_nullable_to_non_nullable
                      as int,
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int,
            nextRankedUserPoints: freezed == nextRankedUserPoints
                ? _value.nextRankedUserPoints
                : nextRankedUserPoints // ignore: cast_nullable_to_non_nullable
                      as int?,
            noOfUsers: null == noOfUsers
                ? _value.noOfUsers
                : noOfUsers // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatsModelImplCopyWith<$Res>
    implements $ProfileStatsModelCopyWith<$Res> {
  factory _$$StatsModelImplCopyWith(
    _$StatsModelImpl value,
    $Res Function(_$StatsModelImpl) then,
  ) = __$$StatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int correctAnswers,
    int score,
    int submissions,
    int wrongAnswers,
    int questionsAttempted,
    int rank,
    int? nextRankedUserPoints,
    int noOfUsers,
  });
}

/// @nodoc
class __$$StatsModelImplCopyWithImpl<$Res>
    extends _$ProfileStatsModelCopyWithImpl<$Res, _$StatsModelImpl>
    implements _$$StatsModelImplCopyWith<$Res> {
  __$$StatsModelImplCopyWithImpl(
    _$StatsModelImpl _value,
    $Res Function(_$StatsModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctAnswers = null,
    Object? score = null,
    Object? submissions = null,
    Object? wrongAnswers = null,
    Object? questionsAttempted = null,
    Object? rank = null,
    Object? nextRankedUserPoints = freezed,
    Object? noOfUsers = null,
  }) {
    return _then(
      _$StatsModelImpl(
        correctAnswers: null == correctAnswers
            ? _value.correctAnswers
            : correctAnswers // ignore: cast_nullable_to_non_nullable
                  as int,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        submissions: null == submissions
            ? _value.submissions
            : submissions // ignore: cast_nullable_to_non_nullable
                  as int,
        wrongAnswers: null == wrongAnswers
            ? _value.wrongAnswers
            : wrongAnswers // ignore: cast_nullable_to_non_nullable
                  as int,
        questionsAttempted: null == questionsAttempted
            ? _value.questionsAttempted
            : questionsAttempted // ignore: cast_nullable_to_non_nullable
                  as int,
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int,
        nextRankedUserPoints: freezed == nextRankedUserPoints
            ? _value.nextRankedUserPoints
            : nextRankedUserPoints // ignore: cast_nullable_to_non_nullable
                  as int?,
        noOfUsers: null == noOfUsers
            ? _value.noOfUsers
            : noOfUsers // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsModelImpl implements _StatsModel {
  _$StatsModelImpl({
    this.correctAnswers = 0,
    this.score = 0,
    this.submissions = 0,
    this.wrongAnswers = 0,
    this.questionsAttempted = 0,
    this.rank = 0,
    this.nextRankedUserPoints,
    this.noOfUsers = 0,
  });

  factory _$StatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsModelImplFromJson(json);

  @override
  @JsonKey()
  int correctAnswers;
  @override
  @JsonKey()
  int score;
  @override
  @JsonKey()
  int submissions;
  @override
  @JsonKey()
  int wrongAnswers;
  @override
  @JsonKey()
  int questionsAttempted;
  @override
  @JsonKey()
  int rank;
  @override
  int? nextRankedUserPoints;
  @override
  @JsonKey()
  int noOfUsers;

  @override
  String toString() {
    return 'ProfileStatsModel(correctAnswers: $correctAnswers, score: $score, submissions: $submissions, wrongAnswers: $wrongAnswers, questionsAttempted: $questionsAttempted, rank: $rank, nextRankedUserPoints: $nextRankedUserPoints, noOfUsers: $noOfUsers)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsModelImplCopyWith<_$StatsModelImpl> get copyWith =>
      __$$StatsModelImplCopyWithImpl<_$StatsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsModelImplToJson(this);
  }
}

abstract class _StatsModel implements ProfileStatsModel {
  factory _StatsModel({
    int correctAnswers,
    int score,
    int submissions,
    int wrongAnswers,
    int questionsAttempted,
    int rank,
    int? nextRankedUserPoints,
    int noOfUsers,
  }) = _$StatsModelImpl;

  factory _StatsModel.fromJson(Map<String, dynamic> json) =
      _$StatsModelImpl.fromJson;

  @override
  int get correctAnswers;
  set correctAnswers(int value);
  @override
  int get score;
  set score(int value);
  @override
  int get submissions;
  set submissions(int value);
  @override
  int get wrongAnswers;
  set wrongAnswers(int value);
  @override
  int get questionsAttempted;
  set questionsAttempted(int value);
  @override
  int get rank;
  set rank(int value);
  @override
  int? get nextRankedUserPoints;
  set nextRankedUserPoints(int? value);
  @override
  int get noOfUsers;
  set noOfUsers(int value);
  @override
  @JsonKey(ignore: true)
  _$$StatsModelImplCopyWith<_$StatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
