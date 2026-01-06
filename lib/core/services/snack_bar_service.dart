import 'package:flutter/material.dart';

import '../module/root_scaffold_messenger_key.dart';

class SnackBarService {
  // Singleton pattern
  static final SnackBarService _instance = SnackBarService._internal();
  factory SnackBarService() => _instance;
  SnackBarService._internal();

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      rootScaffoldKey;

  // Private helper to show any SnackBar with common styling
  void _show({
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 4),
    IconData? icon,
    SnackBarAction? action,
    EdgeInsetsGeometry? margin,
  }) {
    final messenger = _scaffoldMessengerKey.currentState;

    if (messenger == null || !messenger.mounted) return;

    try {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            backgroundColor: backgroundColor,
            duration: duration,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: margin ?? const EdgeInsets.fromLTRB(12, 0, 12, 24),
            action: action,
            dismissDirection: DismissDirection.down,
          ),
        );
    } catch (e, s) {
      debugPrint("Failed to Show Snack Bar Service");
      debugPrint("---" * 20);
      debugPrint("Message to Display: $message");
      debugPrintStack(label: e.toString(), stackTrace: s);
      debugPrint("---" * 20);
    }
  }

  // ───────────────────────────────────────────────────────────────
  // Public methods – clean and reusable
  // ───────────────────────────────────────────────────────────────

  void showSuccess({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      message: message,
      backgroundColor: Colors.green.shade700,
      duration: duration,
      icon: Icons.check_circle_outline,
    );
  }

  void showError({
    required String message,
    Duration duration = const Duration(seconds: 5),
    VoidCallback? onRetry,
  }) {
    _show(
      message: message,
      backgroundColor: Colors.red.shade800,
      duration: duration,
      icon: Icons.error_outline_rounded,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 32),
      action: onRetry != null
          ? SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: onRetry,
            )
          : null,
    );
  }

  void showInfo({
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _show(
      message: message,
      backgroundColor: Colors.blueGrey.shade700,
      duration: duration,
      icon: Icons.info_outline,
    );
  }

  void showWarning({
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _show(
      message: message,
      backgroundColor: Colors.orange.shade800,
      duration: duration,
      icon: Icons.warning_amber_outlined,
    );
  }

  void showNeutral({
    required String message,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    _show(
      message: message,
      backgroundColor: Colors.grey.shade800,
      duration: duration,
      action: action,
    );
  }

  // Generic custom SnackBar (maximum reusability)
  void showCustom({
    required String message,
    required Color backgroundColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    EdgeInsetsGeometry? margin,
  }) {
    _show(
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
      duration: duration,
      action: action,
      margin: margin,
    );
  }

  // Clear all SnackBars
  void clear() {
    _scaffoldMessengerKey.currentState?.clearSnackBars();
  }
}
