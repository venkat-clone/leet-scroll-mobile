// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_preferences_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditPreferencesStateImpl _$$EditPreferencesStateImplFromJson(
  Map<String, dynamic> json,
) => _$EditPreferencesStateImpl(
  original: UserPreferencesModel.fromJson(
    json['original'] as Map<String, dynamic>,
  ),
  modified: UserPreferencesModel.fromJson(
    json['modified'] as Map<String, dynamic>,
  ),
  dropdownItems: (json['dropdownItems'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  dropdownStatus: $enumDecode(_$RequestStatusEnumMap, json['dropdownStatus']),
  isLoading: json['isLoading'] as bool,
  error: json['error'] as String?,
);

Map<String, dynamic> _$$EditPreferencesStateImplToJson(
  _$EditPreferencesStateImpl instance,
) => <String, dynamic>{
  'original': instance.original,
  'modified': instance.modified,
  'dropdownItems': instance.dropdownItems,
  'dropdownStatus': _$RequestStatusEnumMap[instance.dropdownStatus]!,
  'isLoading': instance.isLoading,
  'error': instance.error,
};

const _$RequestStatusEnumMap = {
  RequestStatus.initial: 'initial',
  RequestStatus.loading: 'loading',
  RequestStatus.success: 'success',
  RequestStatus.failure: 'failure',
};
