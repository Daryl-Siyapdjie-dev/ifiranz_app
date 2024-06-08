// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finalize_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinalizeResponseImpl _$$FinalizeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FinalizeResponseImpl(
      ptn: json['ptn'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : Timestamp.fromJson(json['timestamp'] as Map<String, dynamic>),
      agentBalance: (json['agentBalance'] as num?)?.toDouble(),
      receiptNumber: json['receiptNumber'] as String?,
      veriCode: json['veriCode'] as String?,
      priceLocalCur: (json['priceLocalCur'] as num?)?.toDouble(),
      priceSystemCur: (json['priceSystemCur'] as num?)?.toDouble(),
      localCur: json['localCur'] as String?,
      systemCur: json['systemCur'] as String?,
      trid: json['trid'] as String?,
      pin: json['pin'] as String?,
      status: json['status'] as String?,
      payItemId: json['payItemId'] as String?,
      payItemDescr: json['payItemDescr'] as String?,
    );

Map<String, dynamic> _$$FinalizeResponseImplToJson(
        _$FinalizeResponseImpl instance) =>
    <String, dynamic>{
      'ptn': instance.ptn,
      'timestamp': instance.timestamp,
      'agentBalance': instance.agentBalance,
      'receiptNumber': instance.receiptNumber,
      'veriCode': instance.veriCode,
      'priceLocalCur': instance.priceLocalCur,
      'priceSystemCur': instance.priceSystemCur,
      'localCur': instance.localCur,
      'systemCur': instance.systemCur,
      'trid': instance.trid,
      'pin': instance.pin,
      'status': instance.status,
      'payItemId': instance.payItemId,
      'payItemDescr': instance.payItemDescr,
    };

_$TimestampImpl _$$TimestampImplFromJson(Map<String, dynamic> json) =>
    _$TimestampImpl(
      year: json['year'] as int?,
      month: json['month'] as String?,
      monthValue: json['monthValue'] as int?,
      dayOfMonth: json['dayOfMonth'] as int?,
      chronology: json['chronology'] == null
          ? null
          : Chronology.fromJson(json['chronology'] as Map<String, dynamic>),
      dayOfWeek: json['dayOfWeek'] as String?,
      leapYear: json['leapYear'] as bool?,
      dayOfYear: json['dayOfYear'] as int?,
      era: json['era'] as String?,
    );

Map<String, dynamic> _$$TimestampImplToJson(_$TimestampImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'monthValue': instance.monthValue,
      'dayOfMonth': instance.dayOfMonth,
      'chronology': instance.chronology,
      'dayOfWeek': instance.dayOfWeek,
      'leapYear': instance.leapYear,
      'dayOfYear': instance.dayOfYear,
      'era': instance.era,
    };

_$ChronologyImpl _$$ChronologyImplFromJson(Map<String, dynamic> json) =>
    _$ChronologyImpl(
      id: json['id'] as String?,
      calendarType: json['calendarType'] as String?,
    );

Map<String, dynamic> _$$ChronologyImplToJson(_$ChronologyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'calendarType': instance.calendarType,
    };
