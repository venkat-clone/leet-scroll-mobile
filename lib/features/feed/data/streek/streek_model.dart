import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/feed/data/daily_activity/daily_activity_model.dart';

part 'streek_model.freezed.dart';

part 'streek_model.g.dart';

@freezed
class StreekModel with _$StreekModel {
  factory StreekModel({
    required int currentStreak,
    required int longestStreak,
    DateTime? lastActivityDate,
    DailyActivityModel? todayActivity,

    required Map<DateTime, DailyActivityModel> dailyActivities,
  }) = _StreekModel;

  factory StreekModel.fromJson(Map<String, dynamic> json) =>
      _$StreekModelFromJson(json);
}
