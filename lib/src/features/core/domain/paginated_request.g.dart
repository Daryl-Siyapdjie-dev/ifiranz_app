// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedRequestImpl _$$PaginatedRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedRequestImpl(
      size: json['size'] as int? ?? 10,
      page: json['page'] as int? ?? 0,
    );

Map<String, dynamic> _$$PaginatedRequestImplToJson(
        _$PaginatedRequestImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
    };
