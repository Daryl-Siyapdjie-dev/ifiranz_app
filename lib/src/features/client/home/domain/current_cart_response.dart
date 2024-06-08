import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/quartier.dart';

import '../../../auth/core/domain/client.dart';

part 'current_cart_response.freezed.dart';
part 'current_cart_response.g.dart';

@freezed
class CurrentCartResponse with _$CurrentCartResponse {
  @JsonSerializable(explicitToJson: true)
  factory CurrentCartResponse({
    int? id,
    int? version,
    String? code,
    String? designation,
    String? localisationGps,
    double? latitude,
    double? longitude,
    String? dateCreate,
    String? transactionId,
    @Default([]) List<OrderArticle> articles,
    num? montant,
    String? statut,
    Client? client,
    String? codeLivraison,
    Quartier? quartier,
    num? montantLivraison,
    num? montantTotal,
    String? modePayement,
    String? pourMarchand,
    String? otp,
  }) = _TransactionModel;

  factory CurrentCartResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentCartResponseFromJson(json);
}

extension CartResponseTotal on CurrentCartResponse {
  num greatMontantTotal() {
    return articles.isEmpty
        ? 0
        : (getTotalCart(articles) + (montantLivraison ?? 0));
  }
}

num getTotalCart(List<OrderArticle> cart) {
  num price = 0;

  final allPrices = [];
  for (OrderArticle o in cart) {
    allPrices.add(o.article!.salePrice! * o.quantite!);
  }

  price = allPrices.reduce((value, element) => value + element);

  return price;
}
