import 'package:flutter/material.dart';

class item {
  String imagePath;
  String name;
  String infor;
  double price;
// constructer
  item({
    required this.imagePath,
    required this.name,
    required this.infor,
    required this.price,
  });
}

class itemExplore {
  String imagePath;
  String name;
  Color? color;

  itemExplore({
    required this.imagePath,
    required this.name,
    required this.color,
  });
}
