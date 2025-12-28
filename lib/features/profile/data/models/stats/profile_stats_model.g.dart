// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsModelImpl _$$StatsModelImplFromJson(Map<String, dynamic> json) =>
    _$StatsModelImpl(
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      score: (json['score'] as num?)?.toInt() ?? 0,
      submissions: (json['submissions'] as num?)?.toInt() ?? 0,
      wrongAnswers: (json['wrongAnswers'] as num?)?.toInt() ?? 0,
      questionsAttempted: (json['questionsAttempted'] as num?)?.toInt() ?? 0,
      rank: (json['rank'] as num?)?.toInt() ?? 0,
      nextRankedUserPoints: (json['nextRankedUserPoints'] as num?)?.toInt(),
      noOfUsers: (json['noOfUsers'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StatsModelImplToJson(_$StatsModelImpl instance) =>
    <String, dynamic>{
      'correctAnswers': instance.correctAnswers,
      'score': instance.score,
      'submissions': instance.submissions,
      'wrongAnswers': instance.wrongAnswers,
      'questionsAttempted': instance.questionsAttempted,
      'rank': instance.rank,
      'nextRankedUserPoints': instance.nextRankedUserPoints,
      'noOfUsers': instance.noOfUsers,
    };
