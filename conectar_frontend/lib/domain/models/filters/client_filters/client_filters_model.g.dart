// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_filters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientFiltersImpl _$$ClientFiltersImplFromJson(Map<String, dynamic> json) =>
    _$ClientFiltersImpl(
      nome: json['nome'] as String?,
      cnpj: json['cnpj'] as String?,
      status: $enumDecodeNullable(_$ClientStatusEnumMap, json['status']),
      conectaPlus: json['conectaPlus'] as bool?,
    );

Map<String, dynamic> _$$ClientFiltersImplToJson(_$ClientFiltersImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'cnpj': instance.cnpj,
      'status': _$ClientStatusEnumMap[instance.status],
      'conectaPlus': instance.conectaPlus,
    };

const _$ClientStatusEnumMap = {
  ClientStatus.active: 'ACTIVE',
  ClientStatus.inactive: 'INACTIVE',
};
