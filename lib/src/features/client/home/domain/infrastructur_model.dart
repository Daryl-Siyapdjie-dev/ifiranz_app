import 'package:freezed_annotation/freezed_annotation.dart';

part 'infrastructur_model.freezed.dart';
part 'infrastructur_model.g.dart';

@freezed
class InfrastructurModel with _$InfrastructurModel {
  const factory InfrastructurModel({
    required int id,
    required int version,
    required String code,
    required String designation,
    required int merchantId,
    String? adresse,
    required String telephone1,
    String? telephone2,
    List<dynamic>? arcticles,
    List<dynamic>? clients,
    required String user,
    required String url,
    required String type,
    required double latitude,
    required double longitude,
    dynamic? indice,
  }) = _InfrastructurModel;

  factory InfrastructurModel.fromJson(Map<String, dynamic> json) =>
      _$InfrastructurModelFromJson(json);
}
