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
      order: json['order'] as String?,
      search: json['search'] as String?,
    );

Map<String, dynamic> _$$PaginationInputImplToJson(
        _$PaginationInputImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'sortBy': instance.sortBy,
      'order': instance.order,
      'search': instance.search,
    };
