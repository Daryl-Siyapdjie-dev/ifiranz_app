// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      description: json['description'] as String?,
      type: json['type'] == null
          ? null
          : ProductType.fromJson(json['type'] as Map<String, dynamic>),
      marchand: json['marchand'] == null
          ? null
          : Merchant.fromJson(json['marchand'] as Map<String, dynamic>),
      prix: json['prix'] as num?,
      salePrice: json['salePrice'] as num?,
      note: json['note'] as num?,
      rang: json['rang'] as num?,
      url: json['url'] as String?,
      image: json['image'] as String?,
      promotionMessage: json['promotionMessage'] as String?,
      priceReductionPercentage: json['priceReductionPercentage'] as num?,
      isEnabled: json['isEnabled'] as bool?,
      parcel: json['parcel'] as bool?,
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'description': instance.description,
      'type': instance.type?.toJson(),
      'marchand': instance.marchand?.toJson(),
      'prix': instance.prix,
      'salePrice': instance.salePrice,
      'note': instance.note,
      'rang': instance.rang,
      'url': instance.url,
      'image': instance.image,
      'promotionMessage': instance.promotionMessage,
      'priceReductionPercentage': instance.priceReductionPercentage,
      'isEnabled': instance.isEnabled,
      'parcel': instance.parcel,
      'notes': instance.notes?.map((e) => e.toJson()).toList(),
    };

_$ProductTypeImpl _$$ProductTypeImplFromJson(Map<String, dynamic> json) =>
    _$ProductTypeImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$$ProductTypeImplToJson(_$ProductTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
    };

_$NoteModelImpl _$$NoteModelImplFromJson(Map<String, dynamic> json) =>
    _$NoteModelImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      designation: json['designation'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      note: json['note'] as int?,
      commentaire: json['commentaire'] as String?,
    );

Map<String, dynamic> _$$NoteModelImplToJson(_$NoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'designation': instance.designation,
      'client': instance.client?.toJson(),
      'note': instance.note,
      'commentaire': instance.commentaire,
    };

_$MerchantImpl _$$MerchantImplFromJson(Map<String, dynamic> json) =>
    _$MerchantImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      adresse: json['adresse'] as String?,
      telephone1: json['telephone1'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: json['latitude'],
      telephone2: json['telephone2'] as String?,
      user: json['user'] as String?,
      url: json['url'] as String?,
      photoEncoded: json['photoEncoded'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
      indice: (json['indice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MerchantImplToJson(_$MerchantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'adresse': instance.adresse,
      'telephone1': instance.telephone1,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'telephone2': instance.telephone2,
      'user': instance.user,
      'url': instance.url,
      'photoEncoded': instance.photoEncoded,
      'format': instance.format,
      'type': instance.type,
      'indice': instance.indice,
    };
