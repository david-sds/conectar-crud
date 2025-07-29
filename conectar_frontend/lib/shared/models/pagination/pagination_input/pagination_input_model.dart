import 'package:conectar_frontend/domain/converters/order_converter.dart';
import 'package:conectar_frontend/shared/models/pagination/order/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_input_model.freezed.dart';
part 'pagination_input_model.g.dart';

@freezed
@immutable
class PaginationInput with _$PaginationInput {
  const factory PaginationInput({
    final int? page,
    final int? size,
    final String? sortBy,
    @OrderConverter() final Order? order,
    final String? search,
  }) = _PaginationInput;

  factory PaginationInput.fromJson(Map<String, Object?> json) =>
      _$PaginationInputFromJson(json);
}
