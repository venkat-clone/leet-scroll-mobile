// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streek_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreekModelImpl _$$StreekModelImplFromJson(Map<String, dynamic> json) =>
    _$StreekModelImpl(
      currentStreak: (json['currentStreak'] as num).toInt(),
      longestStreak: (json['longestStreak'] as num).toInt(),
      lastActivityDate: json['lastActivityDate'] == null
          ? null
          : DateTime.parse(json['lastActivityDate'] as String),
      todayActivity: json['todayActivity'] == null
          ? null
          : DailyActivityModel.fromJson(
              json['todayActivity'] as Map<String, dynamic>,
            ),
      dailyActivities: (json['dailyActivities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          DateTime.parse(k),
          DailyActivityModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );

Map<String, dynamic> _$$StreekModelImplToJson(_$StreekModelImpl instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'lastActivityDate': instance.lastActivityDate?.toIso8601String(),
      'todayActivity': instance.todayActivity,
      'dailyActivities': instance.dailyActivities.map(
        (k, e) => MapEntry(k.toIso8601String(), e),
      ),
    };
