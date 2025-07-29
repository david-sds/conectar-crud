// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationInputImpl _$$PaginationInputImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationInputImpl(
      page: (json['page'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      sortBy: json['sortBy'] as String?,
      order: _$JsonConverterFromJson<String, Order>(
          json['order'], const OrderConverter().fromJson),
      search: json['search'] as String?,
    );

Map<String, dynamic> _$$PaginationInputImplToJson(
        _$PaginationInputImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'sortBy': instance.sortBy,
      'order': _$JsonConverterToJson<String, Order>(
          instance.order, const OrderConverter().toJson),
      'search': instance.search,
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
