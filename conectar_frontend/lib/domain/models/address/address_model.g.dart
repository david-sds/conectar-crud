// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num?)?.toInt(),
      number: json['number'] as String?,
      street: json['street'] as String?,
      district: json['district'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
      complement: json['complement'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'street': instance.street,
      'district': instance.district,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'complement': instance.complement,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
