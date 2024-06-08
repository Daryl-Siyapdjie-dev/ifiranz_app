import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';

import '../../../auth/core/domain/client.dart';

part 'create_command_response.freezed.dart';
part 'create_command_response.g.dart';

@freezed
class CreateCommandResponse with _$CreateCommandResponse {
  @JsonSerializable(explicitToJson: true)
  factory CreateCommandResponse({
    int? id,
    int? version,
    String? code,
    String? designation,
    String? localisationGps,
    double? latitude,
    double? longitude,
    int? transactionId,
    List<Article>? articles,
    double? montant,
    String? statut,
    Client? client,
    String? codeLivraison,
    Quartier? quartier,
    double? montantLivraison,
    double? montantTotal,
    String? modePayement,
    pourMarchand,
  }) = _CreateCommandResponse;

  factory CreateCommandResponse.fromJson(Map<String, dynamic> json) => _$CreateCommandResponseFromJson(json);
}

@freezed
class Article with _$Article {
  factory Article({
    int? id,
    int? version,
    String? code,
    String? designation,
    ArticleItem? article,
    double? quantite,
    double? montant,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}

@freezed
class ArticleItem with _$ArticleItem {
  factory ArticleItem({
    int? id,
    int? version,
    String? code,
    String? designation,
    // Add other fields as needed
  }) = _ArticleItem;

  factory ArticleItem.fromJson(Map<String, dynamic> json) => _$ArticleItemFromJson(json);
}
