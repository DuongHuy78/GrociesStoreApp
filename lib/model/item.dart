import 'package:flutter/material.dart';

class item {
  String imagePath;
  String name;
  double price;
  String unit;
  bool isLike;
  int count;
  String detail;

    item({
    required this.imagePath,
    required this.name,
    required this.price,
    this.count = 1,
    this.unit = '1kg',
    this.isLike = false,
    this.detail = '',
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
