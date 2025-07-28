import 'package:conectar_frontend/data/services/http_client_service.dart';
import 'package:conectar_frontend/data/services/token_service.dart';
import 'package:dio/dio.dart';

final _tokenService = TokenService();

class AuthRepository {
  final Dio _dio = Dio(baseOptions.copyWith())..interceptors.clear();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      return false;
    }

    final accessToken = response.data['accessToken'];
    final refreshToken = response.data['refreshToken'];

    if (accessToken == null || refreshToken == null) {
      return false;
    }

    await _tokenService.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );

    return true;
  }

  Future<bool> logout() async {
    final accessToken = await _tokenService.getAccessToken();

    if (accessToken == null) {
      return false;
    }

    final response = await _dio.post(
      '/auth/logout',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    final statusCode = response.statusCode ?? 0;

    if (statusCode == 401) {
      await _tokenService.clearTokens();

      return true;
    }

    if (statusCode < 200 || statusCode >= 300) {
      return false;
    }

    await _tokenService.clearTokens();

    return true;
  }

  Future<bool> refresh() async {
    final refreshToken = await _tokenService.getRefreshToken();

    final response = await _dio.post(
      '/auth/refresh',
      data: {
        'refreshToken': refreshToken,
      },
    );

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      return false;
    }

    final newAccessToken = response.data['accessToken'];
    final newRefreshToken = response.data['refreshToken'];

    if (newAccessToken == null || newRefreshToken == null) {
      return false;
    }

    await _tokenService.saveTokens(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
    );

    return true;
  }

  Future<bool> changePassword(String newPassword) async {
    final accessToken = await _tokenService.getAccessToken();

    if (accessToken == null) {
      return false;
    }

    final response = await _dio.post(
      '/auth/change-password',
      data: {
        'newPassword': newPassword,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      return false;
    }

    final newAccessToken = response.data['accessToken'];
    final newRefreshToken = response.data['refreshToken'];

    if (newAccessToken == null || newRefreshToken == null) {
      return false;
    }

    await _tokenService.saveTokens(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
    );

    return true;
  }
}
