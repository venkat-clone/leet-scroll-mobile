import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile/core/services/patch_service.dart';

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Request permissions (important for iOS)
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
    if (Platform.isIOS) {
      String? apnsToken = await _firebaseMessaging.getAPNSToken();

      // If null (not ready yet), wait and retry a few times
      int retries = 0;
      while (apnsToken == null && retries < 5) {
        await Future.delayed(const Duration(seconds: 2));
        apnsToken = await _firebaseMessaging.getAPNSToken();
        retries++;
      }

      if (apnsToken == null) {
        debugPrint("Warning: APNs token still null after retries");
        // You can still proceed, but notifications might be delayed
      }
    }
    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint("FCM Token $fcmToken");

    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS (Darwin) initialization
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    // Combined initialization settings
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
          macOS: initializationSettingsDarwin,
        );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Allow heads-up notifications on iOS when app is in foreground
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(
        "Firebase Notification Received from FirebaseMessaging.onMessage.listen",
      );
      if (message.notification != null) {
        _showNotification(message, true);
      }
    });

    // Background/terminated handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _handleFirebaseActions(RemoteMessage message) async {
  final String? action = message.data["action"];
  if (action == null) {
    return;
  }

  switch (action) {
    case "shorebird_patch":
      debugPrint("Patching the app");
      PatchService().startPatch();
      break;
    default:
      debugPrint("Unknown action: $action");
  }
}

Future<void> _showNotification(
  RemoteMessage message, [
  bool showNotification = false,
]) async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  // Create the channel on Android
  await _flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  RemoteNotification? notification = message.notification;

  _handleFirebaseActions(message);

  if (notification != null && showNotification) {
    debugPrint("Showing Notification");
    _flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: '@mipmap/ic_launcher', // Use a valid small icon
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint(
    "Firebase Notification Received from _firebaseMessagingBackgroundHandler",
  );
  await Firebase.initializeApp();
  await _showNotification(message, false);
}
