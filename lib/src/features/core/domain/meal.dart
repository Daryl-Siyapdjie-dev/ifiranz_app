import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
class Meal with _$Meal {
  factory Meal({
    required String itemName,
    required String itemImage,
    required String itemDescription,
    required List<String> images,
    required String itemPrice,
    required bool isFavorite,
    required double rating,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
