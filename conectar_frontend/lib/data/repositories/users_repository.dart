import 'package:conectar_frontend/data/services/http_client_service.dart';
import 'package:conectar_frontend/domain/models/filters/user_filters/user_filters_model.dart';
import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:conectar_frontend/domain/models/user_details/user_details_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_input/pagination_input_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_output/pagination_output_model.dart';
import 'package:dio/dio.dart';

class UsersRepository {
  final Dio _dio = HttpClient().dio;

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

  Future<UserDetails> findMe() async {
    final response = await _dio.get(
      '/users/me',
    );

    return _userDetailsJsonToClass(response.data);
  }

  Future<UserDetails> findOne(int userId) async {
    final response = await _dio.get(
      '/users/$userId',
    );

    return _userDetailsJsonToClass(response.data);
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

  Future<int> updateUserClients(
    int userId,
    List<int> addClientIds,
    List<int> removeClientIds,
  ) async {
    final response = await _dio.patch(
      '/users/update-clients/$userId',
      data: {
        'addClientIds': addClientIds,
        'removeClientIds': removeClientIds,
      },
    );

    return response.data;
  }

  Future<int> removeClientsFromUser(int userId, List<int> clientIds) async {
    final response = await _dio.patch(
      '/users/remove-from-user/$userId',
      data: {'clientIds': clientIds},
    );

    return response.data;
  }

  UserDetails _userDetailsJsonToClass(dynamic json) {
    return UserDetails.fromJson((json ?? {}) as Map<String, dynamic>);
  }

  User _userJsonToClass(dynamic json) {
    return User.fromJson((json ?? {}) as Map<String, dynamic>);
  }

  List<User> _userListToJsonClass(dynamic json) {
    return (json as List<dynamic>).map(_userJsonToClass).toList();
  }
}
