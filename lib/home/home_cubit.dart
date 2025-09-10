import 'dart:ui';

import 'package:flutter_application_1/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/item.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :super(HomeLoading());

  Future<void> loadData() async  {
    final List<String> itemsDiscount = ['assets/images/discount.png',
    'assets/images/discount.png',
    'assets/images/discount.png',
    'assets/images/discount.png'];
  
    final List<item> itemsExclusive = [
      item(
        imagePath: 'assets/images/apple.png',
        name: 'Organic Apples',
        infor: '1kg, Priceg',
        price: 4.99,
      ),
      item(
        imagePath: 'assets/images/banana.png',
        name: 'Organic Bananas',
        infor: '7pcs, Priceg',
        price: 4.99,
      ),
      item(
        imagePath: 'assets/images/apple.png',
        name: 'Organic Apples',
        infor: '1kg, Priceg',
        price: 4.99,
      ),
      item(
        imagePath: 'assets/images/banana.png',
        name: 'Organic Bananas',
        infor: '7pcs, Priceg',
        price: 4.99,
      ),
    ];

    final List<item> itemsBS = [
      item(
        imagePath: 'assets/images/bellPepperRed.png',
        name: 'Bell Pepper Red',
        infor: '1kg, Priceg',
        price: 4.99,
      ),
      item(
        imagePath: 'assets/images/ginger.png',
        name: 'Ginger',
        infor: '7pcs, Priceg',
        price: 4.99,
      ),
      item(
        imagePath: 'assets/images/apple.png',
        name: 'Organic Apples',
        infor: '1kg, Priceg',
        price: 4.99,
      ),
      item(
        imagePath: 'assets/images/banana.png',
        name: 'Organic Bananas',
        infor: '7pcs, Priceg',
        price: 4.99,
      ),
    ];

    final List<itemExplore> itemsGroceries = [
      itemExplore(
        imagePath: 'assets/images/pulses.png',
        name: 'Pulses',
        color: const Color.fromARGB(255, 212, 152, 100)
      ),
      itemExplore(
        imagePath: 'assets/images/rice.png',
        name: 'Rice',
        color: const Color.fromARGB(255, 157, 206, 159)
      ),
      itemExplore(
        imagePath: 'assets/images/pulses.png',
        name: 'Pulses',
        color: const Color.fromARGB(255, 212, 152, 100)
      ),
      itemExplore(
        imagePath: 'assets/images/rice.png',
        name: 'Rice',
        color: const Color.fromARGB(255, 157, 206, 159)
      ),
    ];

    final List<item> items = [
    item(
      imagePath: 'assets/images/beefBone.png',
      name: 'Beef Bone',
      infor: '1kg, Priceg',
      price: 4.99,
    ),
    item(
      imagePath: 'assets/images/broilerChicken.png',
      name: 'Broiler Chicken',
      infor: '1kg, Priceg',
      price: 4.99,
    ),
    item(
      imagePath: 'assets/images/beefBone.png',
      name: 'Beef Bone',
      infor: '1kg, Priceg',
      price: 4.99,
    ),
    item(
      imagePath: 'assets/images/broilerChicken.png',
      name: 'Broiler Chicken',
      infor: '1kg, Priceg',
      price: 4.99,
    ),
  ];
    emit(HomeLoading().copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 5));
    emit(HomeLoading().copyWith(isLoading: false));
    emit(HomeLoaded(itemsDiscount: itemsDiscount, itemsExclusive: itemsExclusive, itemsBS: itemsBS, itemsGroceries: itemsGroceries, items: items));
  }
}