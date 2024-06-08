// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedRequest _$PaginatedRequestFromJson(Map<String, dynamic> json) {
  return _PaginatedRequest.fromJson(json);
}

/// @nodoc
mixin _$PaginatedRequest {
  int get size => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedRequestCopyWith<PaginatedRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedRequestCopyWith<$Res> {
  factory $PaginatedRequestCopyWith(
          PaginatedRequest value, $Res Function(PaginatedRequest) then) =
      _$PaginatedRequestCopyWithImpl<$Res, PaginatedRequest>;
  @useResult
  $Res call({int size, int page});
}

/// @nodoc
class _$PaginatedRequestCopyWithImpl<$Res, $Val extends PaginatedRequest>
    implements $PaginatedRequestCopyWith<$Res> {
  _$PaginatedRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedRequestImplCopyWith<$Res>
    implements $PaginatedRequestCopyWith<$Res> {
  factory _$$PaginatedRequestImplCopyWith(_$PaginatedRequestImpl value,
          $Res Function(_$PaginatedRequestImpl) then) =
      __$$PaginatedRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int size, int page});
}

/// @nodoc
class __$$PaginatedRequestImplCopyWithImpl<$Res>
    extends _$PaginatedRequestCopyWithImpl<$Res, _$PaginatedRequestImpl>
    implements _$$PaginatedRequestImplCopyWith<$Res> {
  __$$PaginatedRequestImplCopyWithImpl(_$PaginatedRequestImpl _value,
      $Res Function(_$PaginatedRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = null,
  }) {
    return _then(_$PaginatedRequestImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedRequestImpl implements _PaginatedRequest {
  _$PaginatedRequestImpl({this.size = 10, this.page = 0});

  factory _$PaginatedRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedRequestImplFromJson(json);

  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'PaginatedRequest(size: $size, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedRequestImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, size, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedRequestImplCopyWith<_$PaginatedRequestImpl> get copyWith =>
      __$$PaginatedRequestImplCopyWithImpl<_$PaginatedRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedRequestImplToJson(
      this,
    );
  }
}

abstract class _PaginatedRequest implements PaginatedRequest {
  factory _PaginatedRequest({final int size, final int page}) =
      _$PaginatedRequestImpl;

  factory _PaginatedRequest.fromJson(Map<String, dynamic> json) =
      _$PaginatedRequestImpl.fromJson;

  @override
  int get size;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedRequestImplCopyWith<_$PaginatedRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
