import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

@module
abstract class NetworkModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(SharedPreferences prefs) {
    final dio = Dio(
      BaseOptions(
        baseUrl:
            // 'https://leet-scroll.vercel.app/api',
            'http://localhost:3000/api',

        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    final cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final userStr = prefs.getString('user');

          if (userStr != null) {
            // We need to parse it, but maybe we can just store token separately
            // For now, keep existing logic but be careful about jsonDecode import
          }

          final token = prefs.getString('token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          if (token != null) {
            // Replace Authorization header with Cookie
            options.headers['Cookie'] = 'next-auth.session-token=$token';
          }
          debugPrint('Request: ${options.method} ${options.path}');
          debugPrint('Headers: ${options.headers}');

          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}
