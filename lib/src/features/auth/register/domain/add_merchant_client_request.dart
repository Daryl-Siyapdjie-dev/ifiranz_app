import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';

import '../../../client/home/domain/product_model.dart';

part 'add_merchant_client_request.freezed.dart';
part 'add_merchant_client_request.g.dart';

@freezed
abstract class AddMerchantClientRequest with _$AddMerchantClientRequest {
  factory AddMerchantClientRequest({
    @Default("merchant_costumer") String designation,
    required String name,
    required String email,
    required String phone,
    required Merchant marchant,
  }) = _AddMerchantClientRequest;

  factory AddMerchantClientRequest.fromJson(Map<String, dynamic> json) =>
      _$AddMerchantClientRequestFromJson(json);
}
