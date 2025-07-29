// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_decode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenDecode _$TokenDecodeFromJson(Map<String, dynamic> json) {
  return _TokenDecode.fromJson(json);
}

/// @nodoc
mixin _$TokenDecode {
  int? get sub => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @UserRoleConverter()
  UserRole? get role => throw _privateConstructorUsedError;
  int? get iat => throw _privateConstructorUsedError;
  int? get exp => throw _privateConstructorUsedError;

  /// Serializes this TokenDecode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenDecode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenDecodeCopyWith<TokenDecode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDecodeCopyWith<$Res> {
  factory $TokenDecodeCopyWith(
          TokenDecode value, $Res Function(TokenDecode) then) =
      _$TokenDecodeCopyWithImpl<$Res, TokenDecode>;
  @useResult
  $Res call(
      {int? sub,
      String? email,
      @UserRoleConverter() UserRole? role,
      int? iat,
      int? exp});
}

/// @nodoc
class _$TokenDecodeCopyWithImpl<$Res, $Val extends TokenDecode>
    implements $TokenDecodeCopyWith<$Res> {
  _$TokenDecodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenDecode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? iat = freezed,
    Object? exp = freezed,
  }) {
    return _then(_value.copyWith(
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      iat: freezed == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as int?,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenDecodeImplCopyWith<$Res>
    implements $TokenDecodeCopyWith<$Res> {
  factory _$$TokenDecodeImplCopyWith(
          _$TokenDecodeImpl value, $Res Function(_$TokenDecodeImpl) then) =
      __$$TokenDecodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? sub,
      String? email,
      @UserRoleConverter() UserRole? role,
      int? iat,
      int? exp});
}

/// @nodoc
class __$$TokenDecodeImplCopyWithImpl<$Res>
    extends _$TokenDecodeCopyWithImpl<$Res, _$TokenDecodeImpl>
    implements _$$TokenDecodeImplCopyWith<$Res> {
  __$$TokenDecodeImplCopyWithImpl(
      _$TokenDecodeImpl _value, $Res Function(_$TokenDecodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenDecode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? iat = freezed,
    Object? exp = freezed,
  }) {
    return _then(_$TokenDecodeImpl(
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      iat: freezed == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as int?,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenDecodeImpl implements _TokenDecode {
  const _$TokenDecodeImpl(
      {this.sub,
      this.email,
      @UserRoleConverter() this.role,
      this.iat,
      this.exp});

  factory _$TokenDecodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenDecodeImplFromJson(json);

  @override
  final int? sub;
  @override
  final String? email;
  @override
  @UserRoleConverter()
  final UserRole? role;
  @override
  final int? iat;
  @override
  final int? exp;

  @override
  String toString() {
    return 'TokenDecode(sub: $sub, email: $email, role: $role, iat: $iat, exp: $exp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenDecodeImpl &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.iat, iat) || other.iat == iat) &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sub, email, role, iat, exp);

  /// Create a copy of TokenDecode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenDecodeImplCopyWith<_$TokenDecodeImpl> get copyWith =>
      __$$TokenDecodeImplCopyWithImpl<_$TokenDecodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenDecodeImplToJson(
      this,
    );
  }
}

abstract class _TokenDecode implements TokenDecode {
  const factory _TokenDecode(
      {final int? sub,
      final String? email,
      @UserRoleConverter() final UserRole? role,
      final int? iat,
      final int? exp}) = _$TokenDecodeImpl;

  factory _TokenDecode.fromJson(Map<String, dynamic> json) =
      _$TokenDecodeImpl.fromJson;

  @override
  int? get sub;
  @override
  String? get email;
  @override
  @UserRoleConverter()
  UserRole? get role;
  @override
  int? get iat;
  @override
  int? get exp;

  /// Create a copy of TokenDecode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenDecodeImplCopyWith<_$TokenDecodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
