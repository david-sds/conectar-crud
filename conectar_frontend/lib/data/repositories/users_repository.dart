import 'package:conectar_frontend/data/services/http_service.dart';
import 'package:conectar_frontend/domain/models/filters/user_filters/user_filters_model.dart';
import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_input/pagination_input_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_output/pagination_output_model.dart';
import 'package:dio/dio.dart';

class UsersRepository {
  final Dio _dio = HttpService().dio;

  Future<(List<User>, PaginationOutput)> findAll({
    required PaginationInput? paginationInput,
    UserFilters? filters,
  }) async {
    final paginationParams = (paginationInput?.toJson() ?? {})
      ..removeWhere((key, value) => value == null);
    final filterParams = (filters?.toJson() ?? {})
      ..removeWhere((key, value) => value == null);
    Map<String, dynamic> queryParams = {
      ...paginationParams,
      ...filterParams,
    };

    final response = await _dio.get(
      '/users',
      queryParameters: queryParams,
    );

    final models = _userListToJsonClass(response.data['data']);
    final paginationOutput = PaginationOutput.fromJson(
      (response.data['meta'] ?? {}) as Map<String, dynamic>,
    );

    return (models, paginationOutput);
  }

  Future<List<User>?> findInactiveUsers() async {
    final response = await _dio.get(
      '/users/inactive',
    );

    return _userListToJsonClass(response.data);
  }

  Future<User?> findMe() async {
    final response = await _dio.get(
      '/users/me',
    );

    return _userJsonToClass(response.data);
  }

  Future<User> findOne(int userId) async {
    final response = await _dio.get(
      '/users/$userId',
    );

    return _userJsonToClass(response.data);
  }

  Future<User?> create(User payload) async {
    final response = await _dio.post(
      '/users',
      data: payload.toJson(),
    );

    return _userJsonToClass(response.data);
  }

  Future<User?> update(int userId, User payload) async {
    final response = await _dio.patch(
      '/users/$userId',
      data: payload.toJson(),
    );

    return _userJsonToClass(response.data);
  }

  Future<User?> delete(int userId) async {
    final response = await _dio.delete(
      '/users/$userId',
    );

    return _userJsonToClass(response.data);
  }

  User _userJsonToClass(dynamic json) {
    return User.fromJson((json ?? {}) as Map<String, dynamic>);
  }

  List<User> _userListToJsonClass(dynamic json) {
    return (json as List<dynamic>).map(_userJsonToClass).toList();
  }
}
