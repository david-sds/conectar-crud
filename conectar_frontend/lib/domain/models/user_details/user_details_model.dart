import 'package:conectar_frontend/domain/converters/user_role_converter.dart';
import 'package:conectar_frontend/domain/models/client/client_model.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_model.freezed.dart';
part 'user_details_model.g.dart';

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    int? id,
    String? name,
    String? email,
    @UserRoleConverter() UserRole? role,
    List<Client>? clients,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}
