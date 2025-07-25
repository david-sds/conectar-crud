import 'package:conectar_frontend/data/services/http_service.dart';
import 'package:conectar_frontend/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';

class UsersRepository {
  final Dio _dio = HttpService().dio;

  Future<List<User>?> findAll() async {
    final response = await _dio.get('/users');

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      return null;
    }

    return null;
  }

  Future<User?> findMe() async {
    return null;
  }

  Future<List<User>?> findInactiveUsers() async {
    return null;
  }

  Future<User?> findOne(int userId) async {
    return null;
  }

  Future<User?> create(User payload) async {
    return null;
  }

  Future<User?> update(int userId, User payload) async {
    return null;
  }

  Future<User?> delete(int userId) async {
    return null;
  }
}
