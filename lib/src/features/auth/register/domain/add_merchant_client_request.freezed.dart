// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_merchant_client_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddMerchantClientRequest _$AddMerchantClientRequestFromJson(
    Map<String, dynamic> json) {
  return _AddMerchantClientRequest.fromJson(json);
}

/// @nodoc
mixin _$AddMerchantClientRequest {
  String get designation => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  Merchant get marchant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddMerchantClientRequestCopyWith<AddMerchantClientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMerchantClientRequestCopyWith<$Res> {
  factory $AddMerchantClientRequestCopyWith(AddMerchantClientRequest value,
          $Res Function(AddMerchantClientRequest) then) =
      _$AddMerchantClientRequestCopyWithImpl<$Res, AddMerchantClientRequest>;
  @useResult
  $Res call(
      {String designation,
      String name,
      String email,
      String phone,
      Merchant marchant});

  $MerchantCopyWith<$Res> get marchant;
}

/// @nodoc
class _$AddMerchantClientRequestCopyWithImpl<$Res,
        $Val extends AddMerchantClientRequest>
    implements $AddMerchantClientRequestCopyWith<$Res> {
  _$AddMerchantClientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? marchant = null,
  }) {
    return _then(_value.copyWith(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      marchant: null == marchant
          ? _value.marchant
          : marchant // ignore: cast_nullable_to_non_nullable
              as Merchant,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MerchantCopyWith<$Res> get marchant {
    return $MerchantCopyWith<$Res>(_value.marchant, (value) {
      return _then(_value.copyWith(marchant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddMerchantClientRequestImplCopyWith<$Res>
    implements $AddMerchantClientRequestCopyWith<$Res> {
  factory _$$AddMerchantClientRequestImplCopyWith(
          _$AddMerchantClientRequestImpl value,
          $Res Function(_$AddMerchantClientRequestImpl) then) =
      __$$AddMerchantClientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String designation,
      String name,
      String email,
      String phone,
      Merchant marchant});

  @override
  $MerchantCopyWith<$Res> get marchant;
}

/// @nodoc
class __$$AddMerchantClientRequestImplCopyWithImpl<$Res>
    extends _$AddMerchantClientRequestCopyWithImpl<$Res,
        _$AddMerchantClientRequestImpl>
    implements _$$AddMerchantClientRequestImplCopyWith<$Res> {
  __$$AddMerchantClientRequestImplCopyWithImpl(
      _$AddMerchantClientRequestImpl _value,
      $Res Function(_$AddMerchantClientRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? marchant = null,
  }) {
    return _then(_$AddMerchantClientRequestImpl(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      marchant: null == marchant
          ? _value.marchant
          : marchant // ignore: cast_nullable_to_non_nullable
              as Merchant,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddMerchantClientRequestImpl implements _AddMerchantClientRequest {
  _$AddMerchantClientRequestImpl(
      {this.designation = "merchant_costumer",
      required this.name,
      required this.email,
      required this.phone,
      required this.marchant});

  factory _$AddMerchantClientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddMerchantClientRequestImplFromJson(json);

  @override
  @JsonKey()
  final String designation;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final Merchant marchant;

  @override
  String toString() {
    return 'AddMerchantClientRequest(designation: $designation, name: $name, email: $email, phone: $phone, marchant: $marchant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMerchantClientRequestImpl &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.marchant, marchant) ||
                other.marchant == marchant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, designation, name, email, phone, marchant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMerchantClientRequestImplCopyWith<_$AddMerchantClientRequestImpl>
      get copyWith => __$$AddMerchantClientRequestImplCopyWithImpl<
          _$AddMerchantClientRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddMerchantClientRequestImplToJson(
      this,
    );
  }
}

abstract class _AddMerchantClientRequest implements AddMerchantClientRequest {
  factory _AddMerchantClientRequest(
      {final String designation,
      required final String name,
      required final String email,
      required final String phone,
      required final Merchant marchant}) = _$AddMerchantClientRequestImpl;

  factory _AddMerchantClientRequest.fromJson(Map<String, dynamic> json) =
      _$AddMerchantClientRequestImpl.fromJson;

  @override
  String get designation;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  Merchant get marchant;
  @override
  @JsonKey(ignore: true)
  _$$AddMerchantClientRequestImplCopyWith<_$AddMerchantClientRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
