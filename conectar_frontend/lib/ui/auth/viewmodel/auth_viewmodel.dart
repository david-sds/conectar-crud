import 'package:conectar_frontend/data/repositories/auth_repository.dart';
import 'package:conectar_frontend/domain/models/credentials/credentials_model.dart';
import 'package:flutter/material.dart';

class AuthViewmodel extends ChangeNotifier {
  final authRepository = AuthRepository();

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  void setIsLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  Future<bool> login(Credentials credentials) async {
    try {
      final email = credentials.email;
      final password = credentials.password;

      if (email == null || password == null) {
        return false;
      }

      final isLoggedIn = await authRepository.login(
        email: email,
        password: password,
      );

      if (!isLoggedIn) {
        return false;
      }

      setIsLoggedIn(true);

      return true;
    } catch (e) {
      debugPrint('Error while logging in => $e');
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      final isLoggedOut = await authRepository.logout();

      if (!isLoggedOut) {
        return false;
      }

      setIsLoggedIn(false);

      return true;
    } catch (e) {
      debugPrint('Error while logging out => $e');
    }
    return false;
  }
}
