// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      stats: ProfileStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{'user': instance.user, 'stats': instance.stats};

_$ProfileStatsImpl _$$ProfileStatsImplFromJson(Map<String, dynamic> json) =>
    _$ProfileStatsImpl(
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      wrongAnswers: (json['wrongAnswers'] as num?)?.toInt() ?? 0,
      questionsAttempted: (json['questionsAttempted'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProfileStatsImplToJson(_$ProfileStatsImpl instance) =>
    <String, dynamic>{
      'correctAnswers': instance.correctAnswers,
      'wrongAnswers': instance.wrongAnswers,
      'questionsAttempted': instance.questionsAttempted,
    };
