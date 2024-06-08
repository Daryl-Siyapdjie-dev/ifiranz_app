// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionRequestImpl _$$TransactionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionRequestImpl(
      quoteId: json['quoteId'] as String?,
      customerPhonenumber: json['customerPhonenumber'] as String?,
      customerEmailaddress: json['customerEmailaddress'] as String?,
      customerName: json['customerName'] as String?,
      customerAddress: json['customerAddress'] as String?,
      serviceNumber: json['serviceNumber'] as String?,
      trid: json['trid'] as String?,
    );

Map<String, dynamic> _$$TransactionRequestImplToJson(
        _$TransactionRequestImpl instance) =>
    <String, dynamic>{
      'quoteId': instance.quoteId,
      'customerPhonenumber': instance.customerPhonenumber,
      'customerEmailaddress': instance.customerEmailaddress,
      'customerName': instance.customerName,
      'customerAddress': instance.customerAddress,
      'serviceNumber': instance.serviceNumber,
      'trid': instance.trid,
    };
