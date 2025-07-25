import 'package:conectar_frontend/data/services/http_service.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:dio/dio.dart';

class ClientsRepository {
  final Dio _dio = HttpService().dio;

  Future<List<Client>> findAll() async {
    final response = await _dio.get('/clients');

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      return [];
    }

    return _clientListToJsonClass(response.data);
  }

  Future<Client?> findOne(int userId) async {
    return null;
  }

  Future<Client?> create(Client payload) async {
    return null;
  }

  Future<Client?> update(int userId, Client payload) async {
    return null;
  }

  Future<Client?> delete(int userId) async {
    return null;
  }

  Client _clientJsonToClass(dynamic json) {
    return Client.fromJson((json ?? {}) as Map<String, dynamic>);
  }

  List<Client> _clientListToJsonClass(dynamic json) {
    return (json as List<dynamic>).map(_clientJsonToClass).toList();
  }
}
