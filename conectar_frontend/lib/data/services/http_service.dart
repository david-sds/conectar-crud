import 'package:conectar_frontend/data/services/token_service.dart';
import 'package:dio/dio.dart';

final _tokenService = TokenService();

class HttpService {
  final Dio dio;

  HttpService()
      : dio = Dio(BaseOptions(
          baseUrl: 'http://localhost:3000/api',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        )) {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenService.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (e, handler) {
          handler.next(e);
        },
      ),
    );
  }
}
