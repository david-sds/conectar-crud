import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    int? id,
    String? number,
    String? street,
    String? district,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    String? complement,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
