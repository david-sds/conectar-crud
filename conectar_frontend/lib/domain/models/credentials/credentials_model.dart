import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials_model.freezed.dart';
part 'credentials_model.g.dart';

@freezed
class Credentials with _$Credentials {
  const factory Credentials({
    String? email,
    String? password,
  }) = _Credentials;

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}
