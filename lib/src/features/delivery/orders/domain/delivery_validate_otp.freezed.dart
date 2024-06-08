// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_validate_otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryValidateOtp _$DeliveryValidateOtpFromJson(Map<String, dynamic> json) {
  return _DeliveryValidateOtp.fromJson(json);
}

/// @nodoc
mixin _$DeliveryValidateOtp {
  int get id => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryValidateOtpCopyWith<DeliveryValidateOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryValidateOtpCopyWith<$Res> {
  factory $DeliveryValidateOtpCopyWith(
          DeliveryValidateOtp value, $Res Function(DeliveryValidateOtp) then) =
      _$DeliveryValidateOtpCopyWithImpl<$Res, DeliveryValidateOtp>;
  @useResult
  $Res call({int id, int code});
}

/// @nodoc
class _$DeliveryValidateOtpCopyWithImpl<$Res, $Val extends DeliveryValidateOtp>
    implements $DeliveryValidateOtpCopyWith<$Res> {
  _$DeliveryValidateOtpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryValidateOtpImplCopyWith<$Res>
    implements $DeliveryValidateOtpCopyWith<$Res> {
  factory _$$DeliveryValidateOtpImplCopyWith(_$DeliveryValidateOtpImpl value,
          $Res Function(_$DeliveryValidateOtpImpl) then) =
      __$$DeliveryValidateOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int code});
}

/// @nodoc
class __$$DeliveryValidateOtpImplCopyWithImpl<$Res>
    extends _$DeliveryValidateOtpCopyWithImpl<$Res, _$DeliveryValidateOtpImpl>
    implements _$$DeliveryValidateOtpImplCopyWith<$Res> {
  __$$DeliveryValidateOtpImplCopyWithImpl(_$DeliveryValidateOtpImpl _value,
      $Res Function(_$DeliveryValidateOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
  }) {
    return _then(_$DeliveryValidateOtpImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryValidateOtpImpl implements _DeliveryValidateOtp {
  _$DeliveryValidateOtpImpl({required this.id, required this.code});

  factory _$DeliveryValidateOtpImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryValidateOtpImplFromJson(json);

  @override
  final int id;
  @override
  final int code;

  @override
  String toString() {
    return 'DeliveryValidateOtp(id: $id, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryValidateOtpImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryValidateOtpImplCopyWith<_$DeliveryValidateOtpImpl> get copyWith =>
      __$$DeliveryValidateOtpImplCopyWithImpl<_$DeliveryValidateOtpImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryValidateOtpImplToJson(
      this,
    );
  }
}

abstract class _DeliveryValidateOtp implements DeliveryValidateOtp {
  factory _DeliveryValidateOtp(
      {required final int id,
      required final int code}) = _$DeliveryValidateOtpImpl;

  factory _DeliveryValidateOtp.fromJson(Map<String, dynamic> json) =
      _$DeliveryValidateOtpImpl.fromJson;

  @override
  int get id;
  @override
  int get code;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryValidateOtpImplCopyWith<_$DeliveryValidateOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
