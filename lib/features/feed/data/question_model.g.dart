// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctOption: (json['correctOption'] as num).toInt(),
      explanation: json['explanation'] as String?,
      difficulty: json['difficulty'] as String,
      category: json['category'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      codeSnippet: json['codeSnippet'] as String?,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'options': instance.options,
      'correctOption': instance.correctOption,
      'explanation': instance.explanation,
      'difficulty': instance.difficulty,
      'category': instance.category,
      'tags': instance.tags,
      'codeSnippet': instance.codeSnippet,
    };
