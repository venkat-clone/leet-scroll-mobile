import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import '../app_config/app_config.dart';

@module
abstract class NetworkModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(SharedPreferences prefs) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    getApplicationDocumentsDirectory().then((dir) {
      final cookieJar = PersistCookieJar(
        ignoreExpires: true,
        storage: FileStorage("${dir.path}/.cookies/"),
      );

      dio.interceptors.add(CookieManager(cookieJar));
    });

    dio.interceptors.add(RetryInterceptor(dio: dio));
    dio.interceptors.add(
      LogInterceptor(requestHeader: false, responseHeader: false),
    );

    return dio;
  }
}
