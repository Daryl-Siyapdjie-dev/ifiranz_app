import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/core/domain/client.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(explicitToJson: true)
  factory ProductModel({
    int? id,
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
    List<NoteModel>? notes,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ProductType with _$ProductType {
  factory ProductType({
    int? id,
    int? version,
    String? code,
    String? designation,
  }) = _ProductType;

  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);
}

@freezed
class NoteModel with _$NoteModel {
  @JsonSerializable(explicitToJson: true)
  const factory NoteModel({
    int? id,
    int? version,
    String? designation,
    Client? client,
    int? note,
    String? commentaire,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}

@freezed
class Merchant with _$Merchant {
  factory Merchant({
    int? id,
    int? version,
    String? code,
    String? designation,
    int? merchantId,
    String? adresse,
    String? telephone1,
    double? longitude,
    latitude,
    String? telephone2,
    String? user,
    String? url,
    String? photoEncoded,
    String? format,
    String? type,
    double? indice,
  }) = _Merchant;

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}
