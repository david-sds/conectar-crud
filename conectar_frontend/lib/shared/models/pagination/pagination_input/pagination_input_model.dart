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
    final String? order,
    final String? search,
  }) = _PaginationInput;

  factory PaginationInput.fromJson(Map<String, Object?> json) =>
      _$PaginationInputFromJson(json);
}
