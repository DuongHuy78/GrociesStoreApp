import 'package:flutter_application_1/foodType/foodType_model.dart';
import 'package:flutter_application_1/item/item_model.dart';

abstract class ItemState {}

class ItemInitialState extends ItemState {}

class ItemLoadingState extends ItemState {}

class ItemLoadedState extends ItemState {
  List<Item> mockItemsForFoodType;
  FoodType selectedFoodType;

  ItemLoadedState({
    required this.mockItemsForFoodType,
    required this.selectedFoodType
  });

  ItemLoadedState copyWith({
    List<Item>? mockItemsForFoodType,
    // FoodType? selectedFoodType,
  }) {
    return ItemLoadedState(
      mockItemsForFoodType: mockItemsForFoodType ?? this.mockItemsForFoodType, 
      selectedFoodType: selectedFoodType ?? this.selectedFoodType
    );
  }
}

class ItemErrorState extends ItemState {}