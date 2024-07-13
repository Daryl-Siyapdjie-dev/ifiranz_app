// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_search_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginatedSearchProductResponse<T> {
  List<T> get data => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  String? get actionError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedSearchProductResponseCopyWith<T, PaginatedSearchProductResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedSearchProductResponseCopyWith<T, $Res> {
  factory $PaginatedSearchProductResponseCopyWith(
          PaginatedSearchProductResponse<T> value,
          $Res Function(PaginatedSearchProductResponse<T>) then) =
      _$PaginatedSearchProductResponseCopyWithImpl<T, $Res,
          PaginatedSearchProductResponse<T>>;
  @useResult
  $Res call(
      {List<T> data, int totalElements, int totalPages, String? actionError});
}

/// @nodoc
class _$PaginatedSearchProductResponseCopyWithImpl<T, $Res,
        $Val extends PaginatedSearchProductResponse<T>>
    implements $PaginatedSearchProductResponseCopyWith<T, $Res> {
  _$PaginatedSearchProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? actionError = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      actionError: freezed == actionError
          ? _value.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedSearchProductResponseImplCopyWith<T, $Res>
    implements $PaginatedSearchProductResponseCopyWith<T, $Res> {
  factory _$$PaginatedSearchProductResponseImplCopyWith(
          _$PaginatedSearchProductResponseImpl<T> value,
          $Res Function(_$PaginatedSearchProductResponseImpl<T>) then) =
      __$$PaginatedSearchProductResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> data, int totalElements, int totalPages, String? actionError});
}

/// @nodoc
class __$$PaginatedSearchProductResponseImplCopyWithImpl<T, $Res>
    extends _$PaginatedSearchProductResponseCopyWithImpl<T, $Res,
        _$PaginatedSearchProductResponseImpl<T>>
    implements _$$PaginatedSearchProductResponseImplCopyWith<T, $Res> {
  __$$PaginatedSearchProductResponseImplCopyWithImpl(
      _$PaginatedSearchProductResponseImpl<T> _value,
      $Res Function(_$PaginatedSearchProductResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? actionError = freezed,
  }) {
    return _then(_$PaginatedSearchProductResponseImpl<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      actionError: freezed == actionError
          ? _value.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PaginatedSearchProductResponseImpl<T>
    implements _PaginatedSearchProductResponse<T> {
  _$PaginatedSearchProductResponseImpl(
      {required final List<T> data,
      required this.totalElements,
      required this.totalPages,
      this.actionError})
      : _data = data;

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int totalElements;
  @override
  final int totalPages;
  @override
  final String? actionError;

  @override
  String toString() {
    return 'PaginatedSearchProductResponse<$T>(data: $data, totalElements: $totalElements, totalPages: $totalPages, actionError: $actionError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedSearchProductResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      totalElements,
      totalPages,
      actionError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedSearchProductResponseImplCopyWith<T,
          _$PaginatedSearchProductResponseImpl<T>>
      get copyWith => __$$PaginatedSearchProductResponseImplCopyWithImpl<T,
          _$PaginatedSearchProductResponseImpl<T>>(this, _$identity);
}

abstract class _PaginatedSearchProductResponse<T>
    implements PaginatedSearchProductResponse<T> {
  factory _PaginatedSearchProductResponse(
      {required final List<T> data,
      required final int totalElements,
      required final int totalPages,
      final String? actionError}) = _$PaginatedSearchProductResponseImpl<T>;

  @override
  List<T> get data;
  @override
  int get totalElements;
  @override
  int get totalPages;
  @override
  String? get actionError;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedSearchProductResponseImplCopyWith<T,
          _$PaginatedSearchProductResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
