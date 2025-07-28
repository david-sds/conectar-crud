import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_filters_model.freezed.dart';
part 'user_filters_model.g.dart';

@freezed
class UserFilters with _$UserFilters {
  const factory UserFilters({
    String? nome,
    String? email,
    String? role,
  }) = _UserFilters;

  factory UserFilters.fromJson(Map<String, dynamic> json) =>
      _$UserFiltersFromJson(json);
}
