import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.checkingForUpdates());

  Future<void> checkForUpdates() async {
    try {
      final updater = ShorebirdUpdater();

      final updateState = await updater.checkForUpdate();
      switch (updateState) {
        case UpdateStatus.upToDate:
          emit(SplashState.upToDate());
        case UpdateStatus.outdated:
          emit(SplashState.downloadingPatch());
          await updater.update();
          emit(SplashState.patchDownloaded());
        case UpdateStatus.restartRequired:
          emit(SplashState.patchDownloaded());
        case UpdateStatus.unavailable:
          emit(SplashState.skipUpdate());
      }
      return;
    } catch (e) {
      emit(SplashState.error(e.toString()));
    } finally {
      await Future.delayed(Duration(seconds: 2));
      emit(SplashState.skipUpdate());
    }
  }
}
