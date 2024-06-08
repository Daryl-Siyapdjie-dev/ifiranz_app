// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashoutModelImpl _$$CashoutModelImplFromJson(Map<String, dynamic> json) =>
    _$CashoutModelImpl(
      serviceId: json['serviceid'] as int?,
      isEnabled: json['isEnabled'] as bool?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CashoutModelImplToJson(_$CashoutModelImpl instance) =>
    <String, dynamic>{
      'serviceid': instance.serviceId,
      'isEnabled': instance.isEnabled,
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
    };
