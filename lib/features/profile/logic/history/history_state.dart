part of 'history_cubit.dart';

@freezed
class HistoryState with _$HistoryState {
  // No data
  factory HistoryState.initial() = _Initial;
  factory HistoryState.loading() = _Loading;
  factory HistoryState.loaded({
    required bool isLoading,
    required bool isError,
    required int page,
    required String filter,
    required String search,
    required bool hasMore,
    required List<SubmissionModel> history,
    String? errorMsg,
  }) = _Loaded;

  factory HistoryState.error(String errorMsg) = _Error;
}
