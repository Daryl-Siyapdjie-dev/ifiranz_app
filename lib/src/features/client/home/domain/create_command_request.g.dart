// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_command_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCommandRequestImpl _$$CreateCommandRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCommandRequestImpl(
      localisationGps: json['localisationGps'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      designation: json['designation'] as String?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => OrderArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      quartier: json['quartier'] == null
          ? null
          : Quartier.fromJson(json['quartier'] as Map<String, dynamic>),
      modePayement: json['modePayement'] as String?,
    );

Map<String, dynamic> _$$CreateCommandRequestImplToJson(
        _$CreateCommandRequestImpl instance) =>
    <String, dynamic>{
      'localisationGps': instance.localisationGps,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'designation': instance.designation,
      'articles': instance.articles?.map((e) => e.toJson()).toList(),
      'client': instance.client?.toJson(),
      'quartier': instance.quartier?.toJson(),
      'modePayement': instance.modePayement,
    };

_$OrderArticleImpl _$$OrderArticleImplFromJson(Map<String, dynamic> json) =>
    _$OrderArticleImpl(
      article: json['article'] == null
          ? null
          : ProductModel.fromJson(json['article'] as Map<String, dynamic>),
      quantite: json['quantite'] as num?,
    );

Map<String, dynamic> _$$OrderArticleImplToJson(_$OrderArticleImpl instance) =>
    <String, dynamic>{
      'article': instance.article?.toJson(),
      'quantite': instance.quantite,
    };
