import 'dart:io' show Platform;

import 'package:conectar_frontend/domain/models/token_decode/token_decode_model.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  final _accessTokenKey = 'ACCESS_TOKEN';
  final _refreshTokenKey = 'REFRESH_TOKEN';

  static bool get _isSecureStorageSupported {
    return !kIsWeb &&
        (Platform.isAndroid ||
            Platform.isIOS ||
            Platform.isMacOS ||
            Platform.isLinux);
  }

  static final _secureStorage =
      _isSecureStorageSupported ? const FlutterSecureStorage() : null;

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    if (_secureStorage != null) {
      await _secureStorage!.write(key: _accessTokenKey, value: accessToken);
      await _secureStorage!.write(key: _refreshTokenKey, value: refreshToken);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_accessTokenKey, accessToken);
      await prefs.setString(_refreshTokenKey, refreshToken);
    }
  }

  Future<String?> getAccessToken() async {
    if (_secureStorage != null) {
      return await _secureStorage!.read(key: _accessTokenKey);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_accessTokenKey);
    }
  }

  Future<bool> isAccessToken() async {
    final token = await getAccessToken();
    return token != null;
  }

  Future<String?> getRefreshToken() async {
    if (_secureStorage != null) {
      return await _secureStorage!.read(key: _refreshTokenKey);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_refreshTokenKey);
    }
  }

  Future<void> clearTokens() async {
    if (_secureStorage != null) {
      await _secureStorage!.delete(key: _accessTokenKey);
      await _secureStorage!.delete(key: _refreshTokenKey);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_accessTokenKey);
      await prefs.remove(_refreshTokenKey);
    }
  }

  Future<TokenDecode?> getJwtDecode() async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      return null;
    }

    final decoded = JWT.tryDecode(accessToken);

    return TokenDecode.fromJson(
      (decoded?.payload ?? {}) as Map<String, dynamic>,
    );
  }
}
