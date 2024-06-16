// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionRequestImpl _$$TransactionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionRequestImpl(
      transactionId: json['transactionId'] as int?,
      customerPhone: json['customerPhone'] as String?,
      customerEmail: json['customerEmail'] as String?,
      customerName: json['customerName'] as String?,
      customerAddress: json['customerAddress'] as String?,
    );

Map<String, dynamic> _$$TransactionRequestImplToJson(
        _$TransactionRequestImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'customerPhone': instance.customerPhone,
      'customerEmail': instance.customerEmail,
      'customerName': instance.customerName,
      'customerAddress': instance.customerAddress,
    };
