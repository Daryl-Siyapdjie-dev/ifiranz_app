// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_command_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateCommandResponse _$CreateCommandResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateCommandResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateCommandResponse {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get localisationGps => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get transactionId => throw _privateConstructorUsedError;
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
  $CreateCommandResponseCopyWith<CreateCommandResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCommandResponseCopyWith<$Res> {
  factory $CreateCommandResponseCopyWith(CreateCommandResponse value,
          $Res Function(CreateCommandResponse) then) =
      _$CreateCommandResponseCopyWithImpl<$Res, CreateCommandResponse>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? localisationGps,
      double? latitude,
      double? longitude,
      int? transactionId,
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
class _$CreateCommandResponseCopyWithImpl<$Res,
        $Val extends CreateCommandResponse>
    implements $CreateCommandResponseCopyWith<$Res> {
  _$CreateCommandResponseCopyWithImpl(this._value, this._then);

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
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$CreateCommandResponseImplCopyWith<$Res>
    implements $CreateCommandResponseCopyWith<$Res> {
  factory _$$CreateCommandResponseImplCopyWith(
          _$CreateCommandResponseImpl value,
          $Res Function(_$CreateCommandResponseImpl) then) =
      __$$CreateCommandResponseImplCopyWithImpl<$Res>;
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
      int? transactionId,
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
class __$$CreateCommandResponseImplCopyWithImpl<$Res>
    extends _$CreateCommandResponseCopyWithImpl<$Res,
        _$CreateCommandResponseImpl>
    implements _$$CreateCommandResponseImplCopyWith<$Res> {
  __$$CreateCommandResponseImplCopyWithImpl(_$CreateCommandResponseImpl _value,
      $Res Function(_$CreateCommandResponseImpl) _then)
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
    return _then(_$CreateCommandResponseImpl(
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
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
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

@JsonSerializable(explicitToJson: true)
class _$CreateCommandResponseImpl implements _CreateCommandResponse {
  _$CreateCommandResponseImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.localisationGps,
      this.latitude,
      this.longitude,
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

  factory _$CreateCommandResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCommandResponseImplFromJson(json);

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
  final int? transactionId;
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
    return 'CreateCommandResponse(id: $id, version: $version, code: $code, designation: $designation, localisationGps: $localisationGps, latitude: $latitude, longitude: $longitude, transactionId: $transactionId, articles: $articles, montant: $montant, statut: $statut, client: $client, codeLivraison: $codeLivraison, quartier: $quartier, montantLivraison: $montantLivraison, montantTotal: $montantTotal, modePayement: $modePayement, pourMarchand: $pourMarchand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCommandResponseImpl &&
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
      latitude,
      longitude,
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
  _$$CreateCommandResponseImplCopyWith<_$CreateCommandResponseImpl>
      get copyWith => __$$CreateCommandResponseImplCopyWithImpl<
          _$CreateCommandResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCommandResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateCommandResponse implements CreateCommandResponse {
  factory _CreateCommandResponse(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final String? localisationGps,
      final double? latitude,
      final double? longitude,
      final int? transactionId,
      final List<Article>? articles,
      final double? montant,
      final String? statut,
      final Client? client,
      final String? codeLivraison,
      final Quartier? quartier,
      final double? montantLivraison,
      final double? montantTotal,
      final String? modePayement,
      final dynamic pourMarchand}) = _$CreateCommandResponseImpl;

  factory _CreateCommandResponse.fromJson(Map<String, dynamic> json) =
      _$CreateCommandResponseImpl.fromJson;

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
  int? get transactionId;
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
  _$$CreateCommandResponseImplCopyWith<_$CreateCommandResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  ArticleItem? get article => throw _privateConstructorUsedError;
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
      ArticleItem? article,
      double? quantite,
      double? montant});

  $ArticleItemCopyWith<$Res>? get article;
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
              as ArticleItem?,
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
  $ArticleItemCopyWith<$Res>? get article {
    if (_value.article == null) {
      return null;
    }

    return $ArticleItemCopyWith<$Res>(_value.article!, (value) {
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
      ArticleItem? article,
      double? quantite,
      double? montant});

  @override
  $ArticleItemCopyWith<$Res>? get article;
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
              as ArticleItem?,
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
  final ArticleItem? article;
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
      final ArticleItem? article,
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
  ArticleItem? get article;
  @override
  double? get quantite;
  @override
  double? get montant;
  @override
  @JsonKey(ignore: true)
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleItem _$ArticleItemFromJson(Map<String, dynamic> json) {
  return _ArticleItem.fromJson(json);
}

/// @nodoc
mixin _$ArticleItem {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleItemCopyWith<ArticleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleItemCopyWith<$Res> {
  factory $ArticleItemCopyWith(
          ArticleItem value, $Res Function(ArticleItem) then) =
      _$ArticleItemCopyWithImpl<$Res, ArticleItem>;
  @useResult
  $Res call({int? id, int? version, String? code, String? designation});
}

/// @nodoc
class _$ArticleItemCopyWithImpl<$Res, $Val extends ArticleItem>
    implements $ArticleItemCopyWith<$Res> {
  _$ArticleItemCopyWithImpl(this._value, this._then);

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
abstract class _$$ArticleItemImplCopyWith<$Res>
    implements $ArticleItemCopyWith<$Res> {
  factory _$$ArticleItemImplCopyWith(
          _$ArticleItemImpl value, $Res Function(_$ArticleItemImpl) then) =
      __$$ArticleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? version, String? code, String? designation});
}

/// @nodoc
class __$$ArticleItemImplCopyWithImpl<$Res>
    extends _$ArticleItemCopyWithImpl<$Res, _$ArticleItemImpl>
    implements _$$ArticleItemImplCopyWith<$Res> {
  __$$ArticleItemImplCopyWithImpl(
      _$ArticleItemImpl _value, $Res Function(_$ArticleItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
  }) {
    return _then(_$ArticleItemImpl(
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
class _$ArticleItemImpl implements _ArticleItem {
  _$ArticleItemImpl({this.id, this.version, this.code, this.designation});

  factory _$ArticleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleItemImplFromJson(json);

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
    return 'ArticleItem(id: $id, version: $version, code: $code, designation: $designation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleItemImpl &&
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
  _$$ArticleItemImplCopyWith<_$ArticleItemImpl> get copyWith =>
      __$$ArticleItemImplCopyWithImpl<_$ArticleItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleItemImplToJson(
      this,
    );
  }
}

abstract class _ArticleItem implements ArticleItem {
  factory _ArticleItem(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation}) = _$ArticleItemImpl;

  factory _ArticleItem.fromJson(Map<String, dynamic> json) =
      _$ArticleItemImpl.fromJson;

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
  _$$ArticleItemImplCopyWith<_$ArticleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
