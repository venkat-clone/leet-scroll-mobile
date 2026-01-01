// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempts_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttemptsHistoryModelImpl _$$AttemptsHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$AttemptsHistoryModelImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  questionId: json['questionId'] as String,
  selectedOption: json['selectedOption'] as String,
  isCorrect: json['isCorrect'] as bool,
  attemptedAt: json['attemptedAt'] as String,
);

Map<String, dynamic> _$$AttemptsHistoryModelImplToJson(
  _$AttemptsHistoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'questionId': instance.questionId,
  'selectedOption': instance.selectedOption,
  'isCorrect': instance.isCorrect,
  'attemptedAt': instance.attemptedAt,
};
