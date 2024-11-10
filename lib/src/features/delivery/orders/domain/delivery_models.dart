import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/core/domain/client.dart';

part 'delivery_models.freezed.dart';
part 'delivery_models.g.dart';

@freezed
class Arrondissement with _$Arrondissement {
  factory Arrondissement({
    int? id,
    int? version,
    String? code,
    String? designation,
    double? montant,
  }) = _Arrondissement;

  factory Arrondissement.fromJson(Map<String, dynamic> json) =>
      _$ArrondissementFromJson(json);
}

@freezed
class ApiResponse with _$ApiResponse {
  factory ApiResponse({
    bool? valid,
    String? message,
    List<dynamic>? validations,
    List<Records>? recordss,
    int? totalPages,
    int? totalElements,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

@freezed
class Records with _$Records {
  factory Records({
    int? id,
    int? version,
    String? code,
    String? designation,
    Livreur? livreur,
    String? dateLivraison,
    List<Article>? articles,
    double? latitude,
    @Default(0.0) double? montant,
    @Default(0.0) double? montantLivraison,
    double? montantTotal,
    double? longitude,
    Commande? commande,
    Client? client,
    Quartier? quartier,
    String? localisationGps,
    String? statut,
    String? url,
    String? otp,
    double? dueAmount,
    String? clientName,
    String? modePayement,
    String? dateCreate,
  }) = _Records;

  factory Records.fromJson(Map<String, dynamic> json) =>
      _$RecordsFromJson(json);
}

@freezed
class Livreur with _$Livreur {
  factory Livreur({
    int? id,
    int? version,
    String? code,
    String? designation,
    int? shipperId,
    String? nom,
    String? prenom,
    String? adresse,
    String? telephone1,
    String? telephone2,
    String? photoEncoded,
    String? format,
    String? image,
    String? url,
    String? user,
  }) = _Livreur;

  factory Livreur.fromJson(Map<String, dynamic> json) =>
      _$LivreurFromJson(json);
}

@freezed
class Commande with _$Commande {
  factory Commande({
    int? id,
    int? version,
    String? code,
    String? clientName,
    String? clientPhone,
    double? dueAmount,
    String? designation,
    String? localisationGps,
    String? transactionId,
    List<Article>? articles,
    double? montant,
    String? statut,
    Client? client,
    String? codeLivraison,
    Quartier? quartier,
    double? montantLivraison,
    double? montantTotal,
    String? modePayement,
    String? pourMarchand,
  }) = _Commande;

  factory Commande.fromJson(Map<String, dynamic> json) =>
      _$CommandeFromJson(json);
}

@freezed
class Article with _$Article {
  factory Article({
    int? id,
    int? version,
    String? code,
    String? designation,
    ArticleDetail? article,
    double? quantite,
    double? montant,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
class ArticleDetail with _$ArticleDetail {
  factory ArticleDetail({
    int? id,
    int? version,
    String? code,
    String? designation,
    ArticleType? type,
    Marchand? marchand,
    double? prix,
    int? note,
    int? rang,
    String? format,
    String? image,
    String? photoEncoded,
    String? url,
  }) = _ArticleDetail;

  factory ArticleDetail.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailFromJson(json);
}

@freezed
class ArticleType with _$ArticleType {
  factory ArticleType({
    int? id,
    int? version,
    String? code,
    String? designation,
  }) = _ArticleType;

  factory ArticleType.fromJson(Map<String, dynamic> json) =>
      _$ArticleTypeFromJson(json);
}

@freezed
class Marchand with _$Marchand {
  factory Marchand({
    int? id,
    int? version,
    String? code,
    String? designation,
    String? adresse,
    double? latitude,
    longitude,
    String? telephone1,
    String? telephone2,
    List<dynamic>? articles,
    List<dynamic>? clients,
    String? user,
    String? photoEncoded,
    String? format,
    String? type,
  }) = _Marchand;

  factory Marchand.fromJson(Map<String, dynamic> json) =>
      _$MarchandFromJson(json);
}

@freezed
class Quartier with _$Quartier {
  factory Quartier({
    int? id,
    int? version,
    String? code,
    String? designation,
    Arrondissement? arrondissement,
  }) = _Quartier;

  factory Quartier.fromJson(Map<String, dynamic> json) =>
      _$QuartierFromJson(json);
}

// @freezed
// class Client with _$Client {
//   const Client._();
//   const factory Client({
//     int? id,
//     String? nom,
//     String? prenom,
//   }) = _Client;
// }
