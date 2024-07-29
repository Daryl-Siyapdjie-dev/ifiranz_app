import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_model.freezed.dart';
part 'commission_model.g.dart';

@freezed
class Commission with _$Commission {
  const Commission._();
  const factory Commission({
    String? timeStamp,
    int? statusCode,
    String? httpStatus,
    String? message,
    Datas? datas,
  }) = _Commission;

  factory Commission.fromJson(Map<String, dynamic> json) =>
      _$CommissionFromJson(json);
}

@freezed
class Datas with _$Datas {
  const Datas._();
  const factory Datas({
    Commissions? commissions,
  }) = _Datas;

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);
}

@freezed
class Commissions with _$Commissions {
  const Commissions._();
  const factory Commissions({
    List<CommissionModel>? content,
    Pageable? pageable,
    int? totalPages,
    int? totalElements,
    bool? last,
    int? size,
    int? number,
    List<Object>? sort,
    int? numberOfElements,
    bool? first,
    bool? empty,
  }) = _Commissions;

  factory Commissions.fromJson(Map<String, dynamic> json) =>
      _$CommissionsFromJson(json);
}

@freezed
class CommissionModel with _$CommissionModel {
  const CommissionModel._();
  const factory CommissionModel({
    int? idCommission,
    String? code,
    int? commandId,
    String? commandCode,
    int? merchant,
    @Default(0.0) double? commandAmount,
    @Default(0.0) double? amount,
    @Default(0.0) double? retainedAmount,
    @Default(0.0) double? transactionFees,
    @Default(0.0) double? deliveryFees,
    @Default(0.0) double? dueAmount,
    bool? paid,
    String? paymentDate,
    String? date,
    String? time,
  }) = _CommissionModel;

  factory CommissionModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionModelFromJson(json);
}

@freezed
class Pageable with _$Pageable {
  const Pageable._();
  const factory Pageable({
    int? pageNumber,
    int? pageSize,
    List<Object>? sort,
    int? offset,
    bool? paged,
    bool? unpaged,
  }) = _Pageable;

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
}
