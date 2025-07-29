// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_decode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenDecodeImpl _$$TokenDecodeImplFromJson(Map<String, dynamic> json) =>
    _$TokenDecodeImpl(
      sub: (json['sub'] as num?)?.toInt(),
      email: json['email'] as String?,
      role: _$JsonConverterFromJson<String, UserRole>(
          json['role'], const UserRoleConverter().fromJson),
      iat: (json['iat'] as num?)?.toInt(),
      exp: (json['exp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TokenDecodeImplToJson(_$TokenDecodeImpl instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'email': instance.email,
      'role': _$JsonConverterToJson<String, UserRole>(
          instance.role, const UserRoleConverter().toJson),
      'iat': instance.iat,
      'exp': instance.exp,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
