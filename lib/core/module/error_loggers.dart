import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/services/snack_bar_service.dart';

class ErrorLoggers {
  ErrorLoggers(this._snackBarService);
  final fatalError = true;
  final SnackBarService _snackBarService;

  void onError(errorDetails) {
    _snackBarService.showError(message: errorDetails.exceptionAsString());

    if (kDebugMode) {
      debugPrint("Exception Caught at ErrorLoggers.onError");
      debugPrintStack(stackTrace: errorDetails.stack);
      debugPrint(errorDetails.exceptionAsString());
      return;
    }
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  }

  bool onErrorAsync(Object error, StackTrace stack) {
    _snackBarService.showError(message: error.toString());
    if (kDebugMode) {
      debugPrint("Exception Caught at ErrorLoggers.onErrorAsync");
      debugPrintStack(stackTrace: stack);
      debugPrint(error.toString());
      return true;
    }
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  }
}
