import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/feed/data/question_model.dart';
import 'package:mobile/features/profile/data/models/attempts_history/attempts_history_model.dart';

part 'submission_model.freezed.dart';

part 'submission_model.g.dart';

@unfreezed
class SubmissionModel with _$SubmissionModel {
  factory SubmissionModel({
    required String id,
    required String userId,
    required String questionId,
    required int attempts,
    required int correctAttempts,
    required int noOfSkips,
    bool? lastCorrect,
    String? lastShownAt,
    String? submittedAt,
    required bool isCorrect,
    required String createdAt,
    required Question question,
    required List<AttemptsHistoryModel> attemptsHistory,
  }) = _SubmissionModel;

  factory SubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionModelFromJson(json);
}
