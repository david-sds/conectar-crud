// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) {
  return _RegisterUser.fromJson(json);
}

/// @nodoc
mixin _$RegisterUser {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @UserRoleConverter()
  UserRole? get role => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RegisterUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterUserCopyWith<RegisterUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserCopyWith<$Res> {
  factory $RegisterUserCopyWith(
          RegisterUser value, $Res Function(RegisterUser) then) =
      _$RegisterUserCopyWithImpl<$Res, RegisterUser>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      String? password,
      @UserRoleConverter() UserRole? role,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$RegisterUserCopyWithImpl<$Res, $Val extends RegisterUser>
    implements $RegisterUserCopyWith<$Res> {
  _$RegisterUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterUserImplCopyWith<$Res>
    implements $RegisterUserCopyWith<$Res> {
  factory _$$RegisterUserImplCopyWith(
          _$RegisterUserImpl value, $Res Function(_$RegisterUserImpl) then) =
      __$$RegisterUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      String? password,
      @UserRoleConverter() UserRole? role,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$RegisterUserImplCopyWithImpl<$Res>
    extends _$RegisterUserCopyWithImpl<$Res, _$RegisterUserImpl>
    implements _$$RegisterUserImplCopyWith<$Res> {
  __$$RegisterUserImplCopyWithImpl(
      _$RegisterUserImpl _value, $Res Function(_$RegisterUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RegisterUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterUserImpl implements _RegisterUser {
  const _$RegisterUserImpl(
      {this.id,
      this.name,
      this.email,
      this.password,
      @UserRoleConverter() this.role,
      this.createdAt,
      this.updatedAt});

  factory _$RegisterUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterUserImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? password;
  @override
  @UserRoleConverter()
  final UserRole? role;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RegisterUser(id: $id, name: $name, email: $email, password: $password, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, email, password, role, createdAt, updatedAt);

  /// Create a copy of RegisterUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      __$$RegisterUserImplCopyWithImpl<_$RegisterUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterUserImplToJson(
      this,
    );
  }
}

abstract class _RegisterUser implements RegisterUser {
  const factory _RegisterUser(
      {final int? id,
      final String? name,
      final String? email,
      final String? password,
      @UserRoleConverter() final UserRole? role,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$RegisterUserImpl;

  factory _RegisterUser.fromJson(Map<String, dynamic> json) =
      _$RegisterUserImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get password;
  @override
  @UserRoleConverter()
  UserRole? get role;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of RegisterUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
