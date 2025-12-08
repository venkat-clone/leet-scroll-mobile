// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardEntryImpl _$$LeaderboardEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardEntryImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      score: (json['score'] as num).toInt(),
      problemsSolved: (json['problemsSolved'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeaderboardEntryImplToJson(
        _$LeaderboardEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
      'problemsSolved': instance.problemsSolved,
    };
