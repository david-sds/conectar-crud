import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ClientStatusConverter implements JsonConverter<ClientStatus, String> {
  const ClientStatusConverter();

  @override
  ClientStatus fromJson(String json) {
    return ClientStatus.values.firstWhere(
      (e) => e.value == json,
      orElse: () => throw ArgumentError('Unknown ClientStatus: $json'),
    );
  }

  @override
  String toJson(ClientStatus status) => status.value;
}
