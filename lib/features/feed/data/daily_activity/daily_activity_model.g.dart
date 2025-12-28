// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyActivityModelImpl _$$DailyActivityModelImplFromJson(
  Map<String, dynamic> json,
) => _$DailyActivityModelImpl(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  date: DateTime.parse(json['date'] as String),
  totalAttempts: (json['totalAttempts'] as num).toInt(),
  totalCorrect: (json['totalCorrect'] as num).toInt(),
  totalSkips: (json['totalSkips'] as num).toInt(),
);

Map<String, dynamic> _$$DailyActivityModelImplToJson(
  _$DailyActivityModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'date': instance.date.toIso8601String(),
  'totalAttempts': instance.totalAttempts,
  'totalCorrect': instance.totalCorrect,
  'totalSkips': instance.totalSkips,
};
