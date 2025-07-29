import 'package:conectar_frontend/data/repositories/auth_repository.dart';
import 'package:conectar_frontend/data/repositories/users_repository.dart';
import 'package:conectar_frontend/domain/models/credentials/credentials_model.dart';
import 'package:conectar_frontend/domain/models/token_decode/token_decode_model.dart';
import 'package:conectar_frontend/domain/models/user_details/user_details_model.dart';
import 'package:flutter/material.dart';

class AuthViewmodel extends ChangeNotifier {
  AuthViewmodel({
    required AuthRepository authRepository,
    required UsersRepository usersRepository,
  })  : _authRepository = authRepository,
        _usersRepository = usersRepository;

  final AuthRepository _authRepository;
  final UsersRepository _usersRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  void setIsLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  UserDetails? _loggedUser;
  UserDetails? get loggedUser => _loggedUser;
  void setLoggedUser(UserDetails? value) {
    _loggedUser = value;
    notifyListeners();
  }

  Future<bool> login(Credentials credentials) async {
    try {
      final email = credentials.email;
      final password = credentials.password;

      if (email == null || password == null) {
        return false;
      }

      final isLoggedIn = await _authRepository.login(
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
      final isLoggedOut = await _authRepository.logout();

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

  Future<UserDetails?> findMe() async {
    try {
      setIsLoading(true);

      final response = await _usersRepository.findMe();

      setLoggedUser(response);

      return response;
    } catch (e) {
      debugPrint('Error while finding me UsersViewmodel => $e');
    } finally {
      setIsLoading(false);
    }
    return null;
  }

  Future<bool> changePassword(String newPassword) async {
    try {
      final isLoggedIn = await _authRepository.changePassword(
        newPassword,
      );

      if (!isLoggedIn) {
        return false;
      }

      setIsLoggedIn(true);

      return true;
    } catch (e) {
      debugPrint('Error while changing password => $e');
    }
    return false;
  }

  TokenDecode? _tokenDecode;
  TokenDecode? get tokenDecode => _tokenDecode;
  void setTokenDecode(TokenDecode? value) {
    _tokenDecode = value;
    _isLoggedIn = value != null;
    notifyListeners();
  }

  Future<TokenDecode?> loadTokenDecode() async {
    final tokenDecode = await _authRepository.getTokenDecode();

    _tokenDecode = tokenDecode;
    notifyListeners();

    return tokenDecode;
  }
}
