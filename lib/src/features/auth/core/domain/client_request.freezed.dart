// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientRequest _$ClientRequestFromJson(Map<String, dynamic> json) {
  return _ClientRequest.fromJson(json);
}

/// @nodoc
mixin _$ClientRequest {
  String get key => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientRequestCopyWith<ClientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientRequestCopyWith<$Res> {
  factory $ClientRequestCopyWith(
          ClientRequest value, $Res Function(ClientRequest) then) =
      _$ClientRequestCopyWithImpl<$Res, ClientRequest>;
  @useResult
  $Res call({String key, String? value, String type});
}

/// @nodoc
class _$ClientRequestCopyWithImpl<$Res, $Val extends ClientRequest>
    implements $ClientRequestCopyWith<$Res> {
  _$ClientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientRequestImplCopyWith<$Res>
    implements $ClientRequestCopyWith<$Res> {
  factory _$$ClientRequestImplCopyWith(
          _$ClientRequestImpl value, $Res Function(_$ClientRequestImpl) then) =
      __$$ClientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String? value, String type});
}

/// @nodoc
class __$$ClientRequestImplCopyWithImpl<$Res>
    extends _$ClientRequestCopyWithImpl<$Res, _$ClientRequestImpl>
    implements _$$ClientRequestImplCopyWith<$Res> {
  __$$ClientRequestImplCopyWithImpl(
      _$ClientRequestImpl _value, $Res Function(_$ClientRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = freezed,
    Object? type = null,
  }) {
    return _then(_$ClientRequestImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientRequestImpl implements _ClientRequest {
  _$ClientRequestImpl({this.key = "user", this.value, this.type = "EQUAL"});

  factory _$ClientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientRequestImplFromJson(json);

  @override
  @JsonKey()
  final String key;
  @override
  final String? value;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'ClientRequest(key: $key, value: $value, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientRequestImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, value, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientRequestImplCopyWith<_$ClientRequestImpl> get copyWith =>
      __$$ClientRequestImplCopyWithImpl<_$ClientRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientRequestImplToJson(
      this,
    );
  }
}

abstract class _ClientRequest implements ClientRequest {
  factory _ClientRequest(
      {final String key,
      final String? value,
      final String type}) = _$ClientRequestImpl;

  factory _ClientRequest.fromJson(Map<String, dynamic> json) =
      _$ClientRequestImpl.fromJson;

  @override
  String get key;
  @override
  String? get value;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ClientRequestImplCopyWith<_$ClientRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
