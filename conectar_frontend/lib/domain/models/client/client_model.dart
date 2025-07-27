import 'package:conectar_frontend/domain/converters/client_status_converter.dart';
import 'package:conectar_frontend/domain/models/address/address_model.dart';
import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

@freezed
class Client with _$Client {
  const factory Client({
    int? id,
    String? cnpj,
    String? name,
    String? legalName,
    @ClientStatusConverter() ClientStatus? status,
    bool? conectaPlus,
    Address? address,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
