// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Arrondissement _$ArrondissementFromJson(Map<String, dynamic> json) {
  return _Arrondissement.fromJson(json);
}

/// @nodoc
mixin _$Arrondissement {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  double? get montant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArrondissementCopyWith<Arrondissement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArrondissementCopyWith<$Res> {
  factory $ArrondissementCopyWith(
          Arrondissement value, $Res Function(Arrondissement) then) =
      _$ArrondissementCopyWithImpl<$Res, Arrondissement>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      double? montant});
}

/// @nodoc
class _$ArrondissementCopyWithImpl<$Res, $Val extends Arrondissement>
    implements $ArrondissementCopyWith<$Res> {
  _$ArrondissementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? montant = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArrondissementImplCopyWith<$Res>
    implements $ArrondissementCopyWith<$Res> {
  factory _$$ArrondissementImplCopyWith(_$ArrondissementImpl value,
          $Res Function(_$ArrondissementImpl) then) =
      __$$ArrondissementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      double? montant});
}

/// @nodoc
class __$$ArrondissementImplCopyWithImpl<$Res>
    extends _$ArrondissementCopyWithImpl<$Res, _$ArrondissementImpl>
    implements _$$ArrondissementImplCopyWith<$Res> {
  __$$ArrondissementImplCopyWithImpl(
      _$ArrondissementImpl _value, $Res Function(_$ArrondissementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? montant = freezed,
  }) {
    return _then(_$ArrondissementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArrondissementImpl implements _Arrondissement {
  _$ArrondissementImpl(
      {this.id, this.version, this.code, this.designation, this.montant});

  factory _$ArrondissementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArrondissementImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final double? montant;

  @override
  String toString() {
    return 'Arrondissement(id: $id, version: $version, code: $code, designation: $designation, montant: $montant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArrondissementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.montant, montant) || other.montant == montant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, version, code, designation, montant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArrondissementImplCopyWith<_$ArrondissementImpl> get copyWith =>
      __$$ArrondissementImplCopyWithImpl<_$ArrondissementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArrondissementImplToJson(
      this,
    );
  }
}

abstract class _Arrondissement implements Arrondissement {
  factory _Arrondissement(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final double? montant}) = _$ArrondissementImpl;

  factory _Arrondissement.fromJson(Map<String, dynamic> json) =
      _$ArrondissementImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  double? get montant;
  @override
  @JsonKey(ignore: true)
  _$$ArrondissementImplCopyWith<_$ArrondissementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  bool? get valid => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<dynamic>? get validations => throw _privateConstructorUsedError;
  List<Records>? get recordss => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalElements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call(
      {bool? valid,
      String? message,
      List<dynamic>? validations,
      List<Records>? recordss,
      int? totalPages,
      int? totalElements});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = freezed,
    Object? message = freezed,
    Object? validations = freezed,
    Object? recordss = freezed,
    Object? totalPages = freezed,
    Object? totalElements = freezed,
  }) {
    return _then(_value.copyWith(
      valid: freezed == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      validations: freezed == validations
          ? _value.validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      recordss: freezed == recordss
          ? _value.recordss
          : recordss // ignore: cast_nullable_to_non_nullable
              as List<Records>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseImplCopyWith(
          _$ApiResponseImpl value, $Res Function(_$ApiResponseImpl) then) =
      __$$ApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? valid,
      String? message,
      List<dynamic>? validations,
      List<Records>? recordss,
      int? totalPages,
      int? totalElements});
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseImpl>
    implements _$$ApiResponseImplCopyWith<$Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl _value, $Res Function(_$ApiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = freezed,
    Object? message = freezed,
    Object? validations = freezed,
    Object? recordss = freezed,
    Object? totalPages = freezed,
    Object? totalElements = freezed,
  }) {
    return _then(_$ApiResponseImpl(
      valid: freezed == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      validations: freezed == validations
          ? _value._validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      recordss: freezed == recordss
          ? _value._recordss
          : recordss // ignore: cast_nullable_to_non_nullable
              as List<Records>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseImpl implements _ApiResponse {
  _$ApiResponseImpl(
      {this.valid,
      this.message,
      final List<dynamic>? validations,
      final List<Records>? recordss,
      this.totalPages,
      this.totalElements})
      : _validations = validations,
        _recordss = recordss;

  factory _$ApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseImplFromJson(json);

  @override
  final bool? valid;
  @override
  final String? message;
  final List<dynamic>? _validations;
  @override
  List<dynamic>? get validations {
    final value = _validations;
    if (value == null) return null;
    if (_validations is EqualUnmodifiableListView) return _validations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Records>? _recordss;
  @override
  List<Records>? get recordss {
    final value = _recordss;
    if (value == null) return null;
    if (_recordss is EqualUnmodifiableListView) return _recordss;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalPages;
  @override
  final int? totalElements;

  @override
  String toString() {
    return 'ApiResponse(valid: $valid, message: $message, validations: $validations, recordss: $recordss, totalPages: $totalPages, totalElements: $totalElements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._validations, _validations) &&
            const DeepCollectionEquality().equals(other._recordss, _recordss) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      valid,
      message,
      const DeepCollectionEquality().hash(_validations),
      const DeepCollectionEquality().hash(_recordss),
      totalPages,
      totalElements);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<_$ApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseImplToJson(
      this,
    );
  }
}

abstract class _ApiResponse implements ApiResponse {
  factory _ApiResponse(
      {final bool? valid,
      final String? message,
      final List<dynamic>? validations,
      final List<Records>? recordss,
      final int? totalPages,
      final int? totalElements}) = _$ApiResponseImpl;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$ApiResponseImpl.fromJson;

  @override
  bool? get valid;
  @override
  String? get message;
  @override
  List<dynamic>? get validations;
  @override
  List<Records>? get recordss;
  @override
  int? get totalPages;
  @override
  int? get totalElements;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Records _$RecordsFromJson(Map<String, dynamic> json) {
  return _Records.fromJson(json);
}

/// @nodoc
mixin _$Records {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  Livreur? get livreur => throw _privateConstructorUsedError;
  String? get dateLivraison => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  Commande? get commande => throw _privateConstructorUsedError;
  String? get localisationGps => throw _privateConstructorUsedError;
  String? get statut => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordsCopyWith<Records> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsCopyWith<$Res> {
  factory $RecordsCopyWith(Records value, $Res Function(Records) then) =
      _$RecordsCopyWithImpl<$Res, Records>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      Livreur? livreur,
      String? dateLivraison,
      double? latitude,
      double? longitude,
      Commande? commande,
      String? localisationGps,
      String? statut,
      String? url,
      String? otp});

  $LivreurCopyWith<$Res>? get livreur;
  $CommandeCopyWith<$Res>? get commande;
}

/// @nodoc
class _$RecordsCopyWithImpl<$Res, $Val extends Records>
    implements $RecordsCopyWith<$Res> {
  _$RecordsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? livreur = freezed,
    Object? dateLivraison = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? commande = freezed,
    Object? localisationGps = freezed,
    Object? statut = freezed,
    Object? url = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      livreur: freezed == livreur
          ? _value.livreur
          : livreur // ignore: cast_nullable_to_non_nullable
              as Livreur?,
      dateLivraison: freezed == dateLivraison
          ? _value.dateLivraison
          : dateLivraison // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      commande: freezed == commande
          ? _value.commande
          : commande // ignore: cast_nullable_to_non_nullable
              as Commande?,
      localisationGps: freezed == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String?,
      statut: freezed == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LivreurCopyWith<$Res>? get livreur {
    if (_value.livreur == null) {
      return null;
    }

    return $LivreurCopyWith<$Res>(_value.livreur!, (value) {
      return _then(_value.copyWith(livreur: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommandeCopyWith<$Res>? get commande {
    if (_value.commande == null) {
      return null;
    }

    return $CommandeCopyWith<$Res>(_value.commande!, (value) {
      return _then(_value.copyWith(commande: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecordsImplCopyWith<$Res> implements $RecordsCopyWith<$Res> {
  factory _$$RecordsImplCopyWith(
          _$RecordsImpl value, $Res Function(_$RecordsImpl) then) =
      __$$RecordsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      Livreur? livreur,
      String? dateLivraison,
      double? latitude,
      double? longitude,
      Commande? commande,
      String? localisationGps,
      String? statut,
      String? url,
      String? otp});

  @override
  $LivreurCopyWith<$Res>? get livreur;
  @override
  $CommandeCopyWith<$Res>? get commande;
}

/// @nodoc
class __$$RecordsImplCopyWithImpl<$Res>
    extends _$RecordsCopyWithImpl<$Res, _$RecordsImpl>
    implements _$$RecordsImplCopyWith<$Res> {
  __$$RecordsImplCopyWithImpl(
      _$RecordsImpl _value, $Res Function(_$RecordsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? livreur = freezed,
    Object? dateLivraison = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? commande = freezed,
    Object? localisationGps = freezed,
    Object? statut = freezed,
    Object? url = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$RecordsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      livreur: freezed == livreur
          ? _value.livreur
          : livreur // ignore: cast_nullable_to_non_nullable
              as Livreur?,
      dateLivraison: freezed == dateLivraison
          ? _value.dateLivraison
          : dateLivraison // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      commande: freezed == commande
          ? _value.commande
          : commande // ignore: cast_nullable_to_non_nullable
              as Commande?,
      localisationGps: freezed == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String?,
      statut: freezed == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordsImpl implements _Records {
  _$RecordsImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.livreur,
      this.dateLivraison,
      this.latitude,
      this.longitude,
      this.commande,
      this.localisationGps,
      this.statut,
      this.url,
      this.otp});

  factory _$RecordsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordsImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final Livreur? livreur;
  @override
  final String? dateLivraison;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final Commande? commande;
  @override
  final String? localisationGps;
  @override
  final String? statut;
  @override
  final String? url;
  @override
  final String? otp;

  @override
  String toString() {
    return 'Records(id: $id, version: $version, code: $code, designation: $designation, livreur: $livreur, dateLivraison: $dateLivraison, latitude: $latitude, longitude: $longitude, commande: $commande, localisationGps: $localisationGps, statut: $statut, url: $url, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.livreur, livreur) || other.livreur == livreur) &&
            (identical(other.dateLivraison, dateLivraison) ||
                other.dateLivraison == dateLivraison) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.commande, commande) ||
                other.commande == commande) &&
            (identical(other.localisationGps, localisationGps) ||
                other.localisationGps == localisationGps) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      code,
      designation,
      livreur,
      dateLivraison,
      latitude,
      longitude,
      commande,
      localisationGps,
      statut,
      url,
      otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordsImplCopyWith<_$RecordsImpl> get copyWith =>
      __$$RecordsImplCopyWithImpl<_$RecordsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordsImplToJson(
      this,
    );
  }
}

abstract class _Records implements Records {
  factory _Records(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final Livreur? livreur,
      final String? dateLivraison,
      final double? latitude,
      final double? longitude,
      final Commande? commande,
      final String? localisationGps,
      final String? statut,
      final String? url,
      final String? otp}) = _$RecordsImpl;

  factory _Records.fromJson(Map<String, dynamic> json) = _$RecordsImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  Livreur? get livreur;
  @override
  String? get dateLivraison;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  Commande? get commande;
  @override
  String? get localisationGps;
  @override
  String? get statut;
  @override
  String? get url;
  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$RecordsImplCopyWith<_$RecordsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Livreur _$LivreurFromJson(Map<String, dynamic> json) {
  return _Livreur.fromJson(json);
}

/// @nodoc
mixin _$Livreur {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get nom => throw _privateConstructorUsedError;
  String? get prenom => throw _privateConstructorUsedError;
  String? get adresse => throw _privateConstructorUsedError;
  String? get telephone1 => throw _privateConstructorUsedError;
  String? get telephone2 => throw _privateConstructorUsedError;
  String? get photoEncoded => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LivreurCopyWith<Livreur> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivreurCopyWith<$Res> {
  factory $LivreurCopyWith(Livreur value, $Res Function(Livreur) then) =
      _$LivreurCopyWithImpl<$Res, Livreur>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? nom,
      String? prenom,
      String? adresse,
      String? telephone1,
      String? telephone2,
      String? photoEncoded,
      String? format,
      String? image,
      String? url,
      String? user});
}

/// @nodoc
class _$LivreurCopyWithImpl<$Res, $Val extends Livreur>
    implements $LivreurCopyWith<$Res> {
  _$LivreurCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? adresse = freezed,
    Object? telephone1 = freezed,
    Object? telephone2 = freezed,
    Object? photoEncoded = freezed,
    Object? format = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone1: freezed == telephone1
          ? _value.telephone1
          : telephone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone2: freezed == telephone2
          ? _value.telephone2
          : telephone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      photoEncoded: freezed == photoEncoded
          ? _value.photoEncoded
          : photoEncoded // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LivreurImplCopyWith<$Res> implements $LivreurCopyWith<$Res> {
  factory _$$LivreurImplCopyWith(
          _$LivreurImpl value, $Res Function(_$LivreurImpl) then) =
      __$$LivreurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? nom,
      String? prenom,
      String? adresse,
      String? telephone1,
      String? telephone2,
      String? photoEncoded,
      String? format,
      String? image,
      String? url,
      String? user});
}

/// @nodoc
class __$$LivreurImplCopyWithImpl<$Res>
    extends _$LivreurCopyWithImpl<$Res, _$LivreurImpl>
    implements _$$LivreurImplCopyWith<$Res> {
  __$$LivreurImplCopyWithImpl(
      _$LivreurImpl _value, $Res Function(_$LivreurImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? adresse = freezed,
    Object? telephone1 = freezed,
    Object? telephone2 = freezed,
    Object? photoEncoded = freezed,
    Object? format = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? user = freezed,
  }) {
    return _then(_$LivreurImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone1: freezed == telephone1
          ? _value.telephone1
          : telephone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone2: freezed == telephone2
          ? _value.telephone2
          : telephone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      photoEncoded: freezed == photoEncoded
          ? _value.photoEncoded
          : photoEncoded // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LivreurImpl implements _Livreur {
  _$LivreurImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.nom,
      this.prenom,
      this.adresse,
      this.telephone1,
      this.telephone2,
      this.photoEncoded,
      this.format,
      this.image,
      this.url,
      this.user});

  factory _$LivreurImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivreurImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final String? nom;
  @override
  final String? prenom;
  @override
  final String? adresse;
  @override
  final String? telephone1;
  @override
  final String? telephone2;
  @override
  final String? photoEncoded;
  @override
  final String? format;
  @override
  final String? image;
  @override
  final String? url;
  @override
  final String? user;

  @override
  String toString() {
    return 'Livreur(id: $id, version: $version, code: $code, designation: $designation, nom: $nom, prenom: $prenom, adresse: $adresse, telephone1: $telephone1, telephone2: $telephone2, photoEncoded: $photoEncoded, format: $format, image: $image, url: $url, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivreurImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.telephone1, telephone1) ||
                other.telephone1 == telephone1) &&
            (identical(other.telephone2, telephone2) ||
                other.telephone2 == telephone2) &&
            (identical(other.photoEncoded, photoEncoded) ||
                other.photoEncoded == photoEncoded) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      code,
      designation,
      nom,
      prenom,
      adresse,
      telephone1,
      telephone2,
      photoEncoded,
      format,
      image,
      url,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LivreurImplCopyWith<_$LivreurImpl> get copyWith =>
      __$$LivreurImplCopyWithImpl<_$LivreurImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LivreurImplToJson(
      this,
    );
  }
}

abstract class _Livreur implements Livreur {
  factory _Livreur(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final String? nom,
      final String? prenom,
      final String? adresse,
      final String? telephone1,
      final String? telephone2,
      final String? photoEncoded,
      final String? format,
      final String? image,
      final String? url,
      final String? user}) = _$LivreurImpl;

  factory _Livreur.fromJson(Map<String, dynamic> json) = _$LivreurImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  String? get nom;
  @override
  String? get prenom;
  @override
  String? get adresse;
  @override
  String? get telephone1;
  @override
  String? get telephone2;
  @override
  String? get photoEncoded;
  @override
  String? get format;
  @override
  String? get image;
  @override
  String? get url;
  @override
  String? get user;
  @override
  @JsonKey(ignore: true)
  _$$LivreurImplCopyWith<_$LivreurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Commande _$CommandeFromJson(Map<String, dynamic> json) {
  return _Commande.fromJson(json);
}

/// @nodoc
mixin _$Commande {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get localisationGps => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  List<Article>? get articles => throw _privateConstructorUsedError;
  double? get montant => throw _privateConstructorUsedError;
  String? get statut => throw _privateConstructorUsedError;
  Client? get client => throw _privateConstructorUsedError;
  String? get codeLivraison => throw _privateConstructorUsedError;
  Quartier? get quartier => throw _privateConstructorUsedError;
  double? get montantLivraison => throw _privateConstructorUsedError;
  double? get montantTotal => throw _privateConstructorUsedError;
  String? get modePayement => throw _privateConstructorUsedError;
  String? get pourMarchand => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandeCopyWith<Commande> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandeCopyWith<$Res> {
  factory $CommandeCopyWith(Commande value, $Res Function(Commande) then) =
      _$CommandeCopyWithImpl<$Res, Commande>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? localisationGps,
      String? transactionId,
      List<Article>? articles,
      double? montant,
      String? statut,
      Client? client,
      String? codeLivraison,
      Quartier? quartier,
      double? montantLivraison,
      double? montantTotal,
      String? modePayement,
      String? pourMarchand});

  $ClientCopyWith<$Res>? get client;
  $QuartierCopyWith<$Res>? get quartier;
}

/// @nodoc
class _$CommandeCopyWithImpl<$Res, $Val extends Commande>
    implements $CommandeCopyWith<$Res> {
  _$CommandeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? localisationGps = freezed,
    Object? transactionId = freezed,
    Object? articles = freezed,
    Object? montant = freezed,
    Object? statut = freezed,
    Object? client = freezed,
    Object? codeLivraison = freezed,
    Object? quartier = freezed,
    Object? montantLivraison = freezed,
    Object? montantTotal = freezed,
    Object? modePayement = freezed,
    Object? pourMarchand = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      localisationGps: freezed == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
      statut: freezed == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      codeLivraison: freezed == codeLivraison
          ? _value.codeLivraison
          : codeLivraison // ignore: cast_nullable_to_non_nullable
              as String?,
      quartier: freezed == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as Quartier?,
      montantLivraison: freezed == montantLivraison
          ? _value.montantLivraison
          : montantLivraison // ignore: cast_nullable_to_non_nullable
              as double?,
      montantTotal: freezed == montantTotal
          ? _value.montantTotal
          : montantTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      modePayement: freezed == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String?,
      pourMarchand: freezed == pourMarchand
          ? _value.pourMarchand
          : pourMarchand // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res>? get client {
    if (_value.client == null) {
      return null;
    }

    return $ClientCopyWith<$Res>(_value.client!, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuartierCopyWith<$Res>? get quartier {
    if (_value.quartier == null) {
      return null;
    }

    return $QuartierCopyWith<$Res>(_value.quartier!, (value) {
      return _then(_value.copyWith(quartier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommandeImplCopyWith<$Res>
    implements $CommandeCopyWith<$Res> {
  factory _$$CommandeImplCopyWith(
          _$CommandeImpl value, $Res Function(_$CommandeImpl) then) =
      __$$CommandeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? localisationGps,
      String? transactionId,
      List<Article>? articles,
      double? montant,
      String? statut,
      Client? client,
      String? codeLivraison,
      Quartier? quartier,
      double? montantLivraison,
      double? montantTotal,
      String? modePayement,
      String? pourMarchand});

  @override
  $ClientCopyWith<$Res>? get client;
  @override
  $QuartierCopyWith<$Res>? get quartier;
}

/// @nodoc
class __$$CommandeImplCopyWithImpl<$Res>
    extends _$CommandeCopyWithImpl<$Res, _$CommandeImpl>
    implements _$$CommandeImplCopyWith<$Res> {
  __$$CommandeImplCopyWithImpl(
      _$CommandeImpl _value, $Res Function(_$CommandeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? localisationGps = freezed,
    Object? transactionId = freezed,
    Object? articles = freezed,
    Object? montant = freezed,
    Object? statut = freezed,
    Object? client = freezed,
    Object? codeLivraison = freezed,
    Object? quartier = freezed,
    Object? montantLivraison = freezed,
    Object? montantTotal = freezed,
    Object? modePayement = freezed,
    Object? pourMarchand = freezed,
  }) {
    return _then(_$CommandeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      localisationGps: freezed == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
      statut: freezed == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      codeLivraison: freezed == codeLivraison
          ? _value.codeLivraison
          : codeLivraison // ignore: cast_nullable_to_non_nullable
              as String?,
      quartier: freezed == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as Quartier?,
      montantLivraison: freezed == montantLivraison
          ? _value.montantLivraison
          : montantLivraison // ignore: cast_nullable_to_non_nullable
              as double?,
      montantTotal: freezed == montantTotal
          ? _value.montantTotal
          : montantTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      modePayement: freezed == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String?,
      pourMarchand: freezed == pourMarchand
          ? _value.pourMarchand
          : pourMarchand // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommandeImpl implements _Commande {
  _$CommandeImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.localisationGps,
      this.transactionId,
      final List<Article>? articles,
      this.montant,
      this.statut,
      this.client,
      this.codeLivraison,
      this.quartier,
      this.montantLivraison,
      this.montantTotal,
      this.modePayement,
      this.pourMarchand})
      : _articles = articles;

  factory _$CommandeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommandeImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final String? localisationGps;
  @override
  final String? transactionId;
  final List<Article>? _articles;
  @override
  List<Article>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? montant;
  @override
  final String? statut;
  @override
  final Client? client;
  @override
  final String? codeLivraison;
  @override
  final Quartier? quartier;
  @override
  final double? montantLivraison;
  @override
  final double? montantTotal;
  @override
  final String? modePayement;
  @override
  final String? pourMarchand;

  @override
  String toString() {
    return 'Commande(id: $id, version: $version, code: $code, designation: $designation, localisationGps: $localisationGps, transactionId: $transactionId, articles: $articles, montant: $montant, statut: $statut, client: $client, codeLivraison: $codeLivraison, quartier: $quartier, montantLivraison: $montantLivraison, montantTotal: $montantTotal, modePayement: $modePayement, pourMarchand: $pourMarchand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.localisationGps, localisationGps) ||
                other.localisationGps == localisationGps) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.codeLivraison, codeLivraison) ||
                other.codeLivraison == codeLivraison) &&
            (identical(other.quartier, quartier) ||
                other.quartier == quartier) &&
            (identical(other.montantLivraison, montantLivraison) ||
                other.montantLivraison == montantLivraison) &&
            (identical(other.montantTotal, montantTotal) ||
                other.montantTotal == montantTotal) &&
            (identical(other.modePayement, modePayement) ||
                other.modePayement == modePayement) &&
            (identical(other.pourMarchand, pourMarchand) ||
                other.pourMarchand == pourMarchand));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      code,
      designation,
      localisationGps,
      transactionId,
      const DeepCollectionEquality().hash(_articles),
      montant,
      statut,
      client,
      codeLivraison,
      quartier,
      montantLivraison,
      montantTotal,
      modePayement,
      pourMarchand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandeImplCopyWith<_$CommandeImpl> get copyWith =>
      __$$CommandeImplCopyWithImpl<_$CommandeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommandeImplToJson(
      this,
    );
  }
}

abstract class _Commande implements Commande {
  factory _Commande(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final String? localisationGps,
      final String? transactionId,
      final List<Article>? articles,
      final double? montant,
      final String? statut,
      final Client? client,
      final String? codeLivraison,
      final Quartier? quartier,
      final double? montantLivraison,
      final double? montantTotal,
      final String? modePayement,
      final String? pourMarchand}) = _$CommandeImpl;

  factory _Commande.fromJson(Map<String, dynamic> json) =
      _$CommandeImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  String? get localisationGps;
  @override
  String? get transactionId;
  @override
  List<Article>? get articles;
  @override
  double? get montant;
  @override
  String? get statut;
  @override
  Client? get client;
  @override
  String? get codeLivraison;
  @override
  Quartier? get quartier;
  @override
  double? get montantLivraison;
  @override
  double? get montantTotal;
  @override
  String? get modePayement;
  @override
  String? get pourMarchand;
  @override
  @JsonKey(ignore: true)
  _$$CommandeImplCopyWith<_$CommandeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  ArticleDetail? get article => throw _privateConstructorUsedError;
  double? get quantite => throw _privateConstructorUsedError;
  double? get montant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      ArticleDetail? article,
      double? quantite,
      double? montant});

  $ArticleDetailCopyWith<$Res>? get article;
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? article = freezed,
    Object? quantite = freezed,
    Object? montant = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArticleDetail?,
      quantite: freezed == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as double?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArticleDetailCopyWith<$Res>? get article {
    if (_value.article == null) {
      return null;
    }

    return $ArticleDetailCopyWith<$Res>(_value.article!, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleImplCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$ArticleImplCopyWith(
          _$ArticleImpl value, $Res Function(_$ArticleImpl) then) =
      __$$ArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      ArticleDetail? article,
      double? quantite,
      double? montant});

  @override
  $ArticleDetailCopyWith<$Res>? get article;
}

/// @nodoc
class __$$ArticleImplCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$ArticleImpl>
    implements _$$ArticleImplCopyWith<$Res> {
  __$$ArticleImplCopyWithImpl(
      _$ArticleImpl _value, $Res Function(_$ArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? article = freezed,
    Object? quantite = freezed,
    Object? montant = freezed,
  }) {
    return _then(_$ArticleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArticleDetail?,
      quantite: freezed == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as double?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleImpl implements _Article {
  _$ArticleImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.article,
      this.quantite,
      this.montant});

  factory _$ArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final ArticleDetail? article;
  @override
  final double? quantite;
  @override
  final double? montant;

  @override
  String toString() {
    return 'Article(id: $id, version: $version, code: $code, designation: $designation, article: $article, quantite: $quantite, montant: $montant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.article, article) || other.article == article) &&
            (identical(other.quantite, quantite) ||
                other.quantite == quantite) &&
            (identical(other.montant, montant) || other.montant == montant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, version, code, designation, article, quantite, montant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      __$$ArticleImplCopyWithImpl<_$ArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleImplToJson(
      this,
    );
  }
}

abstract class _Article implements Article {
  factory _Article(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final ArticleDetail? article,
      final double? quantite,
      final double? montant}) = _$ArticleImpl;

  factory _Article.fromJson(Map<String, dynamic> json) = _$ArticleImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  ArticleDetail? get article;
  @override
  double? get quantite;
  @override
  double? get montant;
  @override
  @JsonKey(ignore: true)
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleDetail _$ArticleDetailFromJson(Map<String, dynamic> json) {
  return _ArticleDetail.fromJson(json);
}

/// @nodoc
mixin _$ArticleDetail {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  ArticleType? get type => throw _privateConstructorUsedError;
  Marchand? get marchand => throw _privateConstructorUsedError;
  double? get prix => throw _privateConstructorUsedError;
  int? get note => throw _privateConstructorUsedError;
  int? get rang => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get photoEncoded => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleDetailCopyWith<ArticleDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDetailCopyWith<$Res> {
  factory $ArticleDetailCopyWith(
          ArticleDetail value, $Res Function(ArticleDetail) then) =
      _$ArticleDetailCopyWithImpl<$Res, ArticleDetail>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      ArticleType? type,
      Marchand? marchand,
      double? prix,
      int? note,
      int? rang,
      String? format,
      String? image,
      String? photoEncoded,
      String? url});

  $ArticleTypeCopyWith<$Res>? get type;
  $MarchandCopyWith<$Res>? get marchand;
}

/// @nodoc
class _$ArticleDetailCopyWithImpl<$Res, $Val extends ArticleDetail>
    implements $ArticleDetailCopyWith<$Res> {
  _$ArticleDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? type = freezed,
    Object? marchand = freezed,
    Object? prix = freezed,
    Object? note = freezed,
    Object? rang = freezed,
    Object? format = freezed,
    Object? image = freezed,
    Object? photoEncoded = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ArticleType?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as Marchand?,
      prix: freezed == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as int?,
      rang: freezed == rang
          ? _value.rang
          : rang // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      photoEncoded: freezed == photoEncoded
          ? _value.photoEncoded
          : photoEncoded // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArticleTypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $ArticleTypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MarchandCopyWith<$Res>? get marchand {
    if (_value.marchand == null) {
      return null;
    }

    return $MarchandCopyWith<$Res>(_value.marchand!, (value) {
      return _then(_value.copyWith(marchand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleDetailImplCopyWith<$Res>
    implements $ArticleDetailCopyWith<$Res> {
  factory _$$ArticleDetailImplCopyWith(
          _$ArticleDetailImpl value, $Res Function(_$ArticleDetailImpl) then) =
      __$$ArticleDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      ArticleType? type,
      Marchand? marchand,
      double? prix,
      int? note,
      int? rang,
      String? format,
      String? image,
      String? photoEncoded,
      String? url});

  @override
  $ArticleTypeCopyWith<$Res>? get type;
  @override
  $MarchandCopyWith<$Res>? get marchand;
}

/// @nodoc
class __$$ArticleDetailImplCopyWithImpl<$Res>
    extends _$ArticleDetailCopyWithImpl<$Res, _$ArticleDetailImpl>
    implements _$$ArticleDetailImplCopyWith<$Res> {
  __$$ArticleDetailImplCopyWithImpl(
      _$ArticleDetailImpl _value, $Res Function(_$ArticleDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? type = freezed,
    Object? marchand = freezed,
    Object? prix = freezed,
    Object? note = freezed,
    Object? rang = freezed,
    Object? format = freezed,
    Object? image = freezed,
    Object? photoEncoded = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ArticleDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ArticleType?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as Marchand?,
      prix: freezed == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as int?,
      rang: freezed == rang
          ? _value.rang
          : rang // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      photoEncoded: freezed == photoEncoded
          ? _value.photoEncoded
          : photoEncoded // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleDetailImpl implements _ArticleDetail {
  _$ArticleDetailImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.type,
      this.marchand,
      this.prix,
      this.note,
      this.rang,
      this.format,
      this.image,
      this.photoEncoded,
      this.url});

  factory _$ArticleDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final ArticleType? type;
  @override
  final Marchand? marchand;
  @override
  final double? prix;
  @override
  final int? note;
  @override
  final int? rang;
  @override
  final String? format;
  @override
  final String? image;
  @override
  final String? photoEncoded;
  @override
  final String? url;

  @override
  String toString() {
    return 'ArticleDetail(id: $id, version: $version, code: $code, designation: $designation, type: $type, marchand: $marchand, prix: $prix, note: $note, rang: $rang, format: $format, image: $image, photoEncoded: $photoEncoded, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.marchand, marchand) ||
                other.marchand == marchand) &&
            (identical(other.prix, prix) || other.prix == prix) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.rang, rang) || other.rang == rang) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.photoEncoded, photoEncoded) ||
                other.photoEncoded == photoEncoded) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, version, code, designation,
      type, marchand, prix, note, rang, format, image, photoEncoded, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleDetailImplCopyWith<_$ArticleDetailImpl> get copyWith =>
      __$$ArticleDetailImplCopyWithImpl<_$ArticleDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleDetailImplToJson(
      this,
    );
  }
}

abstract class _ArticleDetail implements ArticleDetail {
  factory _ArticleDetail(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final ArticleType? type,
      final Marchand? marchand,
      final double? prix,
      final int? note,
      final int? rang,
      final String? format,
      final String? image,
      final String? photoEncoded,
      final String? url}) = _$ArticleDetailImpl;

  factory _ArticleDetail.fromJson(Map<String, dynamic> json) =
      _$ArticleDetailImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  ArticleType? get type;
  @override
  Marchand? get marchand;
  @override
  double? get prix;
  @override
  int? get note;
  @override
  int? get rang;
  @override
  String? get format;
  @override
  String? get image;
  @override
  String? get photoEncoded;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ArticleDetailImplCopyWith<_$ArticleDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleType _$ArticleTypeFromJson(Map<String, dynamic> json) {
  return _ArticleType.fromJson(json);
}

/// @nodoc
mixin _$ArticleType {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleTypeCopyWith<ArticleType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleTypeCopyWith<$Res> {
  factory $ArticleTypeCopyWith(
          ArticleType value, $Res Function(ArticleType) then) =
      _$ArticleTypeCopyWithImpl<$Res, ArticleType>;
  @useResult
  $Res call({int? id, int? version, String? code, String? designation});
}

/// @nodoc
class _$ArticleTypeCopyWithImpl<$Res, $Val extends ArticleType>
    implements $ArticleTypeCopyWith<$Res> {
  _$ArticleTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleTypeImplCopyWith<$Res>
    implements $ArticleTypeCopyWith<$Res> {
  factory _$$ArticleTypeImplCopyWith(
          _$ArticleTypeImpl value, $Res Function(_$ArticleTypeImpl) then) =
      __$$ArticleTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? version, String? code, String? designation});
}

/// @nodoc
class __$$ArticleTypeImplCopyWithImpl<$Res>
    extends _$ArticleTypeCopyWithImpl<$Res, _$ArticleTypeImpl>
    implements _$$ArticleTypeImplCopyWith<$Res> {
  __$$ArticleTypeImplCopyWithImpl(
      _$ArticleTypeImpl _value, $Res Function(_$ArticleTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
  }) {
    return _then(_$ArticleTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleTypeImpl implements _ArticleType {
  _$ArticleTypeImpl({this.id, this.version, this.code, this.designation});

  factory _$ArticleTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleTypeImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;

  @override
  String toString() {
    return 'ArticleType(id: $id, version: $version, code: $code, designation: $designation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, version, code, designation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleTypeImplCopyWith<_$ArticleTypeImpl> get copyWith =>
      __$$ArticleTypeImplCopyWithImpl<_$ArticleTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleTypeImplToJson(
      this,
    );
  }
}

abstract class _ArticleType implements ArticleType {
  factory _ArticleType(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation}) = _$ArticleTypeImpl;

  factory _ArticleType.fromJson(Map<String, dynamic> json) =
      _$ArticleTypeImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  @JsonKey(ignore: true)
  _$$ArticleTypeImplCopyWith<_$ArticleTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Marchand _$MarchandFromJson(Map<String, dynamic> json) {
  return _Marchand.fromJson(json);
}

/// @nodoc
mixin _$Marchand {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get adresse => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  dynamic get longitude => throw _privateConstructorUsedError;
  String? get telephone1 => throw _privateConstructorUsedError;
  String? get telephone2 => throw _privateConstructorUsedError;
  List<dynamic>? get articles => throw _privateConstructorUsedError;
  List<dynamic>? get clients => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get photoEncoded => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarchandCopyWith<Marchand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarchandCopyWith<$Res> {
  factory $MarchandCopyWith(Marchand value, $Res Function(Marchand) then) =
      _$MarchandCopyWithImpl<$Res, Marchand>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? adresse,
      double? latitude,
      dynamic longitude,
      String? telephone1,
      String? telephone2,
      List<dynamic>? articles,
      List<dynamic>? clients,
      String? user,
      String? photoEncoded,
      String? format,
      String? type});
}

/// @nodoc
class _$MarchandCopyWithImpl<$Res, $Val extends Marchand>
    implements $MarchandCopyWith<$Res> {
  _$MarchandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? adresse = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? telephone1 = freezed,
    Object? telephone2 = freezed,
    Object? articles = freezed,
    Object? clients = freezed,
    Object? user = freezed,
    Object? photoEncoded = freezed,
    Object? format = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      telephone1: freezed == telephone1
          ? _value.telephone1
          : telephone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone2: freezed == telephone2
          ? _value.telephone2
          : telephone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      clients: freezed == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      photoEncoded: freezed == photoEncoded
          ? _value.photoEncoded
          : photoEncoded // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarchandImplCopyWith<$Res>
    implements $MarchandCopyWith<$Res> {
  factory _$$MarchandImplCopyWith(
          _$MarchandImpl value, $Res Function(_$MarchandImpl) then) =
      __$$MarchandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? adresse,
      double? latitude,
      dynamic longitude,
      String? telephone1,
      String? telephone2,
      List<dynamic>? articles,
      List<dynamic>? clients,
      String? user,
      String? photoEncoded,
      String? format,
      String? type});
}

/// @nodoc
class __$$MarchandImplCopyWithImpl<$Res>
    extends _$MarchandCopyWithImpl<$Res, _$MarchandImpl>
    implements _$$MarchandImplCopyWith<$Res> {
  __$$MarchandImplCopyWithImpl(
      _$MarchandImpl _value, $Res Function(_$MarchandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? adresse = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? telephone1 = freezed,
    Object? telephone2 = freezed,
    Object? articles = freezed,
    Object? clients = freezed,
    Object? user = freezed,
    Object? photoEncoded = freezed,
    Object? format = freezed,
    Object? type = freezed,
  }) {
    return _then(_$MarchandImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude ? _value.longitude! : longitude,
      telephone1: freezed == telephone1
          ? _value.telephone1
          : telephone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone2: freezed == telephone2
          ? _value.telephone2
          : telephone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      clients: freezed == clients
          ? _value._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      photoEncoded: freezed == photoEncoded
          ? _value.photoEncoded
          : photoEncoded // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarchandImpl implements _Marchand {
  _$MarchandImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.adresse,
      this.latitude,
      this.longitude,
      this.telephone1,
      this.telephone2,
      final List<dynamic>? articles,
      final List<dynamic>? clients,
      this.user,
      this.photoEncoded,
      this.format,
      this.type})
      : _articles = articles,
        _clients = clients;

  factory _$MarchandImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarchandImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final String? adresse;
  @override
  final double? latitude;
  @override
  final dynamic longitude;
  @override
  final String? telephone1;
  @override
  final String? telephone2;
  final List<dynamic>? _articles;
  @override
  List<dynamic>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _clients;
  @override
  List<dynamic>? get clients {
    final value = _clients;
    if (value == null) return null;
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? user;
  @override
  final String? photoEncoded;
  @override
  final String? format;
  @override
  final String? type;

  @override
  String toString() {
    return 'Marchand(id: $id, version: $version, code: $code, designation: $designation, adresse: $adresse, latitude: $latitude, longitude: $longitude, telephone1: $telephone1, telephone2: $telephone2, articles: $articles, clients: $clients, user: $user, photoEncoded: $photoEncoded, format: $format, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarchandImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            (identical(other.telephone1, telephone1) ||
                other.telephone1 == telephone1) &&
            (identical(other.telephone2, telephone2) ||
                other.telephone2 == telephone2) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.photoEncoded, photoEncoded) ||
                other.photoEncoded == photoEncoded) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      code,
      designation,
      adresse,
      latitude,
      const DeepCollectionEquality().hash(longitude),
      telephone1,
      telephone2,
      const DeepCollectionEquality().hash(_articles),
      const DeepCollectionEquality().hash(_clients),
      user,
      photoEncoded,
      format,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarchandImplCopyWith<_$MarchandImpl> get copyWith =>
      __$$MarchandImplCopyWithImpl<_$MarchandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarchandImplToJson(
      this,
    );
  }
}

abstract class _Marchand implements Marchand {
  factory _Marchand(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final String? adresse,
      final double? latitude,
      final dynamic longitude,
      final String? telephone1,
      final String? telephone2,
      final List<dynamic>? articles,
      final List<dynamic>? clients,
      final String? user,
      final String? photoEncoded,
      final String? format,
      final String? type}) = _$MarchandImpl;

  factory _Marchand.fromJson(Map<String, dynamic> json) =
      _$MarchandImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  String? get adresse;
  @override
  double? get latitude;
  @override
  dynamic get longitude;
  @override
  String? get telephone1;
  @override
  String? get telephone2;
  @override
  List<dynamic>? get articles;
  @override
  List<dynamic>? get clients;
  @override
  String? get user;
  @override
  String? get photoEncoded;
  @override
  String? get format;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$MarchandImplCopyWith<_$MarchandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Quartier _$QuartierFromJson(Map<String, dynamic> json) {
  return _Quartier.fromJson(json);
}

/// @nodoc
mixin _$Quartier {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  Arrondissement? get arrondissement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuartierCopyWith<Quartier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuartierCopyWith<$Res> {
  factory $QuartierCopyWith(Quartier value, $Res Function(Quartier) then) =
      _$QuartierCopyWithImpl<$Res, Quartier>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      Arrondissement? arrondissement});

  $ArrondissementCopyWith<$Res>? get arrondissement;
}

/// @nodoc
class _$QuartierCopyWithImpl<$Res, $Val extends Quartier>
    implements $QuartierCopyWith<$Res> {
  _$QuartierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? arrondissement = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      arrondissement: freezed == arrondissement
          ? _value.arrondissement
          : arrondissement // ignore: cast_nullable_to_non_nullable
              as Arrondissement?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArrondissementCopyWith<$Res>? get arrondissement {
    if (_value.arrondissement == null) {
      return null;
    }

    return $ArrondissementCopyWith<$Res>(_value.arrondissement!, (value) {
      return _then(_value.copyWith(arrondissement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuartierImplCopyWith<$Res>
    implements $QuartierCopyWith<$Res> {
  factory _$$QuartierImplCopyWith(
          _$QuartierImpl value, $Res Function(_$QuartierImpl) then) =
      __$$QuartierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      Arrondissement? arrondissement});

  @override
  $ArrondissementCopyWith<$Res>? get arrondissement;
}

/// @nodoc
class __$$QuartierImplCopyWithImpl<$Res>
    extends _$QuartierCopyWithImpl<$Res, _$QuartierImpl>
    implements _$$QuartierImplCopyWith<$Res> {
  __$$QuartierImplCopyWithImpl(
      _$QuartierImpl _value, $Res Function(_$QuartierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? arrondissement = freezed,
  }) {
    return _then(_$QuartierImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      arrondissement: freezed == arrondissement
          ? _value.arrondissement
          : arrondissement // ignore: cast_nullable_to_non_nullable
              as Arrondissement?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuartierImpl implements _Quartier {
  _$QuartierImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.arrondissement});

  factory _$QuartierImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuartierImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final Arrondissement? arrondissement;

  @override
  String toString() {
    return 'Quartier(id: $id, version: $version, code: $code, designation: $designation, arrondissement: $arrondissement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuartierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.arrondissement, arrondissement) ||
                other.arrondissement == arrondissement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, version, code, designation, arrondissement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuartierImplCopyWith<_$QuartierImpl> get copyWith =>
      __$$QuartierImplCopyWithImpl<_$QuartierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuartierImplToJson(
      this,
    );
  }
}

abstract class _Quartier implements Quartier {
  factory _Quartier(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final Arrondissement? arrondissement}) = _$QuartierImpl;

  factory _Quartier.fromJson(Map<String, dynamic> json) =
      _$QuartierImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  Arrondissement? get arrondissement;
  @override
  @JsonKey(ignore: true)
  _$$QuartierImplCopyWith<_$QuartierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
