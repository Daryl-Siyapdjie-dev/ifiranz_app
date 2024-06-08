// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_optional.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterOptional _$FilterOptionalFromJson(Map<String, dynamic> json) {
  return _FilterOptional.fromJson(json);
}

/// @nodoc
mixin _$FilterOptional {
  String? get aliasKey => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String? get value1 => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get applyAnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterOptionalCopyWith<FilterOptional> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterOptionalCopyWith<$Res> {
  factory $FilterOptionalCopyWith(
          FilterOptional value, $Res Function(FilterOptional) then) =
      _$FilterOptionalCopyWithImpl<$Res, FilterOptional>;
  @useResult
  $Res call(
      {String? aliasKey,
      String? key,
      dynamic value,
      String? value1,
      String? type,
      bool? applyAnd});
}

/// @nodoc
class _$FilterOptionalCopyWithImpl<$Res, $Val extends FilterOptional>
    implements $FilterOptionalCopyWith<$Res> {
  _$FilterOptionalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aliasKey = freezed,
    Object? key = freezed,
    Object? value = freezed,
    Object? value1 = freezed,
    Object? type = freezed,
    Object? applyAnd = freezed,
  }) {
    return _then(_value.copyWith(
      aliasKey: freezed == aliasKey
          ? _value.aliasKey
          : aliasKey // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      value1: freezed == value1
          ? _value.value1
          : value1 // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      applyAnd: freezed == applyAnd
          ? _value.applyAnd
          : applyAnd // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterOptionalImplCopyWith<$Res>
    implements $FilterOptionalCopyWith<$Res> {
  factory _$$FilterOptionalImplCopyWith(_$FilterOptionalImpl value,
          $Res Function(_$FilterOptionalImpl) then) =
      __$$FilterOptionalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? aliasKey,
      String? key,
      dynamic value,
      String? value1,
      String? type,
      bool? applyAnd});
}

/// @nodoc
class __$$FilterOptionalImplCopyWithImpl<$Res>
    extends _$FilterOptionalCopyWithImpl<$Res, _$FilterOptionalImpl>
    implements _$$FilterOptionalImplCopyWith<$Res> {
  __$$FilterOptionalImplCopyWithImpl(
      _$FilterOptionalImpl _value, $Res Function(_$FilterOptionalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aliasKey = freezed,
    Object? key = freezed,
    Object? value = freezed,
    Object? value1 = freezed,
    Object? type = freezed,
    Object? applyAnd = freezed,
  }) {
    return _then(_$FilterOptionalImpl(
      aliasKey: freezed == aliasKey
          ? _value.aliasKey
          : aliasKey // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value ? _value.value! : value,
      value1: freezed == value1
          ? _value.value1
          : value1 // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      applyAnd: freezed == applyAnd
          ? _value.applyAnd
          : applyAnd // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterOptionalImpl implements _FilterOptional {
  _$FilterOptionalImpl(
      {this.aliasKey,
      this.key,
      this.value,
      this.value1,
      this.type,
      this.applyAnd});

  factory _$FilterOptionalImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterOptionalImplFromJson(json);

  @override
  final String? aliasKey;
  @override
  final String? key;
  @override
  final dynamic value;
  @override
  final String? value1;
  @override
  final String? type;
  @override
  final bool? applyAnd;

  @override
  String toString() {
    return 'FilterOptional(aliasKey: $aliasKey, key: $key, value: $value, value1: $value1, type: $type, applyAnd: $applyAnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterOptionalImpl &&
            (identical(other.aliasKey, aliasKey) ||
                other.aliasKey == aliasKey) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.value1, value1) || other.value1 == value1) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.applyAnd, applyAnd) ||
                other.applyAnd == applyAnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aliasKey, key,
      const DeepCollectionEquality().hash(value), value1, type, applyAnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterOptionalImplCopyWith<_$FilterOptionalImpl> get copyWith =>
      __$$FilterOptionalImplCopyWithImpl<_$FilterOptionalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterOptionalImplToJson(
      this,
    );
  }
}

abstract class _FilterOptional implements FilterOptional {
  factory _FilterOptional(
      {final String? aliasKey,
      final String? key,
      final dynamic value,
      final String? value1,
      final String? type,
      final bool? applyAnd}) = _$FilterOptionalImpl;

  factory _FilterOptional.fromJson(Map<String, dynamic> json) =
      _$FilterOptionalImpl.fromJson;

  @override
  String? get aliasKey;
  @override
  String? get key;
  @override
  dynamic get value;
  @override
  String? get value1;
  @override
  String? get type;
  @override
  bool? get applyAnd;
  @override
  @JsonKey(ignore: true)
  _$$FilterOptionalImplCopyWith<_$FilterOptionalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
