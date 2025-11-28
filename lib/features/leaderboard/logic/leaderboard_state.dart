import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/leaderboard_model.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState.initial() = _Initial;
  const factory LeaderboardState.loading() = _Loading;
  const factory LeaderboardState.loaded(List<LeaderboardEntry> entries) =
      _Loaded;
  const factory LeaderboardState.error(String message) = _Error;
}
