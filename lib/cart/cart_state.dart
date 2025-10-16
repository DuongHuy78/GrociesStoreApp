import 'package:flutter_application_1/item/item_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  List<Item> myCarts;

  CartLoadedState({
    required this.myCarts,
  });

  CartLoadedState copyWith({
    List<Item>? myCarts,
    // Cart? selectedCart,
  }) {
    return CartLoadedState(
      myCarts: myCarts ?? this.myCarts, 
    );
  }
}

class CartErrorState extends CartState {}