import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_model.freezed.dart';
part 'leaderboard_model.g.dart';

@freezed
class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    required String id,
    String? name,
    required int score,
    @Default(0) int problemsSolved,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);
}
