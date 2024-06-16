import 'package:freezed_annotation/freezed_annotation.dart';

part 'quartier.freezed.dart';
part 'quartier.g.dart';

@freezed
class Quartier with _$Quartier {
  @JsonSerializable(explicitToJson: true)
  factory Quartier({
    int? id,
    int? version,
    String? code,
    String? designation,
    double? deliveryCost,
    bool? enabled,
    double? longitude,
    latitude,
    QuartierArrondissement? arrondissement,
  }) = _Quartier;

  factory Quartier.fromJson(Map<String, dynamic> json) =>
      _$QuartierFromJson(json);
}

@freezed
class QuartierArrondissement with _$QuartierArrondissement {
  @JsonSerializable(explicitToJson: true)
  factory QuartierArrondissement({
    int? id,
    int? version,
    String? code,
    String? designation,
    double? montant,
  }) = _QuartierArrondissement;

  factory QuartierArrondissement.fromJson(Map<String, dynamic> json) =>
      _$QuartierArrondissementFromJson(json);
}
