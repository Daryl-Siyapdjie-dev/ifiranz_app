import 'package:freezed_annotation/freezed_annotation.dart';

part 'marchand_response.freezed.dart';
part 'marchand_response.g.dart';

@freezed
class MarchandResponse with _$MarchandResponse {
  factory MarchandResponse({
    int? id,
    int? version,
    String? code,
    String? designation,
    int? merchantId,
    String? adresse,
    String? telephone1,
    String? telephone2,
    List<dynamic>? articles,
    List<dynamic>? clients,
    String? user,
    String? photoEncoded,
    String? format,
    String? type,
  }) = _MarchandResponse;

  factory MarchandResponse.fromJson(Map<String, dynamic> json) =>
      _$MarchandResponseFromJson(json);
}
