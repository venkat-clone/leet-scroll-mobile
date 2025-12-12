// ignore_for_file: dead_code

import 'package:flutter/foundation.dart';

class AppConfig {
  static String get baseUrl {
    if (kDebugMode) {
      return 'http://localhost:3000/api';
      return 'https://configxleetscroll.vercel.app/api';
    }

    return 'https://leet-scroll.vercel.app/api';
  }
}
