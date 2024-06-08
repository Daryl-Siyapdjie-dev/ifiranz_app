import 'package:ifiranz_client/src/features/core/domain/meal.dart';

List<Meal> generateMealList = [
  Meal(
    itemName: 'TARO beef',
    itemImage: 'assets/images/taro.png',
    images: [
      'assets/images/taro-2.png',
      'assets/images/taro.png',
      'assets/images/taro-3.png',
    ],
    itemDescription: 'Classic plate',
    itemPrice: '1500XAF',
    isFavorite: true,
    rating: 4.5,
  ),
  Meal(
    itemName: 'Hamburger',
    itemImage: 'assets/images/burger.png',
    itemDescription: 'Classic plate',
    itemPrice: '2500XAF',
    isFavorite: false,
    images: [
      'assets/images/burger.png',
      'assets/images/jus-dananas.png',
      'assets/images/taro.png',
    ],
    rating: 4.0,
  ),

  // Add more Meal instances as needed...
];
