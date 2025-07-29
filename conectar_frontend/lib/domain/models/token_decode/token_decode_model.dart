import 'package:conectar_frontend/domain/converters/user_role_converter.dart';
import 'package:conectar_frontend/domain/models/user_role/user_role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_decode_model.freezed.dart';
part 'token_decode_model.g.dart';

@freezed
class TokenDecode with _$TokenDecode {
  const factory TokenDecode({
    int? sub,
    String? email,
    @UserRoleConverter() UserRole? role,
    int? iat,
    int? exp,
  }) = _TokenDecode;

  factory TokenDecode.fromJson(Map<String, dynamic> json) =>
      _$TokenDecodeFromJson(json);
}
