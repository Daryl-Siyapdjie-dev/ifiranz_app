import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../client/home/domain/quartier.dart';

part 'add_colis_request.freezed.dart';
part 'add_colis_request.g.dart';

@freezed
class AddColisRequest with _$AddColisRequest {
  const factory AddColisRequest({
    required String designation,
    required String clientName,
    required String clientPhone,
    required Quartier quartier,
    required String modePayement,
    required String localisationGps,
    required String description,
    @Default(true) bool? isParcel,
    required double dueAmount,
  }) = _AddColisRequest;

  factory AddColisRequest.fromJson(Map<String, dynamic> json) => _$AddColisRequestFromJson(json);
}
