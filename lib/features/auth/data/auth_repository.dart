import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register(String email, String password, String name);

  Future<UserModel> signInWithGoogle();

  Future<void> logout();

  Future<UserModel?> getUser();
}

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final Dio _dio;
  final SharedPreferences _prefs;

  AuthRepository(this._dio, this._prefs);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/mobile/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final user = UserModel.fromJson(data['user']);
        await _saveSession(data['token'], user);
        return user;
      } else {
        throw Exception(response.data['error'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel> register(String email, String password, String name) async {
    try {
      final response = await _dio.post(
        '/register',
        data: {'email': email, 'password': password, 'name': name},
      );

      if (response.statusCode == 201) {
        // Assuming register returns same structure as login or just user
        // Adjust based on API. The original code returned response.data
        // If it auto-logins, it might return token.
        // For now, let's assume it returns user data and we might need to login separately
        // or it returns token.
        // Original code: return response.data;

        // If the API returns the created user:
        // return UserModel.fromJson(response.data['user']);

        // Let's assume it returns { user: ... }
        return UserModel.fromJson(response.data['user'] ?? response.data);
      } else {
        throw Exception(response.data['error'] ?? 'Registration failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

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

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final UserCredential userCredential = await _signInWithGoogle();
      final String? idToken = await userCredential.user?.getIdToken();

      if (idToken == null) {
        throw Exception('Failed to get ID Token');
      }

      final response = await _dio.post(
        '/mobile/login',
        data: {'idToken': idToken},
      );

      if ([200, 204].contains(response.statusCode)) {
        final data = response.data;
        final user = UserModel.fromJson(data['user']);
        await _saveSession(data['token'], user);
        return user;
      } else {
        throw Exception(response.data['error'] ?? 'Login failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveSession(String token, UserModel user) async {
    await _prefs.setString('token', token);
    await _prefs.setString('user', jsonEncode(user.toJson()));
  }

  @override
  Future<void> logout() async {
    await _prefs.clear();
  }

  @override
  Future<UserModel?> getUser() async {
    final userStr = _prefs.getString('user');
    if (userStr != null) {
      return UserModel.fromJson(jsonDecode(userStr));
    }
    return null;
  }
}
