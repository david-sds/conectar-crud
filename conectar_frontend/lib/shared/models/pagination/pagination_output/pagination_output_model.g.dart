// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_output_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationOutputImpl _$$PaginationOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationOutputImpl(
      total: (json['total'] as num?)?.toInt(),
      lastPage: (json['lastPage'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPerPage: (json['totalPerPage'] as num?)?.toInt(),
      prevPage: (json['prevPage'] as num?)?.toInt(),
      nextPage: (json['nextPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaginationOutputImplToJson(
        _$PaginationOutputImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'lastPage': instance.lastPage,
      'currentPage': instance.currentPage,
      'totalPerPage': instance.totalPerPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };
