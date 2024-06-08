// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResponseImpl _$$TransactionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionResponseImpl(
      idDeal: json['idDeal'] as int?,
      code: json['code'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      marchand: json['marchand'] as String?,
      trid: json['trid'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      idOperator: json['idOperator'] as String?,
      quoteId: json['quoteId'] as String?,
    );

Map<String, dynamic> _$$TransactionResponseImplToJson(
        _$TransactionResponseImpl instance) =>
    <String, dynamic>{
      'idDeal': instance.idDeal,
      'code': instance.code,
      'total': instance.total,
      'marchand': instance.marchand,
      'trid': instance.trid,
      'status': instance.status,
      'date': instance.date,
      'time': instance.time,
      'idOperator': instance.idOperator,
      'quoteId': instance.quoteId,
    };
