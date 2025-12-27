// ignore_for_file: dead_code

import 'package:flutter/foundation.dart';

class AppConfig {
  static String get baseUrl {
    if (kDebugMode || kProfileMode) {
      // return 'http://localhost:3000/api';
      return 'http://192.168.31.240:3000/api';
      return 'https://configxleetscroll.vercel.app/api';
    }

    return 'https://leet-scroll.vercel.app/api';
  }
}
