part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loaded({
    @Default(false) bool refreshing,
    @Default(null) String? error,
    @Default(null) StreekModel? data,
  }) = _Loaded;

  const factory HomeState.error(String error) = _Error;
  const factory HomeState.loading() = _Loading;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
