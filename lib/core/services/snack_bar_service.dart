import 'package:flutter/material.dart';

class SnackBarService {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  SnackBarService(this._scaffoldMessengerKey);

  // ───────────────────────────────────────────────────────────────
  // Basic show message
  // ───────────────────────────────────────────────────────────────
  void showSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    final messenger = _scaffoldMessengerKey.currentState;

    if (messenger == null) return;
    if (!messenger.mounted) return;
    if (!messenger.context.mounted) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 24),
        ),
      );
  }

  // ───────────────────────────────────────────────────────────────
  // Success variant
  // ───────────────────────────────────────────────────────────────
  void showSuccess({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = _scaffoldMessengerKey.currentState;
    if (messenger == null) return;

    if (!messenger.mounted) return;
    if (!messenger.context.mounted) return;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text(message)),
            ],
          ),
          backgroundColor: Colors.green.shade700,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 24),
        ),
      );
  }

  // ───────────────────────────────────────────────────────────────
  // Error variant (most used in error handlers)
  // ───────────────────────────────────────────────────────────────
  void showError({
    required String message,
    Duration duration = const Duration(seconds: 5),
    VoidCallback? onRetry,
  }) {
    final messenger = _scaffoldMessengerKey.currentState;
    if (messenger == null) return;

    if (!messenger.mounted) return;
    if (!messenger.context.mounted) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline_rounded, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text(message)),
            ],
          ),
          backgroundColor: Colors.red.shade800,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 32),
          action: onRetry != null
              ? SnackBarAction(
                  label: 'Retry',
                  textColor: Colors.white,
                  onPressed: onRetry,
                )
              : null,
        ),
      );
  }

  // ───────────────────────────────────────────────────────────────
  // Info / neutral message
  // ───────────────────────────────────────────────────────────────
  void showInfo({
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    final messenger = _scaffoldMessengerKey.currentState;
    if (messenger == null) return;

    if (!messenger.mounted) return;
    if (!messenger.context.mounted) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.blueGrey.shade700,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }

  // ───────────────────────────────────────────────────────────────
  // Clear all current snackbars
  // ───────────────────────────────────────────────────────────────
  void clear() {
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }
}
