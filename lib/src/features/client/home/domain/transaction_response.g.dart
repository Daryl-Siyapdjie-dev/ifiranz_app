// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResponseImpl _$$TransactionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionResponseImpl(
      idDeal: json['idDeal'] as int?,
      commandId: json['commandId'] as int?,
      commandCode: json['commandCode'] as String?,
      code: json['code'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      commandAmount: (json['commandAmount'] as num?)?.toDouble(),
      deliveryFees: (json['deliveryFees'] as num?)?.toDouble(),
      total: json['total'],
      trid: json['trid'] as String?,
      currency: json['currency'] as String?,
      marchand: json['marchand'] as String?,
      transactionId: json['transactionId'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      idOperator: json['idOperator'] as String?,
      quoteId: json['quoteId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$TransactionResponseImplToJson(
        _$TransactionResponseImpl instance) =>
    <String, dynamic>{
      'idDeal': instance.idDeal,
      'commandId': instance.commandId,
      'commandCode': instance.commandCode,
      'code': instance.code,
      'paymentMethod': instance.paymentMethod,
      'commandAmount': instance.commandAmount,
      'deliveryFees': instance.deliveryFees,
      'total': instance.total,
      'trid': instance.trid,
      'currency': instance.currency,
      'marchand': instance.marchand,
      'transactionId': instance.transactionId,
      'status': instance.status,
      'date': instance.date,
      'idOperator': instance.idOperator,
      'quoteId': instance.quoteId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
