import 'package:flutter_application_1/foodType/foodType_model.dart';

abstract class FoodTypeState {}

class FoodTypeInitialState extends FoodTypeState {}

class FoodTypeLoadingState extends FoodTypeState {}

class FoodTypeLoadedState extends FoodTypeState {
  // FoodType selectedFoodType;
  List<FoodType> foodTypes;

  FoodTypeLoadedState({
    // required this.selectedFoodType,
    required this.foodTypes,
  });

  FoodTypeLoadedState copyWith({
    List<FoodType>? foodTypes,
    // FoodType? selectedFoodType,
  }) {
    return FoodTypeLoadedState(
      foodTypes: foodTypes ?? this.foodTypes, 
      // selectedFoodType: selectedFoodType ?? this.selectedFoodType
    );
  }
}

class FoodTypeErrorState extends FoodTypeState {}