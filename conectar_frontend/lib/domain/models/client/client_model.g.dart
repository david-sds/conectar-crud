// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      id: (json['id'] as num?)?.toInt(),
      cnpj: json['cnpj'] as String?,
      name: json['name'] as String?,
      legalName: json['legalName'] as String?,
      status: json['status'] as String?,
      conectaPlus: json['conectaPlus'] as bool?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cnpj': instance.cnpj,
      'name': instance.name,
      'legalName': instance.legalName,
      'status': instance.status,
      'conectaPlus': instance.conectaPlus,
      'address': instance.address,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
