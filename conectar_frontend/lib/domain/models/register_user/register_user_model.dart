import 'package:conectar_frontend/domain/converters/user_role_converter.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_model.freezed.dart';
part 'register_user_model.g.dart';

@freezed
class RegisterUser with _$RegisterUser {
  const factory RegisterUser({
    int? id,
    String? name,
    String? email,
    String? password,
    @UserRoleConverter() UserRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RegisterUser;

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);
}
