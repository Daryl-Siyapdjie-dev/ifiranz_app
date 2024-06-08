// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_command_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCommandResponseImpl _$$CreateCommandResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCommandResponseImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      localisationGps: json['localisationGps'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      transactionId: json['transactionId'] as int?,
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

Map<String, dynamic> _$$CreateCommandResponseImplToJson(
        _$CreateCommandResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'localisationGps': instance.localisationGps,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'transactionId': instance.transactionId,
      'articles': instance.articles?.map((e) => e.toJson()).toList(),
      'montant': instance.montant,
      'statut': instance.statut,
      'client': instance.client?.toJson(),
      'codeLivraison': instance.codeLivraison,
      'quartier': instance.quartier?.toJson(),
      'montantLivraison': instance.montantLivraison,
      'montantTotal': instance.montantTotal,
      'modePayement': instance.modePayement,
      'pourMarchand': instance.pourMarchand,
    };

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      article: json['article'] == null
          ? null
          : ArticleItem.fromJson(json['article'] as Map<String, dynamic>),
      quantite: (json['quantite'] as num?)?.toDouble(),
      montant: (json['montant'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'article': instance.article,
      'quantite': instance.quantite,
      'montant': instance.montant,
    };

_$ArticleItemImpl _$$ArticleItemImplFromJson(Map<String, dynamic> json) =>
    _$ArticleItemImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$$ArticleItemImplToJson(_$ArticleItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
    };
