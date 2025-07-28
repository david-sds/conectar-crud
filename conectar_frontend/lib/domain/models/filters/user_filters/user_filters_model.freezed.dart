// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_filters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserFilters _$UserFiltersFromJson(Map<String, dynamic> json) {
  return _UserFilters.fromJson(json);
}

/// @nodoc
mixin _$UserFilters {
  String? get nome => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  /// Serializes this UserFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserFiltersCopyWith<UserFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFiltersCopyWith<$Res> {
  factory $UserFiltersCopyWith(
          UserFilters value, $Res Function(UserFilters) then) =
      _$UserFiltersCopyWithImpl<$Res, UserFilters>;
  @useResult
  $Res call({String? nome, String? email, String? role});
}

/// @nodoc
class _$UserFiltersCopyWithImpl<$Res, $Val extends UserFilters>
    implements $UserFiltersCopyWith<$Res> {
  _$UserFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? email = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFiltersImplCopyWith<$Res>
    implements $UserFiltersCopyWith<$Res> {
  factory _$$UserFiltersImplCopyWith(
          _$UserFiltersImpl value, $Res Function(_$UserFiltersImpl) then) =
      __$$UserFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nome, String? email, String? role});
}

/// @nodoc
class __$$UserFiltersImplCopyWithImpl<$Res>
    extends _$UserFiltersCopyWithImpl<$Res, _$UserFiltersImpl>
    implements _$$UserFiltersImplCopyWith<$Res> {
  __$$UserFiltersImplCopyWithImpl(
      _$UserFiltersImpl _value, $Res Function(_$UserFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? email = freezed,
    Object? role = freezed,
  }) {
    return _then(_$UserFiltersImpl(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFiltersImpl implements _UserFilters {
  const _$UserFiltersImpl({this.nome, this.email, this.role});

  factory _$UserFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFiltersImplFromJson(json);

  @override
  final String? nome;
  @override
  final String? email;
  @override
  final String? role;

  @override
  String toString() {
    return 'UserFilters(nome: $nome, email: $email, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFiltersImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nome, email, role);

  /// Create a copy of UserFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFiltersImplCopyWith<_$UserFiltersImpl> get copyWith =>
      __$$UserFiltersImplCopyWithImpl<_$UserFiltersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFiltersImplToJson(
      this,
    );
  }
}

abstract class _UserFilters implements UserFilters {
  const factory _UserFilters(
      {final String? nome,
      final String? email,
      final String? role}) = _$UserFiltersImpl;

  factory _UserFilters.fromJson(Map<String, dynamic> json) =
      _$UserFiltersImpl.fromJson;

  @override
  String? get nome;
  @override
  String? get email;
  @override
  String? get role;

  /// Create a copy of UserFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFiltersImplCopyWith<_$UserFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
