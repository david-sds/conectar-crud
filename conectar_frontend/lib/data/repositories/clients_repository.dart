import 'package:conectar_frontend/data/services/http_client_service.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/filters/client_filters/client_filters_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_input/pagination_input_model.dart';
import 'package:conectar_frontend/shared/models/pagination/pagination_output/pagination_output_model.dart';
import 'package:dio/dio.dart';

class ClientsRepository {
  final Dio _dio = HttpClient().dio;

  Future<(List<Client>, PaginationOutput)> findAll({
    required PaginationInput? paginationInput,
    ClientFilters? filters,
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
      '/clients',
      queryParameters: queryParams,
    );

    final models = _clientListToJsonClass(response.data['data']);
    final paginationOutput = PaginationOutput.fromJson(
      (response.data['meta'] ?? {}) as Map<String, dynamic>,
    );

    return (models, paginationOutput);
  }

  Future<Client> findOne(int userId) async {
    final response = await _dio.get(
      '/clients/$userId',
    );

    return _clientJsonToClass(response.data);
  }

  Future<Client?> create(Client payload) async {
    final response = await _dio.post(
      '/clients',
      data: payload.toJson(),
    );

    return _clientJsonToClass(response.data);
  }

  Future<Client?> update(int userId, Client payload) async {
    final response = await _dio.patch(
      '/clients/$userId',
      data: payload.toJson(),
    );

    return _clientJsonToClass(response.data);
  }

  Future<Client?> delete(int userId) async {
    final response = await _dio.delete(
      '/clients/$userId',
    );

    return _clientJsonToClass(response.data);
  }

  Client _clientJsonToClass(dynamic json) {
    return Client.fromJson((json ?? {}) as Map<String, dynamic>);
  }

  List<Client> _clientListToJsonClass(dynamic json) {
    return (json as List<dynamic>).map(_clientJsonToClass).toList();
  }
}
