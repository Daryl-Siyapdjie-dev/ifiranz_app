import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../auth/core/domain/client.dart';
import '../../../../../client/home/domain/create_command_response.dart';
import '../../../../../client/home/domain/quartier.dart';
import '../../../../../delivery/orders/domain/delivery_models.dart' hide Article;

part 'inventory.freezed.dart';
part 'inventory.g.dart';

@freezed
class Inventory with _$Inventory {
  factory Inventory({
    int? id,
    int? version,
    String? code,
    String? designation,
    Commande? commande,
    List<Article>? articles,
    double? montantTotal,
    String? date,
    String? marchand,
  }) = _Inventory;

  factory Inventory.fromJson(Map<String, dynamic> json) => _$InventoryFromJson(json);
}
