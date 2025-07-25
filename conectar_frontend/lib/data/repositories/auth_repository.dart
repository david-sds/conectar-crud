import 'package:conectar_frontend/data/services/http_service.dart';
import 'package:conectar_frontend/data/services/token_service.dart';
import 'package:dio/dio.dart';

final _tokenService = TokenService();

class AuthRepository {
  final Dio _dio = HttpService().dio;

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
    final response = await _dio.post(
      '/auth/logout',
    );

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      return false;
    }

    await _tokenService.clearTokens();

    return true;
  }
}
