import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  @JsonSerializable(explicitToJson: true)
  factory Client({
    int? id,
    int? version,
    String? code,
    String? designation,
    String? name,
    String? nom,
    String? prenom,
    String? adresse,
    String? tel,
    String? localisationGps,
    String? user,
    String? email,
    String? phone,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
