// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryImpl _$$InventoryImplFromJson(Map<String, dynamic> json) =>
    _$InventoryImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      commande: json['commande'] == null
          ? null
          : Commande.fromJson(json['commande'] as Map<String, dynamic>),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      montantTotal: (json['montantTotal'] as num?)?.toDouble(),
      date: json['date'] as String?,
      marchand: json['marchand'] as String?,
    );

Map<String, dynamic> _$$InventoryImplToJson(_$InventoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'commande': instance.commande,
      'articles': instance.articles,
      'montantTotal': instance.montantTotal,
      'date': instance.date,
      'marchand': instance.marchand,
    };
