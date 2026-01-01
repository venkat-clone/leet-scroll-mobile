// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      stats: ProfileStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
      preferences: UserPreferencesModel.fromJson(
        json['preferences'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'stats': instance.stats,
      'preferences': instance.preferences,
    };
