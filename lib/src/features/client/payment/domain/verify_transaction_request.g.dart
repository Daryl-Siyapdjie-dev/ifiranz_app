// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyTransactionRequestImpl _$$VerifyTransactionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyTransactionRequestImpl(
      commandId: json['commandId'] as int,
      trid: json['trid'] as String,
      marchand: json['marchand'] as num,
      deliver: json['deliver'] as num,
    );

Map<String, dynamic> _$$VerifyTransactionRequestImplToJson(
        _$VerifyTransactionRequestImpl instance) =>
    <String, dynamic>{
      'commandId': instance.commandId,
      'trid': instance.trid,
      'marchand': instance.marchand,
      'deliver': instance.deliver,
    };
