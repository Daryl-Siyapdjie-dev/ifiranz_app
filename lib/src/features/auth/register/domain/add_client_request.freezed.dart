// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_client_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddClientRequest _$AddClientRequestFromJson(Map<String, dynamic> json) {
  return _AddClientRequest.fromJson(json);
}

/// @nodoc
mixin _$AddClientRequest {
  String get designation => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get adresse => throw _privateConstructorUsedError;
  String get localisationGps => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddClientRequestCopyWith<AddClientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddClientRequestCopyWith<$Res> {
  factory $AddClientRequestCopyWith(
          AddClientRequest value, $Res Function(AddClientRequest) then) =
      _$AddClientRequestCopyWithImpl<$Res, AddClientRequest>;
  @useResult
  $Res call(
      {String designation,
      String nom,
      String prenom,
      String phoneNumber,
      String adresse,
      String localisationGps,
      String user});
}

/// @nodoc
class _$AddClientRequestCopyWithImpl<$Res, $Val extends AddClientRequest>
    implements $AddClientRequestCopyWith<$Res> {
  _$AddClientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? nom = null,
    Object? prenom = null,
    Object? phoneNumber = null,
    Object? adresse = null,
    Object? localisationGps = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adresse: null == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String,
      localisationGps: null == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddClientRequestImplCopyWith<$Res>
    implements $AddClientRequestCopyWith<$Res> {
  factory _$$AddClientRequestImplCopyWith(_$AddClientRequestImpl value,
          $Res Function(_$AddClientRequestImpl) then) =
      __$$AddClientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String designation,
      String nom,
      String prenom,
      String phoneNumber,
      String adresse,
      String localisationGps,
      String user});
}

/// @nodoc
class __$$AddClientRequestImplCopyWithImpl<$Res>
    extends _$AddClientRequestCopyWithImpl<$Res, _$AddClientRequestImpl>
    implements _$$AddClientRequestImplCopyWith<$Res> {
  __$$AddClientRequestImplCopyWithImpl(_$AddClientRequestImpl _value,
      $Res Function(_$AddClientRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? nom = null,
    Object? prenom = null,
    Object? phoneNumber = null,
    Object? adresse = null,
    Object? localisationGps = null,
    Object? user = null,
  }) {
    return _then(_$AddClientRequestImpl(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adresse: null == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String,
      localisationGps: null == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddClientRequestImpl implements _AddClientRequest {
  _$AddClientRequestImpl(
      {this.designation = "costumer",
      required this.nom,
      required this.prenom,
      required this.phoneNumber,
      required this.adresse,
      required this.localisationGps,
      required this.user});

  factory _$AddClientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddClientRequestImplFromJson(json);

  @override
  @JsonKey()
  final String designation;
  @override
  final String nom;
  @override
  final String prenom;
  @override
  final String phoneNumber;
  @override
  final String adresse;
  @override
  final String localisationGps;
  @override
  final String user;

  @override
  String toString() {
    return 'AddClientRequest(designation: $designation, nom: $nom, prenom: $prenom, phoneNumber: $phoneNumber, adresse: $adresse, localisationGps: $localisationGps, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddClientRequestImpl &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.localisationGps, localisationGps) ||
                other.localisationGps == localisationGps) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, designation, nom, prenom,
      phoneNumber, adresse, localisationGps, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddClientRequestImplCopyWith<_$AddClientRequestImpl> get copyWith =>
      __$$AddClientRequestImplCopyWithImpl<_$AddClientRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddClientRequestImplToJson(
      this,
    );
  }
}

abstract class _AddClientRequest implements AddClientRequest {
  factory _AddClientRequest(
      {final String designation,
      required final String nom,
      required final String prenom,
      required final String phoneNumber,
      required final String adresse,
      required final String localisationGps,
      required final String user}) = _$AddClientRequestImpl;

  factory _AddClientRequest.fromJson(Map<String, dynamic> json) =
      _$AddClientRequestImpl.fromJson;

  @override
  String get designation;
  @override
  String get nom;
  @override
  String get prenom;
  @override
  String get phoneNumber;
  @override
  String get adresse;
  @override
  String get localisationGps;
  @override
  String get user;
  @override
  @JsonKey(ignore: true)
  _$$AddClientRequestImplCopyWith<_$AddClientRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
