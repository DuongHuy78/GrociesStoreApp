import 'dart:ui';

import 'package:flutter_application_1/explore/explore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/item.dart';

List<itemExplore> items = [
  itemExplore(
    name: 'Frash Fruits & Vegetable',
    imagePath: 'assets/images/fruits.png',
    color: const Color(0xFFE8F5E9),
  ),
  itemExplore(
    name: 'Cooking Oil & Ghee',
    imagePath: 'assets/images/oil.png',
    color: const Color(0xFFFFF3E0),
  ),
  itemExplore(
    name: 'Meat & Fish',
    imagePath: 'assets/images/meat.png',
    color: const Color(0xFFFCE4EC),
  ),
  itemExplore(
    name: 'Bakery & Snacks',
    imagePath: 'assets/images/bakery.png',
    color: const Color(0xFFEDE7F6),
  ),
  itemExplore(
    name: 'Dairy & Eggs',
    imagePath: 'assets/images/dairy.png',
    color: const Color(0xFFFFFDE7),
  ),
  itemExplore(
    name: 'Beverages',
    imagePath: 'assets/images/beverages.png',
    color: const Color(0xFFE3F2FD),
  ),
  itemExplore(
    name: 'Frash Fruits & Vegetable',
    imagePath: 'assets/images/fruits.png',
    color: const Color(0xFFE8F5E9),
  ),
  itemExplore(
    name: 'Cooking Oil & Ghee',
    imagePath: 'assets/images/oil.png',
    color: const Color(0xFFFFF3E0),
  ),
  itemExplore(
    name: 'Meat & Fish',
    imagePath: 'assets/images/meat.png',
    color: const Color(0xFFFCE4EC),
  ),
  itemExplore(
    name: 'Bakery & Snacks',
    imagePath: 'assets/images/bakery.png',
    color: const Color(0xFFEDE7F6),
  ),
  itemExplore(
    name: 'Dairy & Eggs',
    imagePath: 'assets/images/dairy.png',
    color: const Color(0xFFFFFDE7),
  ),
  itemExplore(
    name: 'Beverages',
    imagePath: 'assets/images/beverages.png',
    color: const Color(0xFFE3F2FD),
  ),
];

class ExploreCubit extends Cubit<ExploreState>{
  ExploreCubit():super(ExploreState(items: items));

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(isLoading: false));
  }
}