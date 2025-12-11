import 'dart:convert';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/injection.dart';
import 'package:mobile/core/models/session/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi()
abstract class IAuthRepository {
  factory IAuthRepository(Dio dio, {String? baseUrl}) = _IAuthRepository;

  @POST("/api")
  Future<UserModel> login(String email, String password);

  @POST("/api")
  Future<UserModel> register(String email, String password, String name);

  @GET("/auth/csrf")
  Future<dynamic> getCsrf();

  @POST("/auth/callback/credentials")
  @Headers({'Content-Type': 'application/x-www-form-urlencoded'})
  Future<dynamic> getCallback(@Body() Map<String, dynamic> body);

  @GET("/auth/session")
  Future<SessionModel> getSession();
}

@LazySingleton()
@injectable
class AuthRepository extends _IAuthRepository {
  AuthRepository(super.dio);

  Future<UserCredential> _signInWithGoogle() async {
    if (kIsWeb) {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithPopup(GoogleAuthProvider());
      return userCredential;
    } else {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      return userCredential;
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final UserCredential userCredential = await _signInWithGoogle();
      final String? idToken = await userCredential.user?.getIdToken();

      if (idToken == null) {
        throw Exception('Failed to get ID Token');
      }
      final csrf = await getCsrf();
      await getCallback({
        "idToken": idToken,
        "csrfToken": csrf["csrfToken"],
        "json": true,
      });

      final session = await getSession();
      _saveSession(session.user);
      return session.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveSession(UserModel user) async {
    await getIt<SharedPreferences>().setString(
      'user',
      jsonEncode(user.toJson()),
    );
  }

  Future<void> logout() async {
    await getIt<SharedPreferences>().clear();
  }

  Future<UserModel?> getUser() async {
    final userStr = getIt<SharedPreferences>().getString('user');
    if (userStr != null) {
      return UserModel.fromJson(jsonDecode(userStr));
    }
    return null;
  }
}
