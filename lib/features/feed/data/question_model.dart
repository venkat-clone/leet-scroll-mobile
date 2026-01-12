import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String id,
    required String title,
    required String description,
    required List<String> options,
    required int correctOption,
    String? explanation,
    required String difficulty,
    required String category,
    required List<String> tags,
    int? viewsCount,
    int? likesCount,
    int? commentsCount,
    int? matchingTagsCount,
    int? priority,
    int? userRanking,
    int? interestedTagsCount,
    String? codeSnippet,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
