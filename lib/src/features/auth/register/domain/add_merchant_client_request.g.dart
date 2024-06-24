// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_merchant_client_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddMerchantClientRequestImpl _$$AddMerchantClientRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddMerchantClientRequestImpl(
      designation: json['designation'] as String? ?? "merchant_costumer",
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      marchant: Merchant.fromJson(json['marchant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddMerchantClientRequestImplToJson(
        _$AddMerchantClientRequestImpl instance) =>
    <String, dynamic>{
      'designation': instance.designation,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'marchant': instance.marchant,
    };
