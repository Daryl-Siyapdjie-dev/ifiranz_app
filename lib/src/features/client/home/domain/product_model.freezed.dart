// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ProductType? get type => throw _privateConstructorUsedError;
  Merchant? get marchand => throw _privateConstructorUsedError;
  num? get prix => throw _privateConstructorUsedError;
  num? get salePrice => throw _privateConstructorUsedError;
  num? get note => throw _privateConstructorUsedError;
  num? get rang => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get promotionMessage => throw _privateConstructorUsedError;
  num? get priceReductionPercentage => throw _privateConstructorUsedError;
  bool? get isEnabled => throw _privateConstructorUsedError;
  bool? get parcel => throw _privateConstructorUsedError;
  List<NoteModel>? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? description,
      ProductType? type,
      Merchant? marchand,
      num? prix,
      num? salePrice,
      num? note,
      num? rang,
      String? url,
      String? image,
      String? promotionMessage,
      num? priceReductionPercentage,
      bool? isEnabled,
      bool? parcel,
      List<NoteModel>? notes});

  $ProductTypeCopyWith<$Res>? get type;
  $MerchantCopyWith<$Res>? get marchand;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? type = freezed,
    Object? marchand = freezed,
    Object? prix = freezed,
    Object? salePrice = freezed,
    Object? note = freezed,
    Object? rang = freezed,
    Object? url = freezed,
    Object? image = freezed,
    Object? promotionMessage = freezed,
    Object? priceReductionPercentage = freezed,
    Object? isEnabled = freezed,
    Object? parcel = freezed,
    Object? notes = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as Merchant?,
      prix: freezed == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as num?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as num?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as num?,
      rang: freezed == rang
          ? _value.rang
          : rang // ignore: cast_nullable_to_non_nullable
              as num?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionMessage: freezed == promotionMessage
          ? _value.promotionMessage
          : promotionMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      priceReductionPercentage: freezed == priceReductionPercentage
          ? _value.priceReductionPercentage
          : priceReductionPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      isEnabled: freezed == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      parcel: freezed == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductTypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $ProductTypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MerchantCopyWith<$Res>? get marchand {
    if (_value.marchand == null) {
      return null;
    }

    return $MerchantCopyWith<$Res>(_value.marchand!, (value) {
      return _then(_value.copyWith(marchand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      String? description,
      ProductType? type,
      Merchant? marchand,
      num? prix,
      num? salePrice,
      num? note,
      num? rang,
      String? url,
      String? image,
      String? promotionMessage,
      num? priceReductionPercentage,
      bool? isEnabled,
      bool? parcel,
      List<NoteModel>? notes});

  @override
  $ProductTypeCopyWith<$Res>? get type;
  @override
  $MerchantCopyWith<$Res>? get marchand;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? marchand = freezed,
    Object? prix = freezed,
    Object? salePrice = freezed,
    Object? note = freezed,
    Object? rang = freezed,
    Object? url = freezed,
    Object? image = freezed,
    Object? promotionMessage = freezed,
    Object? priceReductionPercentage = freezed,
    Object? isEnabled = freezed,
    Object? parcel = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ProductModelImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as Merchant?,
      prix: freezed == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as num?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as num?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as num?,
      rang: freezed == rang
          ? _value.rang
          : rang // ignore: cast_nullable_to_non_nullable
              as num?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionMessage: freezed == promotionMessage
          ? _value.promotionMessage
          : promotionMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      priceReductionPercentage: freezed == priceReductionPercentage
          ? _value.priceReductionPercentage
          : priceReductionPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      isEnabled: freezed == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      parcel: freezed == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.description,
      this.type,
      this.marchand,
      this.prix,
      this.salePrice,
      this.note,
      this.rang,
      this.url,
      this.image,
      this.promotionMessage,
      this.priceReductionPercentage,
      this.isEnabled,
      this.parcel,
      final List<NoteModel>? notes})
      : _notes = notes;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final String? description;
  @override
  final ProductType? type;
  @override
  final Merchant? marchand;
  @override
  final num? prix;
  @override
  final num? salePrice;
  @override
  final num? note;
  @override
  final num? rang;
  @override
  final String? url;
  @override
  final String? image;
  @override
  final String? promotionMessage;
  @override
  final num? priceReductionPercentage;
  @override
  final bool? isEnabled;
  @override
  final bool? parcel;
  final List<NoteModel>? _notes;
  @override
  List<NoteModel>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, version: $version, code: $code, designation: $designation, description: $description, type: $type, marchand: $marchand, prix: $prix, salePrice: $salePrice, note: $note, rang: $rang, url: $url, image: $image, promotionMessage: $promotionMessage, priceReductionPercentage: $priceReductionPercentage, isEnabled: $isEnabled, parcel: $parcel, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.marchand, marchand) ||
                other.marchand == marchand) &&
            (identical(other.prix, prix) || other.prix == prix) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.rang, rang) || other.rang == rang) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.promotionMessage, promotionMessage) ||
                other.promotionMessage == promotionMessage) &&
            (identical(
                    other.priceReductionPercentage, priceReductionPercentage) ||
                other.priceReductionPercentage == priceReductionPercentage) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.parcel, parcel) || other.parcel == parcel) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      code,
      designation,
      description,
      type,
      marchand,
      prix,
      salePrice,
      note,
      rang,
      url,
      image,
      promotionMessage,
      priceReductionPercentage,
      isEnabled,
      parcel,
      const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final String? description,
      final ProductType? type,
      final Merchant? marchand,
      final num? prix,
      final num? salePrice,
      final num? note,
      final num? rang,
      final String? url,
      final String? image,
      final String? promotionMessage,
      final num? priceReductionPercentage,
      final bool? isEnabled,
      final bool? parcel,
      final List<NoteModel>? notes}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  String? get description;
  @override
  ProductType? get type;
  @override
  Merchant? get marchand;
  @override
  num? get prix;
  @override
  num? get salePrice;
  @override
  num? get note;
  @override
  num? get rang;
  @override
  String? get url;
  @override
  String? get image;
  @override
  String? get promotionMessage;
  @override
  num? get priceReductionPercentage;
  @override
  bool? get isEnabled;
  @override
  bool? get parcel;
  @override
  List<NoteModel>? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) {
  return _ProductType.fromJson(json);
}

/// @nodoc
mixin _$ProductType {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTypeCopyWith<ProductType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTypeCopyWith<$Res> {
  factory $ProductTypeCopyWith(
          ProductType value, $Res Function(ProductType) then) =
      _$ProductTypeCopyWithImpl<$Res, ProductType>;
  @useResult
  $Res call({int? id, int? version, String? code, String? designation});
}

/// @nodoc
class _$ProductTypeCopyWithImpl<$Res, $Val extends ProductType>
    implements $ProductTypeCopyWith<$Res> {
  _$ProductTypeCopyWithImpl(this._value, this._then);

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
abstract class _$$ProductTypeImplCopyWith<$Res>
    implements $ProductTypeCopyWith<$Res> {
  factory _$$ProductTypeImplCopyWith(
          _$ProductTypeImpl value, $Res Function(_$ProductTypeImpl) then) =
      __$$ProductTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? version, String? code, String? designation});
}

/// @nodoc
class __$$ProductTypeImplCopyWithImpl<$Res>
    extends _$ProductTypeCopyWithImpl<$Res, _$ProductTypeImpl>
    implements _$$ProductTypeImplCopyWith<$Res> {
  __$$ProductTypeImplCopyWithImpl(
      _$ProductTypeImpl _value, $Res Function(_$ProductTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
  }) {
    return _then(_$ProductTypeImpl(
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
class _$ProductTypeImpl implements _ProductType {
  _$ProductTypeImpl({this.id, this.version, this.code, this.designation});

  factory _$ProductTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductTypeImplFromJson(json);

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
    return 'ProductType(id: $id, version: $version, code: $code, designation: $designation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductTypeImpl &&
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
  _$$ProductTypeImplCopyWith<_$ProductTypeImpl> get copyWith =>
      __$$ProductTypeImplCopyWithImpl<_$ProductTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductTypeImplToJson(
      this,
    );
  }
}

abstract class _ProductType implements ProductType {
  factory _ProductType(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation}) = _$ProductTypeImpl;

  factory _ProductType.fromJson(Map<String, dynamic> json) =
      _$ProductTypeImpl.fromJson;

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
  _$$ProductTypeImplCopyWith<_$ProductTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) {
  return _NoteModel.fromJson(json);
}

/// @nodoc
mixin _$NoteModel {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  Client? get client => throw _privateConstructorUsedError;
  int? get note => throw _privateConstructorUsedError;
  String? get commentaire => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteModelCopyWith<NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModelCopyWith<$Res> {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) then) =
      _$NoteModelCopyWithImpl<$Res, NoteModel>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? designation,
      Client? client,
      int? note,
      String? commentaire});

  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class _$NoteModelCopyWithImpl<$Res, $Val extends NoteModel>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? designation = freezed,
    Object? client = freezed,
    Object? note = freezed,
    Object? commentaire = freezed,
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
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as int?,
      commentaire: freezed == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$NoteModelImplCopyWith<$Res>
    implements $NoteModelCopyWith<$Res> {
  factory _$$NoteModelImplCopyWith(
          _$NoteModelImpl value, $Res Function(_$NoteModelImpl) then) =
      __$$NoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? designation,
      Client? client,
      int? note,
      String? commentaire});

  @override
  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class __$$NoteModelImplCopyWithImpl<$Res>
    extends _$NoteModelCopyWithImpl<$Res, _$NoteModelImpl>
    implements _$$NoteModelImplCopyWith<$Res> {
  __$$NoteModelImplCopyWithImpl(
      _$NoteModelImpl _value, $Res Function(_$NoteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? designation = freezed,
    Object? client = freezed,
    Object? note = freezed,
    Object? commentaire = freezed,
  }) {
    return _then(_$NoteModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as int?,
      commentaire: freezed == commentaire
          ? _value.commentaire
          : commentaire // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NoteModelImpl implements _NoteModel {
  const _$NoteModelImpl(
      {this.id,
      this.version,
      this.designation,
      this.client,
      this.note,
      this.commentaire});

  factory _$NoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? designation;
  @override
  final Client? client;
  @override
  final int? note;
  @override
  final String? commentaire;

  @override
  String toString() {
    return 'NoteModel(id: $id, version: $version, designation: $designation, client: $client, note: $note, commentaire: $commentaire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, version, designation, client, note, commentaire);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      __$$NoteModelImplCopyWithImpl<_$NoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteModelImplToJson(
      this,
    );
  }
}

abstract class _NoteModel implements NoteModel {
  const factory _NoteModel(
      {final int? id,
      final int? version,
      final String? designation,
      final Client? client,
      final int? note,
      final String? commentaire}) = _$NoteModelImpl;

  factory _NoteModel.fromJson(Map<String, dynamic> json) =
      _$NoteModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get designation;
  @override
  Client? get client;
  @override
  int? get note;
  @override
  String? get commentaire;
  @override
  @JsonKey(ignore: true)
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return _Merchant.fromJson(json);
}

/// @nodoc
mixin _$Merchant {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  int? get merchantId => throw _privateConstructorUsedError;
  String? get adresse => throw _privateConstructorUsedError;
  String? get telephone1 => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  dynamic get latitude => throw _privateConstructorUsedError;
  String? get telephone2 => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get photoEncoded => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  double? get indice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchantCopyWith<Merchant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantCopyWith<$Res> {
  factory $MerchantCopyWith(Merchant value, $Res Function(Merchant) then) =
      _$MerchantCopyWithImpl<$Res, Merchant>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      int? merchantId,
      String? adresse,
      String? telephone1,
      double? longitude,
      dynamic latitude,
      String? telephone2,
      String? user,
      String? url,
      String? photoEncoded,
      String? format,
      String? type,
      double? indice});
}

/// @nodoc
class _$MerchantCopyWithImpl<$Res, $Val extends Merchant>
    implements $MerchantCopyWith<$Res> {
  _$MerchantCopyWithImpl(this._value, this._then);

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
    Object? merchantId = freezed,
    Object? adresse = freezed,
    Object? telephone1 = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? telephone2 = freezed,
    Object? user = freezed,
    Object? url = freezed,
    Object? photoEncoded = freezed,
    Object? format = freezed,
    Object? type = freezed,
    Object? indice = freezed,
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
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as int?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone1: freezed == telephone1
          ? _value.telephone1
          : telephone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      telephone2: freezed == telephone2
          ? _value.telephone2
          : telephone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
      indice: freezed == indice
          ? _value.indice
          : indice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MerchantImplCopyWith<$Res>
    implements $MerchantCopyWith<$Res> {
  factory _$$MerchantImplCopyWith(
          _$MerchantImpl value, $Res Function(_$MerchantImpl) then) =
      __$$MerchantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      int? merchantId,
      String? adresse,
      String? telephone1,
      double? longitude,
      dynamic latitude,
      String? telephone2,
      String? user,
      String? url,
      String? photoEncoded,
      String? format,
      String? type,
      double? indice});
}

/// @nodoc
class __$$MerchantImplCopyWithImpl<$Res>
    extends _$MerchantCopyWithImpl<$Res, _$MerchantImpl>
    implements _$$MerchantImplCopyWith<$Res> {
  __$$MerchantImplCopyWithImpl(
      _$MerchantImpl _value, $Res Function(_$MerchantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? merchantId = freezed,
    Object? adresse = freezed,
    Object? telephone1 = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? telephone2 = freezed,
    Object? user = freezed,
    Object? url = freezed,
    Object? photoEncoded = freezed,
    Object? format = freezed,
    Object? type = freezed,
    Object? indice = freezed,
  }) {
    return _then(_$MerchantImpl(
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
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as int?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone1: freezed == telephone1
          ? _value.telephone1
          : telephone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude ? _value.latitude! : latitude,
      telephone2: freezed == telephone2
          ? _value.telephone2
          : telephone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
      indice: freezed == indice
          ? _value.indice
          : indice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantImpl implements _Merchant {
  _$MerchantImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.merchantId,
      this.adresse,
      this.telephone1,
      this.longitude,
      this.latitude,
      this.telephone2,
      this.user,
      this.url,
      this.photoEncoded,
      this.format,
      this.type,
      this.indice});

  factory _$MerchantImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final int? merchantId;
  @override
  final String? adresse;
  @override
  final String? telephone1;
  @override
  final double? longitude;
  @override
  final dynamic latitude;
  @override
  final String? telephone2;
  @override
  final String? user;
  @override
  final String? url;
  @override
  final String? photoEncoded;
  @override
  final String? format;
  @override
  final String? type;
  @override
  final double? indice;

  @override
  String toString() {
    return 'Merchant(id: $id, version: $version, code: $code, designation: $designation, merchantId: $merchantId, adresse: $adresse, telephone1: $telephone1, longitude: $longitude, latitude: $latitude, telephone2: $telephone2, user: $user, url: $url, photoEncoded: $photoEncoded, format: $format, type: $type, indice: $indice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.telephone1, telephone1) ||
                other.telephone1 == telephone1) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            (identical(other.telephone2, telephone2) ||
                other.telephone2 == telephone2) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.photoEncoded, photoEncoded) ||
                other.photoEncoded == photoEncoded) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.indice, indice) || other.indice == indice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      code,
      designation,
      merchantId,
      adresse,
      telephone1,
      longitude,
      const DeepCollectionEquality().hash(latitude),
      telephone2,
      user,
      url,
      photoEncoded,
      format,
      type,
      indice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantImplCopyWith<_$MerchantImpl> get copyWith =>
      __$$MerchantImplCopyWithImpl<_$MerchantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantImplToJson(
      this,
    );
  }
}

abstract class _Merchant implements Merchant {
  factory _Merchant(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final int? merchantId,
      final String? adresse,
      final String? telephone1,
      final double? longitude,
      final dynamic latitude,
      final String? telephone2,
      final String? user,
      final String? url,
      final String? photoEncoded,
      final String? format,
      final String? type,
      final double? indice}) = _$MerchantImpl;

  factory _Merchant.fromJson(Map<String, dynamic> json) =
      _$MerchantImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  int? get merchantId;
  @override
  String? get adresse;
  @override
  String? get telephone1;
  @override
  double? get longitude;
  @override
  dynamic get latitude;
  @override
  String? get telephone2;
  @override
  String? get user;
  @override
  String? get url;
  @override
  String? get photoEncoded;
  @override
  String? get format;
  @override
  String? get type;
  @override
  double? get indice;
  @override
  @JsonKey(ignore: true)
  _$$MerchantImplCopyWith<_$MerchantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
