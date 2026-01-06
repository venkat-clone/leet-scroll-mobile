import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:injectable/injectable.dart';

import '../module/root_scaffold_messenger_key.dart';

@lazySingleton
class InternetService {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      rootScaffoldKey;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  // Track last known states to avoid redundant banners
  bool _wasOnline = false;
  bool _wasOffline = false;
  bool _isChecking = false;

  InternetService() {
    debugPrint("InternetService: service has started");
    _startListening();
  }

  Future<void> _startListening() async {
    final result = await Connectivity().checkConnectivity();
    debugPrint("InternetService: initial connectivity check result: $result");
    _handleConnectivityChange(result);
    // Listen for real-time changes
    _subscription = Connectivity().onConnectivityChanged.listen((
      results,
    ) async {
      debugPrint("InternetService: onConnectivityChanged");
      await _handleConnectivityChange(results);
    });
  }

  Future<void> _handleConnectivityChange(
    List<ConnectivityResult> results,
  ) async {
    final messenger = scaffoldMessengerKey.currentState;

    if (messenger == null) {
      debugPrint("InternetService: ScaffoldMessenger not found");
      return;
    }

    // Always clear any existing banner first
    messenger
        .hideCurrentMaterialBanner(); // Recommended over removeCurrentMaterialBanner
    messenger.removeCurrentMaterialBanner();

    // If completely offline (no cellular/WiFi)
    if (results.contains(ConnectivityResult.none)) {
      debugPrint("InternetService: No network connection");
      _showOfflineBanner(messenger);
      _wasOnline = false;
      _wasOffline = false;
      _isChecking = false;
      return;
    } else {
      debugPrint("InternetService: Network connection available");
    }

    // We have at least one network interface active
    if (!_isChecking) {
      _showCheckingBanner(messenger);
      _isChecking = true;
    }

    final hasInternet = await _hasRealInternet();

    _isChecking = false;
    messenger.hideCurrentMaterialBanner();
    messenger.removeCurrentMaterialBanner();

    if (hasInternet) {
      if (!_wasOnline && _wasOffline) {
        _showOnlineRestoredBanner(messenger);
        _wasOnline = true;
      }
      // Already online → stay silent
    } else {
      _showNoInternetBanner(messenger);
      _wasOffline = true;
      _wasOnline = false;
    }
  }

  /// Checks actual internet reachability by pinging a reliable DNS server
  Future<bool> _hasRealInternet() async {
    try {
      // 1.1.1.1 (Cloudflare) and 8.8.8.8 (Google) are very reliable
      final List<String> hosts = ['1.1.1.1', '8.8.8.8'];
      for (final host in hosts) {
        try {
          final result = await InternetAddress.lookup(
            host,
          ).timeout(const Duration(seconds: 4));
          if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
            return true;
          }
        } catch (_) {
          continue;
        }
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  void _showOfflineBanner(ScaffoldMessengerState messenger) {
    messenger.showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'No network connection',
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.signal_wifi_off, color: Colors.white),
        backgroundColor: Colors.redAccent,
        actions: [
          TextButton(
            onPressed: () {
              try {
                messenger.hideCurrentMaterialBanner();
                messenger.removeCurrentMaterialBanner();
                _checkAndUpdateStatus();
              } catch (e, s) {
                debugPrint(e.toString());
                debugPrintStack(stackTrace: s);
              }
            },
            child: const Text('RETRY', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showCheckingBanner(ScaffoldMessengerState messenger) {
    messenger.showMaterialBanner(
      MaterialBanner(
        content: const Row(
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Checking internet connection...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const Icon(Icons.wifi_find, color: Colors.white),
        backgroundColor: Colors.blueGrey,
        actions: const [],
      ),
    );
  }

  void _showNoInternetBanner(ScaffoldMessengerState messenger) {
    messenger.showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Connected to network — no internet access',
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.wifi_off, color: Colors.white),
        backgroundColor: Colors.orange[700]!,
        actions: [
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
              messenger.removeCurrentMaterialBanner();
              _checkAndUpdateStatus();
            },
            child: const Text('RETRY', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
              messenger.removeCurrentMaterialBanner();
            },
            child: const Text('DISMISS', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showOnlineRestoredBanner(ScaffoldMessengerState messenger) {
    messenger.showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Internet connection restored ✓',
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.check_circle, color: Colors.white),
        backgroundColor: Colors.green[700]!,
        actions: [
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
              messenger.removeCurrentMaterialBanner();
            },
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    // Auto-dismiss after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (messenger.mounted) {
        messenger.hideCurrentMaterialBanner();
        messenger.removeCurrentMaterialBanner();
      }
    });
  }

  Future<void> _checkAndUpdateStatus() async {
    final result = await Connectivity().checkConnectivity();
    // connectivity_plus returns List on newer versions, handle both cases
    final List<ConnectivityResult> results = result;
    await _handleConnectivityChange(results);
  }

  @disposeMethod
  void dispose() {
    _subscription?.cancel();
  }
}
