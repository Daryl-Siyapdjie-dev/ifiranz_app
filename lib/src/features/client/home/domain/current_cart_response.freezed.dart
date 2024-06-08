// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrentCartResponse _$CurrentCartResponseFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$CurrentCartResponse {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get localisationGps => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get dateCreate => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  List<OrderArticle> get articles => throw _privateConstructorUsedError;
  num? get montant => throw _privateConstructorUsedError;
  String? get statut => throw _privateConstructorUsedError;
  Client? get client => throw _privateConstructorUsedError;
  String? get codeLivraison => throw _privateConstructorUsedError;
  Quartier? get quartier => throw _privateConstructorUsedError;
  num? get montantLivraison => throw _privateConstructorUsedError;
  num? get montantTotal => throw _privateConstructorUsedError;
  String? get modePayement => throw _privateConstructorUsedError;
  String? get pourMarchand => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentCartResponseCopyWith<CurrentCartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentCartResponseCopyWith<$Res> {
  factory $CurrentCartResponseCopyWith(
          CurrentCartResponse value, $Res Function(CurrentCartResponse) then) =
      _$CurrentCartResponseCopyWithImpl<$Res, CurrentCartResponse>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? localisationGps,
      double? latitude,
      double? longitude,
      String? dateCreate,
      String? transactionId,
      List<OrderArticle> articles,
      num? montant,
      String? statut,
      Client? client,
      String? codeLivraison,
      Quartier? quartier,
      num? montantLivraison,
      num? montantTotal,
      String? modePayement,
      String? pourMarchand,
      String? otp});

  $ClientCopyWith<$Res>? get client;
  $QuartierCopyWith<$Res>? get quartier;
}

/// @nodoc
class _$CurrentCartResponseCopyWithImpl<$Res, $Val extends CurrentCartResponse>
    implements $CurrentCartResponseCopyWith<$Res> {
  _$CurrentCartResponseCopyWithImpl(this._value, this._then);

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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? dateCreate = freezed,
    Object? transactionId = freezed,
    Object? articles = null,
    Object? montant = freezed,
    Object? statut = freezed,
    Object? client = freezed,
    Object? codeLivraison = freezed,
    Object? quartier = freezed,
    Object? montantLivraison = freezed,
    Object? montantTotal = freezed,
    Object? modePayement = freezed,
    Object? pourMarchand = freezed,
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
      localisationGps: freezed == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dateCreate: freezed == dateCreate
          ? _value.dateCreate
          : dateCreate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<OrderArticle>,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as num?,
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
              as num?,
      montantTotal: freezed == montantTotal
          ? _value.montantTotal
          : montantTotal // ignore: cast_nullable_to_non_nullable
              as num?,
      modePayement: freezed == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String?,
      pourMarchand: freezed == pourMarchand
          ? _value.pourMarchand
          : pourMarchand // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $CurrentCartResponseCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? localisationGps,
      double? latitude,
      double? longitude,
      String? dateCreate,
      String? transactionId,
      List<OrderArticle> articles,
      num? montant,
      String? statut,
      Client? client,
      String? codeLivraison,
      Quartier? quartier,
      num? montantLivraison,
      num? montantTotal,
      String? modePayement,
      String? pourMarchand,
      String? otp});

  @override
  $ClientCopyWith<$Res>? get client;
  @override
  $QuartierCopyWith<$Res>? get quartier;
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$CurrentCartResponseCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? localisationGps = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? dateCreate = freezed,
    Object? transactionId = freezed,
    Object? articles = null,
    Object? montant = freezed,
    Object? statut = freezed,
    Object? client = freezed,
    Object? codeLivraison = freezed,
    Object? quartier = freezed,
    Object? montantLivraison = freezed,
    Object? montantTotal = freezed,
    Object? modePayement = freezed,
    Object? pourMarchand = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$TransactionModelImpl(
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
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dateCreate: freezed == dateCreate
          ? _value.dateCreate
          : dateCreate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<OrderArticle>,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as num?,
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
              as num?,
      montantTotal: freezed == montantTotal
          ? _value.montantTotal
          : montantTotal // ignore: cast_nullable_to_non_nullable
              as num?,
      modePayement: freezed == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String?,
      pourMarchand: freezed == pourMarchand
          ? _value.pourMarchand
          : pourMarchand // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TransactionModelImpl implements _TransactionModel {
  _$TransactionModelImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.localisationGps,
      this.latitude,
      this.longitude,
      this.dateCreate,
      this.transactionId,
      final List<OrderArticle> articles = const [],
      this.montant,
      this.statut,
      this.client,
      this.codeLivraison,
      this.quartier,
      this.montantLivraison,
      this.montantTotal,
      this.modePayement,
      this.pourMarchand,
      this.otp})
      : _articles = articles;

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

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
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? dateCreate;
  @override
  final String? transactionId;
  final List<OrderArticle> _articles;
  @override
  @JsonKey()
  List<OrderArticle> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final num? montant;
  @override
  final String? statut;
  @override
  final Client? client;
  @override
  final String? codeLivraison;
  @override
  final Quartier? quartier;
  @override
  final num? montantLivraison;
  @override
  final num? montantTotal;
  @override
  final String? modePayement;
  @override
  final String? pourMarchand;
  @override
  final String? otp;

  @override
  String toString() {
    return 'CurrentCartResponse(id: $id, version: $version, code: $code, designation: $designation, localisationGps: $localisationGps, latitude: $latitude, longitude: $longitude, dateCreate: $dateCreate, transactionId: $transactionId, articles: $articles, montant: $montant, statut: $statut, client: $client, codeLivraison: $codeLivraison, quartier: $quartier, montantLivraison: $montantLivraison, montantTotal: $montantTotal, modePayement: $modePayement, pourMarchand: $pourMarchand, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.localisationGps, localisationGps) ||
                other.localisationGps == localisationGps) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.dateCreate, dateCreate) ||
                other.dateCreate == dateCreate) &&
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
                other.pourMarchand == pourMarchand) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        version,
        code,
        designation,
        localisationGps,
        latitude,
        longitude,
        dateCreate,
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
        pourMarchand,
        otp
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements CurrentCartResponse {
  factory _TransactionModel(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final String? localisationGps,
      final double? latitude,
      final double? longitude,
      final String? dateCreate,
      final String? transactionId,
      final List<OrderArticle> articles,
      final num? montant,
      final String? statut,
      final Client? client,
      final String? codeLivraison,
      final Quartier? quartier,
      final num? montantLivraison,
      final num? montantTotal,
      final String? modePayement,
      final String? pourMarchand,
      final String? otp}) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

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
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get dateCreate;
  @override
  String? get transactionId;
  @override
  List<OrderArticle> get articles;
  @override
  num? get montant;
  @override
  String? get statut;
  @override
  Client? get client;
  @override
  String? get codeLivraison;
  @override
  Quartier? get quartier;
  @override
  num? get montantLivraison;
  @override
  num? get montantTotal;
  @override
  String? get modePayement;
  @override
  String? get pourMarchand;
  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
