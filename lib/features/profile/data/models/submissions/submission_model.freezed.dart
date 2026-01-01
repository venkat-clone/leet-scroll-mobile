// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubmissionModel _$SubmissionModelFromJson(Map<String, dynamic> json) {
  return _SubmissionModel.fromJson(json);
}

/// @nodoc
mixin _$SubmissionModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  set questionId(String value) => throw _privateConstructorUsedError;
  int get attempts => throw _privateConstructorUsedError;
  set attempts(int value) => throw _privateConstructorUsedError;
  int get correctAttempts => throw _privateConstructorUsedError;
  set correctAttempts(int value) => throw _privateConstructorUsedError;
  int get noOfSkips => throw _privateConstructorUsedError;
  set noOfSkips(int value) => throw _privateConstructorUsedError;
  bool? get lastCorrect => throw _privateConstructorUsedError;
  set lastCorrect(bool? value) => throw _privateConstructorUsedError;
  String? get lastShownAt => throw _privateConstructorUsedError;
  set lastShownAt(String? value) => throw _privateConstructorUsedError;
  String? get submittedAt => throw _privateConstructorUsedError;
  set submittedAt(String? value) => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  set isCorrect(bool value) => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  set createdAt(String value) => throw _privateConstructorUsedError;
  Question get question => throw _privateConstructorUsedError;
  set question(Question value) => throw _privateConstructorUsedError;
  List<AttemptsHistoryModel> get attemptsHistory =>
      throw _privateConstructorUsedError;
  set attemptsHistory(List<AttemptsHistoryModel> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmissionModelCopyWith<SubmissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionModelCopyWith<$Res> {
  factory $SubmissionModelCopyWith(
    SubmissionModel value,
    $Res Function(SubmissionModel) then,
  ) = _$SubmissionModelCopyWithImpl<$Res, SubmissionModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    String questionId,
    int attempts,
    int correctAttempts,
    int noOfSkips,
    bool? lastCorrect,
    String? lastShownAt,
    String? submittedAt,
    bool isCorrect,
    String createdAt,
    Question question,
    List<AttemptsHistoryModel> attemptsHistory,
  });

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class _$SubmissionModelCopyWithImpl<$Res, $Val extends SubmissionModel>
    implements $SubmissionModelCopyWith<$Res> {
  _$SubmissionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? questionId = null,
    Object? attempts = null,
    Object? correctAttempts = null,
    Object? noOfSkips = null,
    Object? lastCorrect = freezed,
    Object? lastShownAt = freezed,
    Object? submittedAt = freezed,
    Object? isCorrect = null,
    Object? createdAt = null,
    Object? question = null,
    Object? attemptsHistory = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            questionId: null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                      as String,
            attempts: null == attempts
                ? _value.attempts
                : attempts // ignore: cast_nullable_to_non_nullable
                      as int,
            correctAttempts: null == correctAttempts
                ? _value.correctAttempts
                : correctAttempts // ignore: cast_nullable_to_non_nullable
                      as int,
            noOfSkips: null == noOfSkips
                ? _value.noOfSkips
                : noOfSkips // ignore: cast_nullable_to_non_nullable
                      as int,
            lastCorrect: freezed == lastCorrect
                ? _value.lastCorrect
                : lastCorrect // ignore: cast_nullable_to_non_nullable
                      as bool?,
            lastShownAt: freezed == lastShownAt
                ? _value.lastShownAt
                : lastShownAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            submittedAt: freezed == submittedAt
                ? _value.submittedAt
                : submittedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCorrect: null == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as Question,
            attemptsHistory: null == attemptsHistory
                ? _value.attemptsHistory
                : attemptsHistory // ignore: cast_nullable_to_non_nullable
                      as List<AttemptsHistoryModel>,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubmissionModelImplCopyWith<$Res>
    implements $SubmissionModelCopyWith<$Res> {
  factory _$$SubmissionModelImplCopyWith(
    _$SubmissionModelImpl value,
    $Res Function(_$SubmissionModelImpl) then,
  ) = __$$SubmissionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String questionId,
    int attempts,
    int correctAttempts,
    int noOfSkips,
    bool? lastCorrect,
    String? lastShownAt,
    String? submittedAt,
    bool isCorrect,
    String createdAt,
    Question question,
    List<AttemptsHistoryModel> attemptsHistory,
  });

  @override
  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$$SubmissionModelImplCopyWithImpl<$Res>
    extends _$SubmissionModelCopyWithImpl<$Res, _$SubmissionModelImpl>
    implements _$$SubmissionModelImplCopyWith<$Res> {
  __$$SubmissionModelImplCopyWithImpl(
    _$SubmissionModelImpl _value,
    $Res Function(_$SubmissionModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? questionId = null,
    Object? attempts = null,
    Object? correctAttempts = null,
    Object? noOfSkips = null,
    Object? lastCorrect = freezed,
    Object? lastShownAt = freezed,
    Object? submittedAt = freezed,
    Object? isCorrect = null,
    Object? createdAt = null,
    Object? question = null,
    Object? attemptsHistory = null,
  }) {
    return _then(
      _$SubmissionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        questionId: null == questionId
            ? _value.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String,
        attempts: null == attempts
            ? _value.attempts
            : attempts // ignore: cast_nullable_to_non_nullable
                  as int,
        correctAttempts: null == correctAttempts
            ? _value.correctAttempts
            : correctAttempts // ignore: cast_nullable_to_non_nullable
                  as int,
        noOfSkips: null == noOfSkips
            ? _value.noOfSkips
            : noOfSkips // ignore: cast_nullable_to_non_nullable
                  as int,
        lastCorrect: freezed == lastCorrect
            ? _value.lastCorrect
            : lastCorrect // ignore: cast_nullable_to_non_nullable
                  as bool?,
        lastShownAt: freezed == lastShownAt
            ? _value.lastShownAt
            : lastShownAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        submittedAt: freezed == submittedAt
            ? _value.submittedAt
            : submittedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCorrect: null == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as Question,
        attemptsHistory: null == attemptsHistory
            ? _value.attemptsHistory
            : attemptsHistory // ignore: cast_nullable_to_non_nullable
                  as List<AttemptsHistoryModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmissionModelImpl implements _SubmissionModel {
  _$SubmissionModelImpl({
    required this.id,
    required this.userId,
    required this.questionId,
    required this.attempts,
    required this.correctAttempts,
    required this.noOfSkips,
    this.lastCorrect,
    this.lastShownAt,
    this.submittedAt,
    required this.isCorrect,
    required this.createdAt,
    required this.question,
    required this.attemptsHistory,
  });

  factory _$SubmissionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmissionModelImplFromJson(json);

  @override
  String id;
  @override
  String userId;
  @override
  String questionId;
  @override
  int attempts;
  @override
  int correctAttempts;
  @override
  int noOfSkips;
  @override
  bool? lastCorrect;
  @override
  String? lastShownAt;
  @override
  String? submittedAt;
  @override
  bool isCorrect;
  @override
  String createdAt;
  @override
  Question question;
  @override
  List<AttemptsHistoryModel> attemptsHistory;

  @override
  String toString() {
    return 'SubmissionModel(id: $id, userId: $userId, questionId: $questionId, attempts: $attempts, correctAttempts: $correctAttempts, noOfSkips: $noOfSkips, lastCorrect: $lastCorrect, lastShownAt: $lastShownAt, submittedAt: $submittedAt, isCorrect: $isCorrect, createdAt: $createdAt, question: $question, attemptsHistory: $attemptsHistory)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionModelImplCopyWith<_$SubmissionModelImpl> get copyWith =>
      __$$SubmissionModelImplCopyWithImpl<_$SubmissionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmissionModelImplToJson(this);
  }
}

abstract class _SubmissionModel implements SubmissionModel {
  factory _SubmissionModel({
    required String id,
    required String userId,
    required String questionId,
    required int attempts,
    required int correctAttempts,
    required int noOfSkips,
    bool? lastCorrect,
    String? lastShownAt,
    String? submittedAt,
    required bool isCorrect,
    required String createdAt,
    required Question question,
    required List<AttemptsHistoryModel> attemptsHistory,
  }) = _$SubmissionModelImpl;

  factory _SubmissionModel.fromJson(Map<String, dynamic> json) =
      _$SubmissionModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get userId;
  set userId(String value);
  @override
  String get questionId;
  set questionId(String value);
  @override
  int get attempts;
  set attempts(int value);
  @override
  int get correctAttempts;
  set correctAttempts(int value);
  @override
  int get noOfSkips;
  set noOfSkips(int value);
  @override
  bool? get lastCorrect;
  set lastCorrect(bool? value);
  @override
  String? get lastShownAt;
  set lastShownAt(String? value);
  @override
  String? get submittedAt;
  set submittedAt(String? value);
  @override
  bool get isCorrect;
  set isCorrect(bool value);
  @override
  String get createdAt;
  set createdAt(String value);
  @override
  Question get question;
  set question(Question value);
  @override
  List<AttemptsHistoryModel> get attemptsHistory;
  set attemptsHistory(List<AttemptsHistoryModel> value);
  @override
  @JsonKey(ignore: true)
  _$$SubmissionModelImplCopyWith<_$SubmissionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
