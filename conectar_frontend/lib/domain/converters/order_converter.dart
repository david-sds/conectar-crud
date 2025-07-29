import 'package:conectar_frontend/shared/models/pagination/order/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OrderConverter implements JsonConverter<Order, String> {
  const OrderConverter();

  @override
  Order fromJson(String json) {
    return Order.values.firstWhere(
      (e) => e.value == json,
      orElse: () => throw ArgumentError('Unknown Order: $json'),
    );
  }

  @override
  String toJson(Order status) => status.value;
}
