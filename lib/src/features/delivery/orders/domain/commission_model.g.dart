// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommissionImpl _$$CommissionImplFromJson(Map<String, dynamic> json) =>
    _$CommissionImpl(
      timeStamp: json['timeStamp'] as String?,
      statusCode: json['statusCode'] as int?,
      httpStatus: json['httpStatus'] as String?,
      message: json['message'] as String?,
      datas: json['datas'] == null
          ? null
          : Datas.fromJson(json['datas'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommissionImplToJson(_$CommissionImpl instance) =>
    <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'statusCode': instance.statusCode,
      'httpStatus': instance.httpStatus,
      'message': instance.message,
      'datas': instance.datas,
    };

_$DatasImpl _$$DatasImplFromJson(Map<String, dynamic> json) => _$DatasImpl(
      commissions: json['commissions'] == null
          ? null
          : Commissions.fromJson(json['commissions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DatasImplToJson(_$DatasImpl instance) =>
    <String, dynamic>{
      'commissions': instance.commissions,
    };

_$CommissionsImpl _$$CommissionsImplFromJson(Map<String, dynamic> json) =>
    _$CommissionsImpl(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => CommissionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      totalPages: json['totalPages'] as int?,
      totalElements: json['totalElements'] as int?,
      last: json['last'] as bool?,
      size: json['size'] as int?,
      number: json['number'] as int?,
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as Object).toList(),
      numberOfElements: json['numberOfElements'] as int?,
      first: json['first'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$$CommissionsImplToJson(_$CommissionsImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'last': instance.last,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'first': instance.first,
      'empty': instance.empty,
    };

_$CommissionModelImpl _$$CommissionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionModelImpl(
      idCommission: json['idCommission'] as int?,
      code: json['code'] as String?,
      commandId: json['commandId'] as int?,
      commandCode: json['commandCode'] as String?,
      merchant: json['merchant'] as int?,
      commandAmount: (json['commandAmount'] as num?)?.toDouble() ?? 0.0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      retainedAmount: (json['retainedAmount'] as num?)?.toDouble() ?? 0.0,
      transactionFees: (json['transactionFees'] as num?)?.toDouble() ?? 0.0,
      deliveryFees: (json['deliveryFees'] as num?)?.toDouble() ?? 0.0,
      dueAmount: (json['dueAmount'] as num?)?.toDouble() ?? 0.0,
      paid: json['paid'] as bool?,
      paymentDate: json['paymentDate'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$CommissionModelImplToJson(
        _$CommissionModelImpl instance) =>
    <String, dynamic>{
      'idCommission': instance.idCommission,
      'code': instance.code,
      'commandId': instance.commandId,
      'commandCode': instance.commandCode,
      'merchant': instance.merchant,
      'commandAmount': instance.commandAmount,
      'amount': instance.amount,
      'retainedAmount': instance.retainedAmount,
      'transactionFees': instance.transactionFees,
      'deliveryFees': instance.deliveryFees,
      'dueAmount': instance.dueAmount,
      'paid': instance.paid,
      'paymentDate': instance.paymentDate,
      'date': instance.date,
      'time': instance.time,
    };

_$PageableImpl _$$PageableImplFromJson(Map<String, dynamic> json) =>
    _$PageableImpl(
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as Object).toList(),
      offset: json['offset'] as int?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$$PageableImplToJson(_$PageableImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };
