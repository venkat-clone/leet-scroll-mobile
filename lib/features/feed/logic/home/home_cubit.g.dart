// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialImpl _$$InitialImplFromJson(Map<String, dynamic> json) =>
    _$InitialImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$InitialImplToJson(_$InitialImpl instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_$LoadedImpl _$$LoadedImplFromJson(Map<String, dynamic> json) => _$LoadedImpl(
  refreshing: json['refreshing'] as bool? ?? false,
  error: json['error'] as String? ?? null,
  data: json['data'] == null
      ? null
      : StreekModel.fromJson(json['data'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$LoadedImplToJson(_$LoadedImpl instance) =>
    <String, dynamic>{
      'refreshing': instance.refreshing,
      'error': instance.error,
      'data': instance.data,
      'runtimeType': instance.$type,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) =>
    _$ErrorImpl(json['error'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{'error': instance.error, 'runtimeType': instance.$type};

_$LoadingImpl _$$LoadingImplFromJson(Map<String, dynamic> json) =>
    _$LoadingImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$LoadingImplToJson(_$LoadingImpl instance) =>
    <String, dynamic>{'runtimeType': instance.$type};
