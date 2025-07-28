import 'package:conectar_frontend/domain/converters/user_role_converter.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? name,
    String? email,
    @UserRoleConverter() UserRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
