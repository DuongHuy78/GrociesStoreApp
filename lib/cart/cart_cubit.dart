import 'dart:ui';

import 'package:flutter_application_1/cart/cart_state.dart';
import 'package:flutter_application_1/foodType/foodType_model.dart';
import 'package:flutter_application_1/item/item_model.dart';
import 'package:flutter_application_1/productDetails/productDetails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit() :super(CartInitialState());


  void loadMyCartData() {
    emit(CartLoadingState());
    try{
      emit(CartLoadedState(myCarts: []));
    }
    catch(e) {
      emit(CartErrorState());
    }
  }

  void insertItem(Item item) {
    if(state is CartLoadedState) {
      final current = (state as CartLoadedState).myCarts;
      if(!current.contains(item)) {
        final updated = List<Item>.from(current)..add(item);
        emit((state as CartLoadedState).copyWith(myCarts: updated));
      }
    }
    else {
      emit(CartLoadedState(myCarts: [item]));
    }
  }

  void deleteItem(Item item) {
    if(state is CartLoadedState) {
      final current = (state as CartLoadedState).myCarts;
final updated = List<Item>.from(current)
      ..removeWhere((e) =>
           e.name == item.name &&
           e.foodType.name == item.foodType.name);
    emit((state as CartLoadedState).copyWith(myCarts: updated));
    }
    else {
      emit(CartLoadedState(myCarts: []));
    }
  }

  void increment(Item item) {
    if (state is CartLoadedState) {
      final current = (state as CartLoadedState).myCarts;
      final idx = current.indexWhere((e) =>
          e.name == item.name && e.foodType.name == item.foodType.name);
      if (idx != -1) {
        final updated = List<Item>.from(current);
        updated[idx].count++;
        emit((state as CartLoadedState).copyWith(myCarts: updated));
      }
    }
  }

  void decrement(Item item) {
    if (state is CartLoadedState) {
      final current = (state as CartLoadedState).myCarts;
      final idx = current.indexWhere((e) =>
          e.name == item.name && e.foodType.name == item.foodType.name);
      if (idx != -1 && current[idx].count > 1) {
        final updated = List<Item>.from(current);
        updated[idx].count--;
        emit((state as CartLoadedState).copyWith(myCarts: updated));
      }
      else if( current[idx].count <= 1) {
        deleteItem(item);
      }
    }
  }

  bool isCountMin(int value) {
    return (value <= 0);
  }
}

