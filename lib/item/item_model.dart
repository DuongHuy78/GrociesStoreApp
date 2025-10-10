import 'package:flutter_application_1/foodType/foodType_model.dart';

class Item {
  String imagePath;
  String name;
  double price;
  String unit;
  bool isLike;
  int count;
  String detail;
  FoodType foodType;

    Item({
    required this.imagePath,
    required this.name,
    required this.price,
    this.count = 1,
    this.unit = '1kg',
    this.isLike = false,
    this.detail = '',
    required this.foodType
  });
}