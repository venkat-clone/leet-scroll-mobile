import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_stats_model.freezed.dart';

part 'profile_stats_model.g.dart';

@unfreezed
class ProfileStatsModel with _$ProfileStatsModel {
  factory ProfileStatsModel({
    @Default(0) int correctAnswers,
    @Default(0) int score,
    @Default(0) int submissions,
    @Default(0) int wrongAnswers,
    @Default(0) int questionsAttempted,
    @Default(0) int rank,
    int? nextRankedUserPoints,
    @Default(0) int noOfUsers,
  }) = _StatsModel;

  factory ProfileStatsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatsModelFromJson(json);
}

extension ProfileStatsModelX on ProfileStatsModel {
  int percentile() {
    final percentile = (rank / (noOfUsers)) * 100;
    return percentile.toInt();
  }
}
