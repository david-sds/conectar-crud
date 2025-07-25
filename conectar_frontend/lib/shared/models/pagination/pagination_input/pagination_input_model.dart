import 'package:conectar_frontend/shared/models/pagination/order_by_direction/order_by_direction_model.dart';

class PaginationInput {
  final int? page;
  final int? size;
  final String? orderBy;
  final OrderByDirection? direction;
  final String? search;

  const PaginationInput({
    this.page,
    this.size,
    this.orderBy,
    this.direction,
    this.search,
  });
}
