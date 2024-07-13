// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_command_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateCommandRequest _$CreateCommandRequestFromJson(Map<String, dynamic> json) {
  return _CreateCommandRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateCommandRequest {
  String? get localisationGps => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  List<OrderArticle>? get articles => throw _privateConstructorUsedError;
  Client? get client => throw _privateConstructorUsedError;
  String? get clientName => throw _privateConstructorUsedError;
  String? get clientPhone => throw _privateConstructorUsedError;
  Quartier? get quartier => throw _privateConstructorUsedError;
  String? get modePayement => throw _privateConstructorUsedError;
  bool get isParcel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateCommandRequestCopyWith<CreateCommandRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCommandRequestCopyWith<$Res> {
  factory $CreateCommandRequestCopyWith(CreateCommandRequest value,
          $Res Function(CreateCommandRequest) then) =
      _$CreateCommandRequestCopyWithImpl<$Res, CreateCommandRequest>;
  @useResult
  $Res call(
      {String? localisationGps,
      double? longitude,
      double? latitude,
      String? designation,
      List<OrderArticle>? articles,
      Client? client,
      String? clientName,
      String? clientPhone,
      Quartier? quartier,
      String? modePayement,
      bool isParcel});

  $ClientCopyWith<$Res>? get client;
  $QuartierCopyWith<$Res>? get quartier;
}

/// @nodoc
class _$CreateCommandRequestCopyWithImpl<$Res,
        $Val extends CreateCommandRequest>
    implements $CreateCommandRequestCopyWith<$Res> {
  _$CreateCommandRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localisationGps = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? designation = freezed,
    Object? articles = freezed,
    Object? client = freezed,
    Object? clientName = freezed,
    Object? clientPhone = freezed,
    Object? quartier = freezed,
    Object? modePayement = freezed,
    Object? isParcel = null,
  }) {
    return _then(_value.copyWith(
      localisationGps: freezed == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<OrderArticle>?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhone: freezed == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      quartier: freezed == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as Quartier?,
      modePayement: freezed == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String?,
      isParcel: null == isParcel
          ? _value.isParcel
          : isParcel // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$CreateCommandRequestImplCopyWith<$Res>
    implements $CreateCommandRequestCopyWith<$Res> {
  factory _$$CreateCommandRequestImplCopyWith(_$CreateCommandRequestImpl value,
          $Res Function(_$CreateCommandRequestImpl) then) =
      __$$CreateCommandRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? localisationGps,
      double? longitude,
      double? latitude,
      String? designation,
      List<OrderArticle>? articles,
      Client? client,
      String? clientName,
      String? clientPhone,
      Quartier? quartier,
      String? modePayement,
      bool isParcel});

  @override
  $ClientCopyWith<$Res>? get client;
  @override
  $QuartierCopyWith<$Res>? get quartier;
}

/// @nodoc
class __$$CreateCommandRequestImplCopyWithImpl<$Res>
    extends _$CreateCommandRequestCopyWithImpl<$Res, _$CreateCommandRequestImpl>
    implements _$$CreateCommandRequestImplCopyWith<$Res> {
  __$$CreateCommandRequestImplCopyWithImpl(_$CreateCommandRequestImpl _value,
      $Res Function(_$CreateCommandRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localisationGps = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? designation = freezed,
    Object? articles = freezed,
    Object? client = freezed,
    Object? clientName = freezed,
    Object? clientPhone = freezed,
    Object? quartier = freezed,
    Object? modePayement = freezed,
    Object? isParcel = null,
  }) {
    return _then(_$CreateCommandRequestImpl(
      localisationGps: freezed == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<OrderArticle>?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhone: freezed == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      quartier: freezed == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as Quartier?,
      modePayement: freezed == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String?,
      isParcel: null == isParcel
          ? _value.isParcel
          : isParcel // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CreateCommandRequestImpl implements _CreateCommandRequest {
  _$CreateCommandRequestImpl(
      {this.localisationGps,
      this.longitude,
      this.latitude,
      this.designation,
      final List<OrderArticle>? articles,
      this.client,
      this.clientName,
      this.clientPhone,
      this.quartier,
      this.modePayement,
      this.isParcel = false})
      : _articles = articles;

  factory _$CreateCommandRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCommandRequestImplFromJson(json);

  @override
  final String? localisationGps;
  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final String? designation;
  final List<OrderArticle>? _articles;
  @override
  List<OrderArticle>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Client? client;
  @override
  final String? clientName;
  @override
  final String? clientPhone;
  @override
  final Quartier? quartier;
  @override
  final String? modePayement;
  @override
  @JsonKey()
  final bool isParcel;

  @override
  String toString() {
    return 'CreateCommandRequest(localisationGps: $localisationGps, longitude: $longitude, latitude: $latitude, designation: $designation, articles: $articles, client: $client, clientName: $clientName, clientPhone: $clientPhone, quartier: $quartier, modePayement: $modePayement, isParcel: $isParcel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCommandRequestImpl &&
            (identical(other.localisationGps, localisationGps) ||
                other.localisationGps == localisationGps) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPhone, clientPhone) ||
                other.clientPhone == clientPhone) &&
            (identical(other.quartier, quartier) ||
                other.quartier == quartier) &&
            (identical(other.modePayement, modePayement) ||
                other.modePayement == modePayement) &&
            (identical(other.isParcel, isParcel) ||
                other.isParcel == isParcel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localisationGps,
      longitude,
      latitude,
      designation,
      const DeepCollectionEquality().hash(_articles),
      client,
      clientName,
      clientPhone,
      quartier,
      modePayement,
      isParcel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCommandRequestImplCopyWith<_$CreateCommandRequestImpl>
      get copyWith =>
          __$$CreateCommandRequestImplCopyWithImpl<_$CreateCommandRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCommandRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateCommandRequest implements CreateCommandRequest {
  factory _CreateCommandRequest(
      {final String? localisationGps,
      final double? longitude,
      final double? latitude,
      final String? designation,
      final List<OrderArticle>? articles,
      final Client? client,
      final String? clientName,
      final String? clientPhone,
      final Quartier? quartier,
      final String? modePayement,
      final bool isParcel}) = _$CreateCommandRequestImpl;

  factory _CreateCommandRequest.fromJson(Map<String, dynamic> json) =
      _$CreateCommandRequestImpl.fromJson;

  @override
  String? get localisationGps;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  String? get designation;
  @override
  List<OrderArticle>? get articles;
  @override
  Client? get client;
  @override
  String? get clientName;
  @override
  String? get clientPhone;
  @override
  Quartier? get quartier;
  @override
  String? get modePayement;
  @override
  bool get isParcel;
  @override
  @JsonKey(ignore: true)
  _$$CreateCommandRequestImplCopyWith<_$CreateCommandRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderArticle _$OrderArticleFromJson(Map<String, dynamic> json) {
  return _OrderArticle.fromJson(json);
}

/// @nodoc
mixin _$OrderArticle {
  ProductModel? get article => throw _privateConstructorUsedError;
  num? get quantite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderArticleCopyWith<OrderArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderArticleCopyWith<$Res> {
  factory $OrderArticleCopyWith(
          OrderArticle value, $Res Function(OrderArticle) then) =
      _$OrderArticleCopyWithImpl<$Res, OrderArticle>;
  @useResult
  $Res call({ProductModel? article, num? quantite});

  $ProductModelCopyWith<$Res>? get article;
}

/// @nodoc
class _$OrderArticleCopyWithImpl<$Res, $Val extends OrderArticle>
    implements $OrderArticleCopyWith<$Res> {
  _$OrderArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = freezed,
    Object? quantite = freezed,
  }) {
    return _then(_value.copyWith(
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      quantite: freezed == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get article {
    if (_value.article == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.article!, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderArticleImplCopyWith<$Res>
    implements $OrderArticleCopyWith<$Res> {
  factory _$$OrderArticleImplCopyWith(
          _$OrderArticleImpl value, $Res Function(_$OrderArticleImpl) then) =
      __$$OrderArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductModel? article, num? quantite});

  @override
  $ProductModelCopyWith<$Res>? get article;
}

/// @nodoc
class __$$OrderArticleImplCopyWithImpl<$Res>
    extends _$OrderArticleCopyWithImpl<$Res, _$OrderArticleImpl>
    implements _$$OrderArticleImplCopyWith<$Res> {
  __$$OrderArticleImplCopyWithImpl(
      _$OrderArticleImpl _value, $Res Function(_$OrderArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = freezed,
    Object? quantite = freezed,
  }) {
    return _then(_$OrderArticleImpl(
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      quantite: freezed == quantite
          ? _value.quantite
          : quantite // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderArticleImpl implements _OrderArticle {
  _$OrderArticleImpl({this.article, this.quantite});

  factory _$OrderArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderArticleImplFromJson(json);

  @override
  final ProductModel? article;
  @override
  final num? quantite;

  @override
  String toString() {
    return 'OrderArticle(article: $article, quantite: $quantite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderArticleImpl &&
            (identical(other.article, article) || other.article == article) &&
            (identical(other.quantite, quantite) ||
                other.quantite == quantite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, article, quantite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderArticleImplCopyWith<_$OrderArticleImpl> get copyWith =>
      __$$OrderArticleImplCopyWithImpl<_$OrderArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderArticleImplToJson(
      this,
    );
  }
}

abstract class _OrderArticle implements OrderArticle {
  factory _OrderArticle({final ProductModel? article, final num? quantite}) =
      _$OrderArticleImpl;

  factory _OrderArticle.fromJson(Map<String, dynamic> json) =
      _$OrderArticleImpl.fromJson;

  @override
  ProductModel? get article;
  @override
  num? get quantite;
  @override
  @JsonKey(ignore: true)
  _$$OrderArticleImplCopyWith<_$OrderArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
