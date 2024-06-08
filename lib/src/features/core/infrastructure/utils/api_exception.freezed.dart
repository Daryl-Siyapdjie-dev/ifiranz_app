// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiException _$ApiExceptionFromJson(Map<String, dynamic> json) {
  return _ApiException.fromJson(json);
}

/// @nodoc
mixin _$ApiException {
  @JsonKey(name: 'statusCode')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get msg => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeStamp')
  String? get timeStamp => throw _privateConstructorUsedError;
  String? get httpStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiExceptionCopyWith<ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiExceptionCopyWith<$Res> {
  factory $ApiExceptionCopyWith(
          ApiException value, $Res Function(ApiException) then) =
      _$ApiExceptionCopyWithImpl<$Res, ApiException>;
  @useResult
  $Res call(
      {@JsonKey(name: 'statusCode') int? code,
      @JsonKey(name: 'message') String? msg,
      @JsonKey(name: 'timeStamp') String? timeStamp,
      String? httpStatus});
}

/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res, $Val extends ApiException>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
    Object? timeStamp = freezed,
    Object? httpStatus = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$ApiExceptionImplCopyWith(
          _$ApiExceptionImpl value, $Res Function(_$ApiExceptionImpl) then) =
      __$$ApiExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'statusCode') int? code,
      @JsonKey(name: 'message') String? msg,
      @JsonKey(name: 'timeStamp') String? timeStamp,
      String? httpStatus});
}

/// @nodoc
class __$$ApiExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$ApiExceptionImpl>
    implements _$$ApiExceptionImplCopyWith<$Res> {
  __$$ApiExceptionImplCopyWithImpl(
      _$ApiExceptionImpl _value, $Res Function(_$ApiExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
    Object? timeStamp = freezed,
    Object? httpStatus = freezed,
  }) {
    return _then(_$ApiExceptionImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiExceptionImpl extends _ApiException {
  const _$ApiExceptionImpl(
      {@JsonKey(name: 'statusCode') this.code,
      @JsonKey(name: 'message') this.msg,
      @JsonKey(name: 'timeStamp') this.timeStamp,
      this.httpStatus})
      : super._();

  factory _$ApiExceptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiExceptionImplFromJson(json);

  @override
  @JsonKey(name: 'statusCode')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? msg;
  @override
  @JsonKey(name: 'timeStamp')
  final String? timeStamp;
  @override
  final String? httpStatus;

  @override
  String toString() {
    return 'ApiException(code: $code, msg: $msg, timeStamp: $timeStamp, httpStatus: $httpStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiExceptionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, msg, timeStamp, httpStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiExceptionImplCopyWith<_$ApiExceptionImpl> get copyWith =>
      __$$ApiExceptionImplCopyWithImpl<_$ApiExceptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiExceptionImplToJson(
      this,
    );
  }
}

abstract class _ApiException extends ApiException {
  const factory _ApiException(
      {@JsonKey(name: 'statusCode') final int? code,
      @JsonKey(name: 'message') final String? msg,
      @JsonKey(name: 'timeStamp') final String? timeStamp,
      final String? httpStatus}) = _$ApiExceptionImpl;
  const _ApiException._() : super._();

  factory _ApiException.fromJson(Map<String, dynamic> json) =
      _$ApiExceptionImpl.fromJson;

  @override
  @JsonKey(name: 'statusCode')
  int? get code;
  @override
  @JsonKey(name: 'message')
  String? get msg;
  @override
  @JsonKey(name: 'timeStamp')
  String? get timeStamp;
  @override
  String? get httpStatus;
  @override
  @JsonKey(ignore: true)
  _$$ApiExceptionImplCopyWith<_$ApiExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
