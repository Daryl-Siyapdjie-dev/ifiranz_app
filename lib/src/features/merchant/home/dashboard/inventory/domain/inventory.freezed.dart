// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Inventory _$InventoryFromJson(Map<String, dynamic> json) {
  return _Inventory.fromJson(json);
}

/// @nodoc
mixin _$Inventory {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  Commande? get commande => throw _privateConstructorUsedError;
  List<Article>? get articles => throw _privateConstructorUsedError;
  double? get montantTotal => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get marchand => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryCopyWith<Inventory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCopyWith<$Res> {
  factory $InventoryCopyWith(Inventory value, $Res Function(Inventory) then) =
      _$InventoryCopyWithImpl<$Res, Inventory>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      Commande? commande,
      List<Article>? articles,
      double? montantTotal,
      String? date,
      String? marchand});

  $CommandeCopyWith<$Res>? get commande;
}

/// @nodoc
class _$InventoryCopyWithImpl<$Res, $Val extends Inventory>
    implements $InventoryCopyWith<$Res> {
  _$InventoryCopyWithImpl(this._value, this._then);

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
    Object? commande = freezed,
    Object? articles = freezed,
    Object? montantTotal = freezed,
    Object? date = freezed,
    Object? marchand = freezed,
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
      commande: freezed == commande
          ? _value.commande
          : commande // ignore: cast_nullable_to_non_nullable
              as Commande?,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      montantTotal: freezed == montantTotal
          ? _value.montantTotal
          : montantTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
abstract class _$$InventoryImplCopyWith<$Res>
    implements $InventoryCopyWith<$Res> {
  factory _$$InventoryImplCopyWith(
          _$InventoryImpl value, $Res Function(_$InventoryImpl) then) =
      __$$InventoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      Commande? commande,
      List<Article>? articles,
      double? montantTotal,
      String? date,
      String? marchand});

  @override
  $CommandeCopyWith<$Res>? get commande;
}

/// @nodoc
class __$$InventoryImplCopyWithImpl<$Res>
    extends _$InventoryCopyWithImpl<$Res, _$InventoryImpl>
    implements _$$InventoryImplCopyWith<$Res> {
  __$$InventoryImplCopyWithImpl(
      _$InventoryImpl _value, $Res Function(_$InventoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? commande = freezed,
    Object? articles = freezed,
    Object? montantTotal = freezed,
    Object? date = freezed,
    Object? marchand = freezed,
  }) {
    return _then(_$InventoryImpl(
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
      commande: freezed == commande
          ? _value.commande
          : commande // ignore: cast_nullable_to_non_nullable
              as Commande?,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      montantTotal: freezed == montantTotal
          ? _value.montantTotal
          : montantTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryImpl implements _Inventory {
  _$InventoryImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.commande,
      final List<Article>? articles,
      this.montantTotal,
      this.date,
      this.marchand})
      : _articles = articles;

  factory _$InventoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final Commande? commande;
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
  final double? montantTotal;
  @override
  final String? date;
  @override
  final String? marchand;

  @override
  String toString() {
    return 'Inventory(id: $id, version: $version, code: $code, designation: $designation, commande: $commande, articles: $articles, montantTotal: $montantTotal, date: $date, marchand: $marchand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.commande, commande) ||
                other.commande == commande) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.montantTotal, montantTotal) ||
                other.montantTotal == montantTotal) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.marchand, marchand) ||
                other.marchand == marchand));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      code,
      designation,
      commande,
      const DeepCollectionEquality().hash(_articles),
      montantTotal,
      date,
      marchand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryImplCopyWith<_$InventoryImpl> get copyWith =>
      __$$InventoryImplCopyWithImpl<_$InventoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryImplToJson(
      this,
    );
  }
}

abstract class _Inventory implements Inventory {
  factory _Inventory(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final Commande? commande,
      final List<Article>? articles,
      final double? montantTotal,
      final String? date,
      final String? marchand}) = _$InventoryImpl;

  factory _Inventory.fromJson(Map<String, dynamic> json) =
      _$InventoryImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  Commande? get commande;
  @override
  List<Article>? get articles;
  @override
  double? get montantTotal;
  @override
  String? get date;
  @override
  String? get marchand;
  @override
  @JsonKey(ignore: true)
  _$$InventoryImplCopyWith<_$InventoryImpl> get copyWith =>
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
  dynamic get pourMarchand => throw _privateConstructorUsedError;

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
      dynamic pourMarchand});

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
              as dynamic,
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
      dynamic pourMarchand});

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
      pourMarchand:
          freezed == pourMarchand ? _value.pourMarchand! : pourMarchand,
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
  final dynamic pourMarchand;

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
            const DeepCollectionEquality()
                .equals(other.pourMarchand, pourMarchand));
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
      const DeepCollectionEquality().hash(pourMarchand));

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
      final dynamic pourMarchand}) = _$CommandeImpl;

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
  dynamic get pourMarchand;
  @override
  @JsonKey(ignore: true)
  _$$CommandeImplCopyWith<_$CommandeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
