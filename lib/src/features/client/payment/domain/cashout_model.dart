import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashout_model.freezed.dart';
part 'cashout_model.g.dart';

@freezed
class CashoutModel with _$CashoutModel {
  @JsonSerializable(explicitToJson: true)
  factory CashoutModel({
    @JsonKey(name: 'serviceid') int? serviceId,
    // @JsonKey(name: 'merchant') String? merchant,
    // @JsonKey(name: 'payItemId') String? payItemId,
    // @JsonKey(name: 'payItemDescr') String? payItemDescr,
    // @JsonKey(name: 'amountType') String? amountType,
    @JsonKey(name: 'isEnabled') bool? isEnabled,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'description') String? description,
    // @JsonKey(name: 'optStrg') String? optStrg,
    // @JsonKey(name: 'optNmb') int? optNmb,
  }) = _CashoutModel;

  factory CashoutModel.fromJson(Map<String, dynamic> json) =>
      _$CashoutModelFromJson(json);
}
