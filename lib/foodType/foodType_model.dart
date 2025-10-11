import 'dart:ui';

class FoodType {
  String imagePath;
  String name;
  Color? color;
  String infor;

  FoodType({
    required this.imagePath,
    required this.name,
    this.color,
    required this.infor
  });
}
