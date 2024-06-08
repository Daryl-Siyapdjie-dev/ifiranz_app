// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteResponseImpl _$$QuoteResponseImplFromJson(Map<String, dynamic> json) =>
    _$QuoteResponseImpl(
      quote: json['quote'] == null
          ? null
          : Quote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuoteResponseImplToJson(_$QuoteResponseImpl instance) =>
    <String, dynamic>{
      'quote': instance.quote?.toJson(),
    };

_$QuoteImpl _$$QuoteImplFromJson(Map<String, dynamic> json) => _$QuoteImpl(
      quoteId: json['quoteId'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : ExpiresAt.fromJson(json['expiresAt'] as Map<String, dynamic>),
      payItemId: json['payItemId'] as String?,
      amountLocalCur: json['amountLocalCur'] as int?,
      priceLocalCur: (json['priceLocalCur'] as num?)?.toDouble(),
      priceSystemCur: (json['priceSystemCur'] as num?)?.toDouble(),
      localCur: json['localCur'] as String?,
      systemCur: json['systemCur'] as String?,
      promotion: json['promotion'],
    );

Map<String, dynamic> _$$QuoteImplToJson(_$QuoteImpl instance) =>
    <String, dynamic>{
      'quoteId': instance.quoteId,
      'expiresAt': instance.expiresAt?.toJson(),
      'payItemId': instance.payItemId,
      'amountLocalCur': instance.amountLocalCur,
      'priceLocalCur': instance.priceLocalCur,
      'priceSystemCur': instance.priceSystemCur,
      'localCur': instance.localCur,
      'systemCur': instance.systemCur,
      'promotion': instance.promotion,
    };

_$ExpiresAtImpl _$$ExpiresAtImplFromJson(Map<String, dynamic> json) =>
    _$ExpiresAtImpl(
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

Map<String, dynamic> _$$ExpiresAtImplToJson(_$ExpiresAtImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'monthValue': instance.monthValue,
      'dayOfMonth': instance.dayOfMonth,
      'chronology': instance.chronology?.toJson(),
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
