import 'package:conectar_frontend/domain/models/client_status/client_status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_filters_model.freezed.dart';
part 'client_filters_model.g.dart';

@freezed
class ClientFilters with _$ClientFilters {
  const factory ClientFilters({
    String? nome,
    String? cnpj,
    ClientStatus? status,
    bool? conectaPlus,
  }) = _ClientFilters;

  factory ClientFilters.fromJson(Map<String, dynamic> json) =>
      _$ClientFiltersFromJson(json);
}
