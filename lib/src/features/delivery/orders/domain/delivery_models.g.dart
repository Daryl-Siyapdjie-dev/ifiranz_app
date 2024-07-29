// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArrondissementImpl _$$ArrondissementImplFromJson(Map<String, dynamic> json) =>
    _$ArrondissementImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      montant: (json['montant'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ArrondissementImplToJson(
        _$ArrondissementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'montant': instance.montant,
    };

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      valid: json['valid'] as bool?,
      message: json['message'] as String?,
      validations: json['validations'] as List<dynamic>?,
      recordss: (json['recordss'] as List<dynamic>?)
          ?.map((e) => Records.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalElements: json['totalElements'] as int?,
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'message': instance.message,
      'validations': instance.validations,
      'recordss': instance.recordss,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

_$RecordsImpl _$$RecordsImplFromJson(Map<String, dynamic> json) =>
    _$RecordsImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      livreur: json['livreur'] == null
          ? null
          : Livreur.fromJson(json['livreur'] as Map<String, dynamic>),
      dateLivraison: json['dateLivraison'] as String?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      montant: (json['montant'] as num?)?.toDouble(),
      montantLivraison: (json['montantLivraison'] as num?)?.toDouble(),
      montantTotal: (json['montantTotal'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      commande: json['commande'] == null
          ? null
          : Commande.fromJson(json['commande'] as Map<String, dynamic>),
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      quartier: json['quartier'] == null
          ? null
          : Quartier.fromJson(json['quartier'] as Map<String, dynamic>),
      localisationGps: json['localisationGps'] as String?,
      statut: json['statut'] as String?,
      url: json['url'] as String?,
      otp: json['otp'] as String?,
      dueAmount: (json['dueAmount'] as num?)?.toDouble(),
      clientName: json['clientName'] as String?,
      modePayement: json['modePayement'] as String?,
      dateCreate: json['dateCreate'] as String?,
    );

Map<String, dynamic> _$$RecordsImplToJson(_$RecordsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'livreur': instance.livreur,
      'dateLivraison': instance.dateLivraison,
      'articles': instance.articles,
      'latitude': instance.latitude,
      'montant': instance.montant,
      'montantLivraison': instance.montantLivraison,
      'montantTotal': instance.montantTotal,
      'longitude': instance.longitude,
      'commande': instance.commande,
      'client': instance.client,
      'quartier': instance.quartier,
      'localisationGps': instance.localisationGps,
      'statut': instance.statut,
      'url': instance.url,
      'otp': instance.otp,
      'dueAmount': instance.dueAmount,
      'clientName': instance.clientName,
      'modePayement': instance.modePayement,
      'dateCreate': instance.dateCreate,
    };

_$LivreurImpl _$$LivreurImplFromJson(Map<String, dynamic> json) =>
    _$LivreurImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      adresse: json['adresse'] as String?,
      telephone1: json['telephone1'] as String?,
      telephone2: json['telephone2'] as String?,
      photoEncoded: json['photoEncoded'] as String?,
      format: json['format'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$LivreurImplToJson(_$LivreurImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'adresse': instance.adresse,
      'telephone1': instance.telephone1,
      'telephone2': instance.telephone2,
      'photoEncoded': instance.photoEncoded,
      'format': instance.format,
      'image': instance.image,
      'url': instance.url,
      'user': instance.user,
    };

_$CommandeImpl _$$CommandeImplFromJson(Map<String, dynamic> json) =>
    _$CommandeImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      clientName: json['clientName'] as String?,
      clientPhone: json['clientPhone'] as String?,
      dueAmount: (json['dueAmount'] as num?)?.toDouble(),
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
      pourMarchand: json['pourMarchand'] as String?,
    );

Map<String, dynamic> _$$CommandeImplToJson(_$CommandeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'clientName': instance.clientName,
      'clientPhone': instance.clientPhone,
      'dueAmount': instance.dueAmount,
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

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      article: json['article'] == null
          ? null
          : ArticleDetail.fromJson(json['article'] as Map<String, dynamic>),
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

_$ArticleDetailImpl _$$ArticleDetailImplFromJson(Map<String, dynamic> json) =>
    _$ArticleDetailImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      type: json['type'] == null
          ? null
          : ArticleType.fromJson(json['type'] as Map<String, dynamic>),
      marchand: json['marchand'] == null
          ? null
          : Marchand.fromJson(json['marchand'] as Map<String, dynamic>),
      prix: (json['prix'] as num?)?.toDouble(),
      note: json['note'] as int?,
      rang: json['rang'] as int?,
      format: json['format'] as String?,
      image: json['image'] as String?,
      photoEncoded: json['photoEncoded'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ArticleDetailImplToJson(_$ArticleDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'type': instance.type,
      'marchand': instance.marchand,
      'prix': instance.prix,
      'note': instance.note,
      'rang': instance.rang,
      'format': instance.format,
      'image': instance.image,
      'photoEncoded': instance.photoEncoded,
      'url': instance.url,
    };

_$ArticleTypeImpl _$$ArticleTypeImplFromJson(Map<String, dynamic> json) =>
    _$ArticleTypeImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$$ArticleTypeImplToJson(_$ArticleTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
    };

_$MarchandImpl _$$MarchandImplFromJson(Map<String, dynamic> json) =>
    _$MarchandImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      adresse: json['adresse'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: json['longitude'],
      telephone1: json['telephone1'] as String?,
      telephone2: json['telephone2'] as String?,
      articles: json['articles'] as List<dynamic>?,
      clients: json['clients'] as List<dynamic>?,
      user: json['user'] as String?,
      photoEncoded: json['photoEncoded'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$MarchandImplToJson(_$MarchandImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'adresse': instance.adresse,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'telephone1': instance.telephone1,
      'telephone2': instance.telephone2,
      'articles': instance.articles,
      'clients': instance.clients,
      'user': instance.user,
      'photoEncoded': instance.photoEncoded,
      'format': instance.format,
      'type': instance.type,
    };

_$QuartierImpl _$$QuartierImplFromJson(Map<String, dynamic> json) =>
    _$QuartierImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      arrondissement: json['arrondissement'] == null
          ? null
          : Arrondissement.fromJson(
              json['arrondissement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuartierImplToJson(_$QuartierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'arrondissement': instance.arrondissement,
    };
