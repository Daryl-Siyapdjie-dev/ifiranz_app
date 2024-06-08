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

_$CommandeImpl _$$CommandeImplFromJson(Map<String, dynamic> json) =>
    _$CommandeImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      localisationGps: json['localisationGps'] as String?,
      transactionId: json['transactionId'] as String?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      montant: (json['montant'] as num?)?.toDouble(),
      statut: json['statut'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      codeLivraison: json['codeLivraison'] as String?,
      quartier: json['quartier'] == null
          ? null
          : Quartier.fromJson(json['quartier'] as Map<String, dynamic>),
      montantLivraison: (json['montantLivraison'] as num?)?.toDouble(),
      montantTotal: (json['montantTotal'] as num?)?.toDouble(),
      modePayement: json['modePayement'] as String?,
      pourMarchand: json['pourMarchand'],
    );

Map<String, dynamic> _$$CommandeImplToJson(_$CommandeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'localisationGps': instance.localisationGps,
      'transactionId': instance.transactionId,
      'articles': instance.articles,
      'montant': instance.montant,
      'statut': instance.statut,
      'client': instance.client,
      'codeLivraison': instance.codeLivraison,
      'quartier': instance.quartier,
      'montantLivraison': instance.montantLivraison,
      'montantTotal': instance.montantTotal,
      'modePayement': instance.modePayement,
      'pourMarchand': instance.pourMarchand,
    };
