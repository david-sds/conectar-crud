import 'dart:convert';

import 'package:conectar_frontend/shared/models/pagination/order_by_direction/order_by_direction_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OrderByDirectionConverter
    implements JsonConverter<OrderByDirection?, dynamic> {
  const OrderByDirectionConverter();

  @override
  OrderByDirection? fromJson(dynamic jsonAttribute) {
    try {
      switch (jsonAttribute) {
        case 'asc':
          return OrderByDirection.ascending;
        case 'desc':
          return OrderByDirection.descending;
        default:
          return null;
      }
    } catch (e) {
      debugPrint('Error converting ${jsonAttribute.runtimeType} to '
          'OrderByDirection enum, value => $json');
    }
    return null;
  }

  @override
  String? toJson(OrderByDirection? object) => object?.value;
}
