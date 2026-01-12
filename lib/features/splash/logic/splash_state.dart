part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.checkingForUpdates() = _Initial;
  const factory SplashState.upToDate() = _UpToDate;
  const factory SplashState.downloadingPatch() = _DownloadingPatch;
  const factory SplashState.patchDownloaded() = _PatchDownloaded;
  const factory SplashState.error(String message) = _Error;
  const factory SplashState.skipUpdate() = _Skip;
}
