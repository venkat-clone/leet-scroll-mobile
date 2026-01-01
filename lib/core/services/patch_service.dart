import 'package:flutter/material.dart';
import 'package:mobile/core/services/snack_bar_service.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

// ShoreBirds Patch Service to patch the Apk

class PatchService {
  final updater = ShorebirdUpdater();

  void startPatch() async {
    try {
      final updateStatus = await updater.checkForUpdate();
      final snackBarService = SnackBarService();
      debugPrint(updateStatus.toString());
      switch (updateStatus) {
        case UpdateStatus.upToDate:
          break;
        case UpdateStatus.outdated:
          await updater.update();
          _askRestart(snackBarService);
        case UpdateStatus.restartRequired:
          _askRestart(snackBarService);
        case UpdateStatus.unavailable:
          snackBarService.showError(
            message: "Please reinstall the app to latest version.",
          );
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s, label: e.toString());
    }
  }

  void _askRestart(SnackBarService snackBarService) {
    snackBarService.showCustom(
      message: "A new update is ready! Please restart the app.",
      backgroundColor: Colors.green,
      icon: Icons.check_circle_outline,
      action: SnackBarAction(label: 'Restart Now', onPressed: () {}),
    );
  }
}
