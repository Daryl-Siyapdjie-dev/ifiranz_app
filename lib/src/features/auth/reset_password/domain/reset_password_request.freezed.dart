// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordRequest {
  String get token => throw _privateConstructorUsedError;
  String get phoneOrEmail => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordRequestCopyWith<ResetPasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordRequestCopyWith<$Res> {
  factory $ResetPasswordRequestCopyWith(ResetPasswordRequest value,
          $Res Function(ResetPasswordRequest) then) =
      _$ResetPasswordRequestCopyWithImpl<$Res, ResetPasswordRequest>;
  @useResult
  $Res call({String token, String phoneOrEmail, String? password, String? otp});
}

/// @nodoc
class _$ResetPasswordRequestCopyWithImpl<$Res,
        $Val extends ResetPasswordRequest>
    implements $ResetPasswordRequestCopyWith<$Res> {
  _$ResetPasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phoneOrEmail = null,
    Object? password = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phoneOrEmail: null == phoneOrEmail
          ? _value.phoneOrEmail
          : phoneOrEmail // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordRequestImplCopyWith<$Res>
    implements $ResetPasswordRequestCopyWith<$Res> {
  factory _$$ResetPasswordRequestImplCopyWith(_$ResetPasswordRequestImpl value,
          $Res Function(_$ResetPasswordRequestImpl) then) =
      __$$ResetPasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String phoneOrEmail, String? password, String? otp});
}

/// @nodoc
class __$$ResetPasswordRequestImplCopyWithImpl<$Res>
    extends _$ResetPasswordRequestCopyWithImpl<$Res, _$ResetPasswordRequestImpl>
    implements _$$ResetPasswordRequestImplCopyWith<$Res> {
  __$$ResetPasswordRequestImplCopyWithImpl(_$ResetPasswordRequestImpl _value,
      $Res Function(_$ResetPasswordRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phoneOrEmail = null,
    Object? password = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$ResetPasswordRequestImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phoneOrEmail: null == phoneOrEmail
          ? _value.phoneOrEmail
          : phoneOrEmail // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordRequestImpl implements _ResetPasswordRequest {
  _$ResetPasswordRequestImpl(
      {required this.token,
      required this.phoneOrEmail,
      this.password,
      this.otp});

  @override
  final String token;
  @override
  final String phoneOrEmail;
  @override
  final String? password;
  @override
  final String? otp;

  @override
  String toString() {
    return 'ResetPasswordRequest(token: $token, phoneOrEmail: $phoneOrEmail, password: $password, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phoneOrEmail, phoneOrEmail) ||
                other.phoneOrEmail == phoneOrEmail) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, token, phoneOrEmail, password, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestImplCopyWith<_$ResetPasswordRequestImpl>
      get copyWith =>
          __$$ResetPasswordRequestImplCopyWithImpl<_$ResetPasswordRequestImpl>(
              this, _$identity);
}

abstract class _ResetPasswordRequest implements ResetPasswordRequest {
  factory _ResetPasswordRequest(
      {required final String token,
      required final String phoneOrEmail,
      final String? password,
      final String? otp}) = _$ResetPasswordRequestImpl;

  @override
  String get token;
  @override
  String get phoneOrEmail;
  @override
  String? get password;
  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordRequestImplCopyWith<_$ResetPasswordRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
