// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendOtpResponse {
  String get token => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendOtpResponseCopyWith<SendOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpResponseCopyWith<$Res> {
  factory $SendOtpResponseCopyWith(
          SendOtpResponse value, $Res Function(SendOtpResponse) then) =
      _$SendOtpResponseCopyWithImpl<$Res, SendOtpResponse>;
  @useResult
  $Res call({String token, String? otp});
}

/// @nodoc
class _$SendOtpResponseCopyWithImpl<$Res, $Val extends SendOtpResponse>
    implements $SendOtpResponseCopyWith<$Res> {
  _$SendOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendOtpResponseImplCopyWith<$Res>
    implements $SendOtpResponseCopyWith<$Res> {
  factory _$$SendOtpResponseImplCopyWith(_$SendOtpResponseImpl value,
          $Res Function(_$SendOtpResponseImpl) then) =
      __$$SendOtpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String? otp});
}

/// @nodoc
class __$$SendOtpResponseImplCopyWithImpl<$Res>
    extends _$SendOtpResponseCopyWithImpl<$Res, _$SendOtpResponseImpl>
    implements _$$SendOtpResponseImplCopyWith<$Res> {
  __$$SendOtpResponseImplCopyWithImpl(
      _$SendOtpResponseImpl _value, $Res Function(_$SendOtpResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? otp = freezed,
  }) {
    return _then(_$SendOtpResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SendOtpResponseImpl implements _SendOtpResponse {
  _$SendOtpResponseImpl({required this.token, this.otp});

  @override
  final String token;
  @override
  final String? otp;

  @override
  String toString() {
    return 'SendOtpResponse(token: $token, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpResponseImplCopyWith<_$SendOtpResponseImpl> get copyWith =>
      __$$SendOtpResponseImplCopyWithImpl<_$SendOtpResponseImpl>(
          this, _$identity);
}

abstract class _SendOtpResponse implements SendOtpResponse {
  factory _SendOtpResponse({required final String token, final String? otp}) =
      _$SendOtpResponseImpl;

  @override
  String get token;
  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$SendOtpResponseImplCopyWith<_$SendOtpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _ForgotPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordResponse {
  String? get timeStamp => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String? get httpStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordResponseCopyWith<ForgotPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordResponseCopyWith<$Res> {
  factory $ForgotPasswordResponseCopyWith(ForgotPasswordResponse value,
          $Res Function(ForgotPasswordResponse) then) =
      _$ForgotPasswordResponseCopyWithImpl<$Res, ForgotPasswordResponse>;
  @useResult
  $Res call(
      {String? timeStamp,
      int? statusCode,
      String? httpStatus,
      String? message});
}

/// @nodoc
class _$ForgotPasswordResponseCopyWithImpl<$Res,
        $Val extends ForgotPasswordResponse>
    implements $ForgotPasswordResponseCopyWith<$Res> {
  _$ForgotPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = freezed,
    Object? statusCode = freezed,
    Object? httpStatus = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordResponseImplCopyWith<$Res>
    implements $ForgotPasswordResponseCopyWith<$Res> {
  factory _$$ForgotPasswordResponseImplCopyWith(
          _$ForgotPasswordResponseImpl value,
          $Res Function(_$ForgotPasswordResponseImpl) then) =
      __$$ForgotPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? timeStamp,
      int? statusCode,
      String? httpStatus,
      String? message});
}

/// @nodoc
class __$$ForgotPasswordResponseImplCopyWithImpl<$Res>
    extends _$ForgotPasswordResponseCopyWithImpl<$Res,
        _$ForgotPasswordResponseImpl>
    implements _$$ForgotPasswordResponseImplCopyWith<$Res> {
  __$$ForgotPasswordResponseImplCopyWithImpl(
      _$ForgotPasswordResponseImpl _value,
      $Res Function(_$ForgotPasswordResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = freezed,
    Object? statusCode = freezed,
    Object? httpStatus = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ForgotPasswordResponseImpl(
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordResponseImpl extends _ForgotPasswordResponse {
  const _$ForgotPasswordResponseImpl(
      {this.timeStamp, this.statusCode, this.httpStatus, this.message})
      : super._();

  factory _$ForgotPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordResponseImplFromJson(json);

  @override
  final String? timeStamp;
  @override
  final int? statusCode;
  @override
  final String? httpStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'ForgotPasswordResponse(timeStamp: $timeStamp, statusCode: $statusCode, httpStatus: $httpStatus, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordResponseImpl &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timeStamp, statusCode, httpStatus, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordResponseImplCopyWith<_$ForgotPasswordResponseImpl>
      get copyWith => __$$ForgotPasswordResponseImplCopyWithImpl<
          _$ForgotPasswordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordResponse extends ForgotPasswordResponse {
  const factory _ForgotPasswordResponse(
      {final String? timeStamp,
      final int? statusCode,
      final String? httpStatus,
      final String? message}) = _$ForgotPasswordResponseImpl;
  const _ForgotPasswordResponse._() : super._();

  factory _ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordResponseImpl.fromJson;

  @override
  String? get timeStamp;
  @override
  int? get statusCode;
  @override
  String? get httpStatus;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordResponseImplCopyWith<_$ForgotPasswordResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return _Datas.fromJson(json);
}

/// @nodoc
mixin _$Datas {
  bool? get valid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatasCopyWith<Datas> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatasCopyWith<$Res> {
  factory $DatasCopyWith(Datas value, $Res Function(Datas) then) =
      _$DatasCopyWithImpl<$Res, Datas>;
  @useResult
  $Res call({bool? valid});
}

/// @nodoc
class _$DatasCopyWithImpl<$Res, $Val extends Datas>
    implements $DatasCopyWith<$Res> {
  _$DatasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = freezed,
  }) {
    return _then(_value.copyWith(
      valid: freezed == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatasImplCopyWith<$Res> implements $DatasCopyWith<$Res> {
  factory _$$DatasImplCopyWith(
          _$DatasImpl value, $Res Function(_$DatasImpl) then) =
      __$$DatasImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? valid});
}

/// @nodoc
class __$$DatasImplCopyWithImpl<$Res>
    extends _$DatasCopyWithImpl<$Res, _$DatasImpl>
    implements _$$DatasImplCopyWith<$Res> {
  __$$DatasImplCopyWithImpl(
      _$DatasImpl _value, $Res Function(_$DatasImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = freezed,
  }) {
    return _then(_$DatasImpl(
      valid: freezed == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatasImpl extends _Datas {
  const _$DatasImpl({this.valid}) : super._();

  factory _$DatasImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatasImplFromJson(json);

  @override
  final bool? valid;

  @override
  String toString() {
    return 'Datas(valid: $valid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatasImpl &&
            (identical(other.valid, valid) || other.valid == valid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, valid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatasImplCopyWith<_$DatasImpl> get copyWith =>
      __$$DatasImplCopyWithImpl<_$DatasImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatasImplToJson(
      this,
    );
  }
}

abstract class _Datas extends Datas {
  const factory _Datas({final bool? valid}) = _$DatasImpl;
  const _Datas._() : super._();

  factory _Datas.fromJson(Map<String, dynamic> json) = _$DatasImpl.fromJson;

  @override
  bool? get valid;
  @override
  @JsonKey(ignore: true)
  _$$DatasImplCopyWith<_$DatasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
