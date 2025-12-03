import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/auth_repository.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _repository;

  AuthCubit(this._repository) : super(const AuthState.initial());

  Future<void> checkAuth() async {
    try {
      final user = await _repository.getUser();
      if (user != null) {
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    try {
      final user = await _repository.login(email, password);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.loading());
    try {
      final user = await _repository.signInWithGoogle();
      emit(AuthState.authenticated(user));
    } on Exception catch (e,s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> register(String email, String password, String name) async {
    emit(const AuthState.loading());
    try {
      // If register logs in automatically
      // emit(AuthState.authenticated(user));
      // Or if it requires login
      emit(const AuthState.unauthenticated());
      // For now, let's assume we want to login after register or just show success
      // If we want to auto-login, we might need to call login or if API returns token
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    emit(const AuthState.unauthenticated());
  }
}
