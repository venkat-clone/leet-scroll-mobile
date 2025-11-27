import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/leaderboard_repository.dart';
import 'leaderboard_state.dart';

@injectable
class LeaderboardCubit extends Cubit<LeaderboardState> {
  final ILeaderboardRepository _repository;

  LeaderboardCubit(this._repository) : super(const LeaderboardState.initial());

  Future<void> loadLeaderboard() async {
    emit(const LeaderboardState.loading());
    try {
      final entries = await _repository.getLeaderboard();
      emit(LeaderboardState.loaded(entries));
    } catch (e) {
      emit(LeaderboardState.error(e.toString()));
    }
  }
}
