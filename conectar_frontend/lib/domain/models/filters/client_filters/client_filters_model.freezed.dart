// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_filters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientFilters _$ClientFiltersFromJson(Map<String, dynamic> json) {
  return _ClientFilters.fromJson(json);
}

/// @nodoc
mixin _$ClientFilters {
  String? get nome => throw _privateConstructorUsedError;
  String? get cnpj => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get conectaPlus => throw _privateConstructorUsedError;

  /// Serializes this ClientFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientFiltersCopyWith<ClientFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientFiltersCopyWith<$Res> {
  factory $ClientFiltersCopyWith(
          ClientFilters value, $Res Function(ClientFilters) then) =
      _$ClientFiltersCopyWithImpl<$Res, ClientFilters>;
  @useResult
  $Res call({String? nome, String? cnpj, String? status, bool? conectaPlus});
}

/// @nodoc
class _$ClientFiltersCopyWithImpl<$Res, $Val extends ClientFilters>
    implements $ClientFiltersCopyWith<$Res> {
  _$ClientFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? cnpj = freezed,
    Object? status = freezed,
    Object? conectaPlus = freezed,
  }) {
    return _then(_value.copyWith(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      cnpj: freezed == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      conectaPlus: freezed == conectaPlus
          ? _value.conectaPlus
          : conectaPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientFiltersImplCopyWith<$Res>
    implements $ClientFiltersCopyWith<$Res> {
  factory _$$ClientFiltersImplCopyWith(
          _$ClientFiltersImpl value, $Res Function(_$ClientFiltersImpl) then) =
      __$$ClientFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nome, String? cnpj, String? status, bool? conectaPlus});
}

/// @nodoc
class __$$ClientFiltersImplCopyWithImpl<$Res>
    extends _$ClientFiltersCopyWithImpl<$Res, _$ClientFiltersImpl>
    implements _$$ClientFiltersImplCopyWith<$Res> {
  __$$ClientFiltersImplCopyWithImpl(
      _$ClientFiltersImpl _value, $Res Function(_$ClientFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? cnpj = freezed,
    Object? status = freezed,
    Object? conectaPlus = freezed,
  }) {
    return _then(_$ClientFiltersImpl(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      cnpj: freezed == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      conectaPlus: freezed == conectaPlus
          ? _value.conectaPlus
          : conectaPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientFiltersImpl implements _ClientFilters {
  const _$ClientFiltersImpl(
      {this.nome, this.cnpj, this.status, this.conectaPlus});

  factory _$ClientFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientFiltersImplFromJson(json);

  @override
  final String? nome;
  @override
  final String? cnpj;
  @override
  final String? status;
  @override
  final bool? conectaPlus;

  @override
  String toString() {
    return 'ClientFilters(nome: $nome, cnpj: $cnpj, status: $status, conectaPlus: $conectaPlus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientFiltersImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.cnpj, cnpj) || other.cnpj == cnpj) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conectaPlus, conectaPlus) ||
                other.conectaPlus == conectaPlus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nome, cnpj, status, conectaPlus);

  /// Create a copy of ClientFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientFiltersImplCopyWith<_$ClientFiltersImpl> get copyWith =>
      __$$ClientFiltersImplCopyWithImpl<_$ClientFiltersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientFiltersImplToJson(
      this,
    );
  }
}

abstract class _ClientFilters implements ClientFilters {
  const factory _ClientFilters(
      {final String? nome,
      final String? cnpj,
      final String? status,
      final bool? conectaPlus}) = _$ClientFiltersImpl;

  factory _ClientFilters.fromJson(Map<String, dynamic> json) =
      _$ClientFiltersImpl.fromJson;

  @override
  String? get nome;
  @override
  String? get cnpj;
  @override
  String? get status;
  @override
  bool? get conectaPlus;

  /// Create a copy of ClientFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientFiltersImplCopyWith<_$ClientFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
