import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(SharedPreferences prefs) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000/api', // Use 10.0.2.2 for Android Emulator
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

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

          return handler.next(options);
        },
      ),
    );
    
    return dio;
  }
}
