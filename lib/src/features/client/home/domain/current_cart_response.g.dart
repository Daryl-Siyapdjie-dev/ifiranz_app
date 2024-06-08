// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      localisationGps: json['localisationGps'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      dateCreate: json['dateCreate'] as String?,
      transactionId: json['transactionId'] as String?,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => OrderArticle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      montant: json['montant'] as num?,
      statut: json['statut'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      codeLivraison: json['codeLivraison'] as String?,
      quartier: json['quartier'] == null
          ? null
          : Quartier.fromJson(json['quartier'] as Map<String, dynamic>),
      montantLivraison: json['montantLivraison'] as num?,
      montantTotal: json['montantTotal'] as num?,
      modePayement: json['modePayement'] as String?,
      pourMarchand: json['pourMarchand'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'localisationGps': instance.localisationGps,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'dateCreate': instance.dateCreate,
      'transactionId': instance.transactionId,
      'articles': instance.articles.map((e) => e.toJson()).toList(),
      'montant': instance.montant,
      'statut': instance.statut,
      'client': instance.client?.toJson(),
      'codeLivraison': instance.codeLivraison,
      'quartier': instance.quartier?.toJson(),
      'montantLivraison': instance.montantLivraison,
      'montantTotal': instance.montantTotal,
      'modePayement': instance.modePayement,
      'pourMarchand': instance.pourMarchand,
      'otp': instance.otp,
    };
