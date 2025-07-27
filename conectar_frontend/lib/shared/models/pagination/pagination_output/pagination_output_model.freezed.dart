// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_output_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationOutput _$PaginationOutputFromJson(Map<String, dynamic> json) {
  return _PaginationOutput.fromJson(json);
}

/// @nodoc
mixin _$PaginationOutput {
  int? get total => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  int? get totalPerPage => throw _privateConstructorUsedError;
  int? get prevPage => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;

  /// Serializes this PaginationOutput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationOutputCopyWith<PaginationOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationOutputCopyWith<$Res> {
  factory $PaginationOutputCopyWith(
          PaginationOutput value, $Res Function(PaginationOutput) then) =
      _$PaginationOutputCopyWithImpl<$Res, PaginationOutput>;
  @useResult
  $Res call(
      {int? total,
      int? lastPage,
      int? currentPage,
      int? totalPerPage,
      int? prevPage,
      int? nextPage});
}

/// @nodoc
class _$PaginationOutputCopyWithImpl<$Res, $Val extends PaginationOutput>
    implements $PaginationOutputCopyWith<$Res> {
  _$PaginationOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? lastPage = freezed,
    Object? currentPage = freezed,
    Object? totalPerPage = freezed,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPerPage: freezed == totalPerPage
          ? _value.totalPerPage
          : totalPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationOutputImplCopyWith<$Res>
    implements $PaginationOutputCopyWith<$Res> {
  factory _$$PaginationOutputImplCopyWith(_$PaginationOutputImpl value,
          $Res Function(_$PaginationOutputImpl) then) =
      __$$PaginationOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      int? lastPage,
      int? currentPage,
      int? totalPerPage,
      int? prevPage,
      int? nextPage});
}

/// @nodoc
class __$$PaginationOutputImplCopyWithImpl<$Res>
    extends _$PaginationOutputCopyWithImpl<$Res, _$PaginationOutputImpl>
    implements _$$PaginationOutputImplCopyWith<$Res> {
  __$$PaginationOutputImplCopyWithImpl(_$PaginationOutputImpl _value,
      $Res Function(_$PaginationOutputImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? lastPage = freezed,
    Object? currentPage = freezed,
    Object? totalPerPage = freezed,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$PaginationOutputImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPerPage: freezed == totalPerPage
          ? _value.totalPerPage
          : totalPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationOutputImpl extends _PaginationOutput {
  const _$PaginationOutputImpl(
      {this.total,
      this.lastPage,
      this.currentPage,
      this.totalPerPage,
      this.prevPage,
      this.nextPage})
      : super._();

  factory _$PaginationOutputImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationOutputImplFromJson(json);

  @override
  final int? total;
  @override
  final int? lastPage;
  @override
  final int? currentPage;
  @override
  final int? totalPerPage;
  @override
  final int? prevPage;
  @override
  final int? nextPage;

  @override
  String toString() {
    return 'PaginationOutput(total: $total, lastPage: $lastPage, currentPage: $currentPage, totalPerPage: $totalPerPage, prevPage: $prevPage, nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationOutputImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPerPage, totalPerPage) ||
                other.totalPerPage == totalPerPage) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, lastPage, currentPage,
      totalPerPage, prevPage, nextPage);

  /// Create a copy of PaginationOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationOutputImplCopyWith<_$PaginationOutputImpl> get copyWith =>
      __$$PaginationOutputImplCopyWithImpl<_$PaginationOutputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationOutputImplToJson(
      this,
    );
  }
}

abstract class _PaginationOutput extends PaginationOutput {
  const factory _PaginationOutput(
      {final int? total,
      final int? lastPage,
      final int? currentPage,
      final int? totalPerPage,
      final int? prevPage,
      final int? nextPage}) = _$PaginationOutputImpl;
  const _PaginationOutput._() : super._();

  factory _PaginationOutput.fromJson(Map<String, dynamic> json) =
      _$PaginationOutputImpl.fromJson;

  @override
  int? get total;
  @override
  int? get lastPage;
  @override
  int? get currentPage;
  @override
  int? get totalPerPage;
  @override
  int? get prevPage;
  @override
  int? get nextPage;

  /// Create a copy of PaginationOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationOutputImplCopyWith<_$PaginationOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
