// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationInput _$PaginationInputFromJson(Map<String, dynamic> json) {
  return _PaginationInput.fromJson(json);
}

/// @nodoc
mixin _$PaginationInput {
  int? get page => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;
  String? get order => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  /// Serializes this PaginationInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationInputCopyWith<PaginationInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationInputCopyWith<$Res> {
  factory $PaginationInputCopyWith(
          PaginationInput value, $Res Function(PaginationInput) then) =
      _$PaginationInputCopyWithImpl<$Res, PaginationInput>;
  @useResult
  $Res call(
      {int? page, int? size, String? sortBy, String? order, String? search});
}

/// @nodoc
class _$PaginationInputCopyWithImpl<$Res, $Val extends PaginationInput>
    implements $PaginationInputCopyWith<$Res> {
  _$PaginationInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? sortBy = freezed,
    Object? order = freezed,
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationInputImplCopyWith<$Res>
    implements $PaginationInputCopyWith<$Res> {
  factory _$$PaginationInputImplCopyWith(_$PaginationInputImpl value,
          $Res Function(_$PaginationInputImpl) then) =
      __$$PaginationInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page, int? size, String? sortBy, String? order, String? search});
}

/// @nodoc
class __$$PaginationInputImplCopyWithImpl<$Res>
    extends _$PaginationInputCopyWithImpl<$Res, _$PaginationInputImpl>
    implements _$$PaginationInputImplCopyWith<$Res> {
  __$$PaginationInputImplCopyWithImpl(
      _$PaginationInputImpl _value, $Res Function(_$PaginationInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? sortBy = freezed,
    Object? order = freezed,
    Object? search = freezed,
  }) {
    return _then(_$PaginationInputImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationInputImpl implements _PaginationInput {
  const _$PaginationInputImpl(
      {this.page, this.size, this.sortBy, this.order, this.search});

  factory _$PaginationInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationInputImplFromJson(json);

  @override
  final int? page;
  @override
  final int? size;
  @override
  final String? sortBy;
  @override
  final String? order;
  @override
  final String? search;

  @override
  String toString() {
    return 'PaginationInput(page: $page, size: $size, sortBy: $sortBy, order: $order, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationInputImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.search, search) || other.search == search));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, size, sortBy, order, search);

  /// Create a copy of PaginationInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationInputImplCopyWith<_$PaginationInputImpl> get copyWith =>
      __$$PaginationInputImplCopyWithImpl<_$PaginationInputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationInputImplToJson(
      this,
    );
  }
}

abstract class _PaginationInput implements PaginationInput {
  const factory _PaginationInput(
      {final int? page,
      final int? size,
      final String? sortBy,
      final String? order,
      final String? search}) = _$PaginationInputImpl;

  factory _PaginationInput.fromJson(Map<String, dynamic> json) =
      _$PaginationInputImpl.fromJson;

  @override
  int? get page;
  @override
  int? get size;
  @override
  String? get sortBy;
  @override
  String? get order;
  @override
  String? get search;

  /// Create a copy of PaginationInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationInputImplCopyWith<_$PaginationInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
