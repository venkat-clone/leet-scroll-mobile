// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesModelImpl _$$UserPreferencesModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserPreferencesModelImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  preferredDifficulties: (json['preferredDifficulties'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  preferredTopics: (json['preferredTopics'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  interestedTopics: (json['interestedTopics'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  feedSize: (json['feedSize'] as num).toInt(),
  preferredLanguages: (json['preferredLanguages'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$UserPreferencesModelImplToJson(
  _$UserPreferencesModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'preferredDifficulties': instance.preferredDifficulties,
  'preferredTopics': instance.preferredTopics,
  'interestedTopics': instance.interestedTopics,
  'feedSize': instance.feedSize,
  'preferredLanguages': instance.preferredLanguages,
};
