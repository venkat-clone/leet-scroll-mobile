import 'package:freezed_annotation/freezed_annotation.dart';

part 'attempts_history_model.freezed.dart';

part 'attempts_history_model.g.dart';

@unfreezed
class AttemptsHistoryModel with _$AttemptsHistoryModel {
  factory AttemptsHistoryModel({
    required String id,
    required String userId,
    required String questionId,
    required String selectedOption,
    required bool isCorrect,
    required String attemptedAt,
  }) = _AttemptsHistoryModel;

  factory AttemptsHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$AttemptsHistoryModelFromJson(json);
}
