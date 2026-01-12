// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionModelImpl _$$SubmissionModelImplFromJson(
  Map<String, dynamic> json,
) => _$SubmissionModelImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  questionId: json['questionId'] as String,
  attempts: (json['attempts'] as num).toInt(),
  correctAttempts: (json['correctAttempts'] as num).toInt(),
  noOfSkips: (json['noOfSkips'] as num).toInt(),
  lastCorrect: json['lastCorrect'] as bool?,
  lastShownAt: json['lastShownAt'] as String?,
  submittedAt: json['submittedAt'] as String?,
  isCorrect: json['isCorrect'] as bool,
  createdAt: json['createdAt'] as String,
  question: Question.fromJson(json['question'] as Map<String, dynamic>),
  attemptsHistory: (json['attemptsHistory'] as List<dynamic>)
      .map((e) => AttemptsHistoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$SubmissionModelImplToJson(
  _$SubmissionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'questionId': instance.questionId,
  'attempts': instance.attempts,
  'correctAttempts': instance.correctAttempts,
  'noOfSkips': instance.noOfSkips,
  'lastCorrect': instance.lastCorrect,
  'lastShownAt': instance.lastShownAt,
  'submittedAt': instance.submittedAt,
  'isCorrect': instance.isCorrect,
  'createdAt': instance.createdAt,
  'question': instance.question,
  'attemptsHistory': instance.attemptsHistory,
};
