part of 'feed_cubit.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.initial() = _Initial;
  const factory FeedState.loading() = _Loading;
  const factory FeedState.loaded(
    List<Question> questions, {
    String? error,
    bool? loading,
    @Default(0) int questionIndex,
  }) = _Loaded;
  const factory FeedState.error(String message) = _Error;

  factory FeedState.fromJson(Map<String, dynamic> json) =>
      _$FeedStateFromJson(json);
}
