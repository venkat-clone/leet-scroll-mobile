import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_activity_model.freezed.dart';

part 'daily_activity_model.g.dart';

@unfreezed
class DailyActivityModel with _$DailyActivityModel {
  factory DailyActivityModel({
    String? id,
    String? userId,
    required DateTime date,
    required int totalAttempts,
    required int totalCorrect,
    required int totalSkips,
  }) = _DailyActivityModel;

  factory DailyActivityModel.fromJson(Map<String, dynamic> json) =>
      _$DailyActivityModelFromJson(json);
}
