import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class UserRoleConverter implements JsonConverter<UserRole, String> {
  const UserRoleConverter();

  @override
  UserRole fromJson(String json) {
    return UserRole.values.firstWhere(
      (e) => e.value == json,
      orElse: () => throw ArgumentError('Unknown UserRole: $json'),
    );
  }

  @override
  String toJson(UserRole status) => status.value;
}
