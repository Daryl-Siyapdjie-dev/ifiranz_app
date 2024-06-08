import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_client_request.freezed.dart';
part 'add_client_request.g.dart';

@freezed
abstract class AddClientRequest with _$AddClientRequest {
  factory AddClientRequest({
    @Default("costumer") String designation,
    required String nom,
    required String prenom,
    required String phoneNumber,
    required String adresse,
    required String localisationGps,
    required String user,
  }) = _AddClientRequest;

  factory AddClientRequest.fromJson(Map<String, dynamic> json) =>
      _$AddClientRequestFromJson(json);
}
