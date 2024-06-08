// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealImpl _$$MealImplFromJson(Map<String, dynamic> json) => _$MealImpl(
      itemName: json['itemName'] as String,
      itemImage: json['itemImage'] as String,
      itemDescription: json['itemDescription'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      itemPrice: json['itemPrice'] as String,
      isFavorite: json['isFavorite'] as bool,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$MealImplToJson(_$MealImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemImage': instance.itemImage,
      'itemDescription': instance.itemDescription,
      'images': instance.images,
      'itemPrice': instance.itemPrice,
      'isFavorite': instance.isFavorite,
      'rating': instance.rating,
    };
