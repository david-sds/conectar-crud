import 'package:conectar_frontend/data/repositories/auth_repository.dart';
import 'package:conectar_frontend/data/services/token_service.dart';
import 'package:dio/dio.dart';

final _tokenService = TokenService();

final baseOptions = BaseOptions(
  baseUrl: 'http://localhost:3000/api',
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {'Content-Type': 'application/json'},
);

class HttpClient {
  final Dio dio;
  final AuthRepository _authRepository;

  HttpClient()
      : _authRepository = AuthRepository(),
        dio = Dio(baseOptions) {
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
        onError: (e, handler) async {
          final isAuthError =
              e.response?.statusCode == 401 || e.response?.statusCode == 403;

          if (!isAuthError) {
            handler.next(e);
            return;
          }

          final isRefreshed = await _authRepository.refresh();

          if (isRefreshed) {
            final newToken = await _tokenService.getAccessToken();

            try {
              final options = Options(
                method: e.requestOptions.method,
                extra: e.requestOptions.extra,
                headers: {
                  ...e.requestOptions.headers,
                  'Authorization': 'Bearer $newToken'
                },
              );

              final retryDio = Dio(baseOptions.copyWith())
                ..interceptors.clear();

              final cloned = await retryDio.request(
                e.requestOptions.path,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters,
                options: options,
              );
              return handler.resolve(cloned);
            } catch (e) {
              await _authRepository.logout();

              return handler.reject(e as DioException);
            }
          }
        },
      ),
    );
  }
}
