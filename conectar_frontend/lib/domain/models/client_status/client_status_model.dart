import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum ClientStatus {
  @JsonValue('ACTIVE')
  active,

  @JsonValue('INACTIVE')
  inactive;
}

extension ClientStatusExtension on ClientStatus {
  String get label => switch (this) {
        ClientStatus.active => 'Ativo',
        ClientStatus.inactive => 'Inativo',
      };
}
