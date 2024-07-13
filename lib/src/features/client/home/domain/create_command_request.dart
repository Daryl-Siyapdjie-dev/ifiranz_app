import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/domain/quartier.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';

part 'create_command_request.freezed.dart';
part 'create_command_request.g.dart';

@freezed
class CreateCommandRequest with _$CreateCommandRequest {
  @JsonSerializable(explicitToJson: true)
  factory CreateCommandRequest(
      {String? localisationGps,
      double? longitude,
      double? latitude,
      String? designation,
      List<OrderArticle>? articles,
      Client? client,
      String? clientName,
      String? clientPhone,
      Quartier? quartier,
      String? modePayement,
      @Default(false) bool isParcel}) = _CreateCommandRequest;

// @override
//   Map<String, dynamic> toJson(CreateCommandRequest instance) => {
//         'localisationGps': instance.localisationGps,
//         'designation': instance.designation,
//         'articles': instance.articles.map((e) => e.toJson()),
//         'client': instance.client.toJson(),
//         'quartier': instance.quartier.toJson(),
//         'modePayement': instance.modePayement
//       };

  factory CreateCommandRequest.fromJson(Map<String, dynamic> json) => _$CreateCommandRequestFromJson(json);
}

extension CreateCommandResponseToFormData on CreateCommandRequest {
  Json toApiJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'localisationGps': localisationGps,
      'designation': designation,
      'articles': articles?.map((e) => e.toJson()).toList(),
      'client': client?.toJson(),
      // 'quartier': quartier?.toJson(),
      'modePayement': modePayement,
    };
  }
}

@freezed
class OrderArticle with _$OrderArticle {
  @JsonSerializable(explicitToJson: true)
  factory OrderArticle({
    ProductModel? article,
    num? quantite,
  }) = _OrderArticle;

  factory OrderArticle.fromJson(Map<String, dynamic> json) => _$OrderArticleFromJson(json);
}
