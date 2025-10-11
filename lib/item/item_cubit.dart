import 'package:flutter_application_1/foodType/foodType_model.dart';
import 'package:flutter_application_1/item/item_model.dart';
import 'package:flutter_application_1/item/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCubit extends Cubit<ItemState>{
  ItemCubit() : super(ItemInitialState());

  void loadItemData(FoodType selectedFoodType) {
    emit(ItemLoadingState());

    List<Item> itemList = [
      // 1. Fruits & Vegetables
      Item(
        imagePath: 'assets/images/apple.png',
        name: 'Apple',
        price: 2.5,
        foodType: FoodType(
          name: 'Fruits & Vegetables',
          imagePath: 'assets/images/fruits.png',
          infor: 'Tươi ngon, giàu vitamin và chất xơ.',
        ),
      ),
      Item(
        imagePath: 'assets/images/banana.png',
        name: 'Banana',
        price: 1.2,
        foodType: FoodType(
          name: 'Fruits & Vegetables',
          imagePath: 'assets/images/fruits.png',
          infor: 'Tươi ngon, giàu vitamin và chất xơ.',
        ),
      ),
      Item(
        imagePath: 'assets/images/pepper.png',
        name: 'Bell Pepper',
        price: 3.0,
        foodType: FoodType(
          name: 'Fruits & Vegetables',
          imagePath: 'assets/images/fruits.png',
          infor: 'Tươi ngon, giàu vitamin và chất xơ.',
        ),
      ),

      // 2. Cooking Oil & Ghee
      Item(
        imagePath: 'assets/images/olive_oil.png',
        name: 'Olive Oil',
        price: 6.0,
        unit: '500ml',
        foodType: FoodType(
          name: 'Cooking Oil & Ghee',
          imagePath: 'assets/images/oil.png',
          infor: 'Dầu ăn và bơ giàu năng lượng, tốt cho tim mạch.',
        ),
      ),
      Item(
        imagePath: 'assets/images/coconut_oil.png',
        name: 'Coconut Oil',
        price: 5.5,
        unit: '500ml',
        foodType: FoodType(
          name: 'Cooking Oil & Ghee',
          imagePath: 'assets/images/oil.png',
          infor: 'Dầu ăn và bơ giàu năng lượng, tốt cho tim mạch.',
        ),
      ),
      Item(
        imagePath: 'assets/images/ghee.png',
        name: 'Ghee Butter',
        price: 4.8,
        unit: '200g',
        foodType: FoodType(
          name: 'Cooking Oil & Ghee',
          imagePath: 'assets/images/oil.png',
          infor: 'Dầu ăn và bơ giàu năng lượng, tốt cho tim mạch.',
        ),
      ),

      // 3. Meat & Fish
      Item(
        imagePath: 'assets/images/chicken.png',
        name: 'Chicken Breast',
        price: 7.0,
        foodType: FoodType(
          name: 'Meat & Fish',
          imagePath: 'assets/images/meat.png',
          infor: 'Nguồn protein chất lượng cao.',
        ),
      ),
      Item(
        imagePath: 'assets/images/beef.png',
        name: 'Beef Steak',
        price: 10.5,
        foodType: FoodType(
          name: 'Meat & Fish',
          imagePath: 'assets/images/meat.png',
          infor: 'Nguồn protein chất lượng cao.',
        ),
      ),
      Item(
        imagePath: 'assets/images/salmon.png',
        name: 'Salmon Fillet',
        price: 12.0,
        foodType: FoodType(
          name: 'Meat & Fish',
          imagePath: 'assets/images/meat.png',
          infor: 'Nguồn protein chất lượng cao.',
        ),
      ),

      // 4. Bakery & Snacks
      Item(
        imagePath: 'assets/images/baguette.png',
        name: 'Baguette',
        price: 2.0,
        foodType: FoodType(
          name: 'Bakery & Snacks',
          imagePath: 'assets/images/bakery.png',
          infor: 'Bánh mì, bánh ngọt và đồ ăn vặt.',
        ),
      ),
      Item(
        imagePath: 'assets/images/croissant.png',
        name: 'Croissant',
        price: 2.5,
        foodType: FoodType(
          name: 'Bakery & Snacks',
          imagePath: 'assets/images/bakery.png',
          infor: 'Bánh mì, bánh ngọt và đồ ăn vặt.',
        ),
      ),
      Item(
        imagePath: 'assets/images/cookies.png',
        name: 'Cookies',
        price: 3.2,
        foodType: FoodType(
          name: 'Bakery & Snacks',
          imagePath: 'assets/images/bakery.png',
          infor: 'Bánh mì, bánh ngọt và đồ ăn vặt.',
        ),
      ),

      // 5. Dairy & Eggs
      Item(
        imagePath: 'assets/images/milk.png',
        name: 'Whole Milk',
        price: 1.8,
        foodType: FoodType(
          name: 'Dairy & Eggs',
          imagePath: 'assets/images/dairy.png',
          infor: 'Sữa, phô mai và trứng tươi.',
        ),
      ),
      Item(
        imagePath: 'assets/images/cheese.png',
        name: 'Cheddar Cheese',
        price: 4.0,
        foodType: FoodType(
          name: 'Dairy & Eggs',
          imagePath: 'assets/images/dairy.png',
          infor: 'Sữa, phô mai và trứng tươi.',
        ),
      ),
      Item(
        imagePath: 'assets/images/eggs.png',
        name: 'Free-range Eggs',
        price: 3.5,
        foodType: FoodType(
          name: 'Dairy & Eggs',
          imagePath: 'assets/images/dairy.png',
          infor: 'Sữa, phô mai và trứng tươi.',
        ),
      ),

      // 6. Beverages
      Item(
        imagePath: 'assets/images/juice.png',
        name: 'Orange Juice',
        price: 3.0,
        unit: '300ml',
        foodType: FoodType(
          name: 'Beverages',
          imagePath: 'assets/images/beverages.png',
          infor: 'Nước giải khát, nước ép, trà, cà phê.',
        ),
      ),
      Item(
        imagePath: 'assets/images/tea.png',
        name: 'Green Tea',
        price: 2.2,
        unit: '250ml',
        foodType: FoodType(
          name: 'Beverages',
          imagePath: 'assets/images/beverages.png',
          infor: 'Nước giải khát, nước ép, trà, cà phê.',
        ),
      ),
      Item(
        imagePath: 'assets/images/coffee.png',
        name: 'Espresso',
        price: 2.8,
        unit: '60ml',
        foodType: FoodType(
          name: 'Beverages',
          imagePath: 'assets/images/beverages.png',
          infor: 'Nước giải khát, nước ép, trà, cà phê.',
        ),
      ),

      // 7. Seafood
      Item(
        imagePath: 'assets/images/shrimp.png',
        name: 'Shrimp',
        price: 9.0,
        foodType: FoodType(
          name: 'Seafood',
          imagePath: 'assets/images/seafood.png',
          infor: 'Hải sản tươi sống: cá, tôm, mực...',
        ),
      ),
      Item(
        imagePath: 'assets/images/oysters.png',
        name: 'Oysters',
        price: 11.5,
        foodType: FoodType(
          name: 'Seafood',
          imagePath: 'assets/images/seafood.png',
          infor: 'Hải sản tươi sống: cá, tôm, mực...',
        ),
      ),
      Item(
        imagePath: 'assets/images/crab.png',
        name: 'Crab Legs',
        price: 13.0,
        foodType: FoodType(
          name: 'Seafood',
          imagePath: 'assets/images/seafood.png',
          infor: 'Hải sản tươi sống: cá, tôm, mực...',
        ),
      ),

      // 8. Grains & Pasta
      Item(
        imagePath: 'assets/images/rice.png',
        name: 'Brown Rice',
        price: 2.5,
        foodType: FoodType(
          name: 'Grains & Pasta',
          imagePath: 'assets/images/grains.png',
          infor: 'Gạo, mì, ngũ cốc nguyên hạt.',
        ),
      ),
      Item(
        imagePath: 'assets/images/spaghetti.png',
        name: 'Spaghetti',
        price: 2.0,
        foodType: FoodType(
          name: 'Grains & Pasta',
          imagePath: 'assets/images/grains.png',
          infor: 'Gạo, mì, ngũ cốc nguyên hạt.',
        ),
      ),
      Item(
        imagePath: 'assets/images/quinoa.png',
        name: 'Quinoa',
        price: 4.5,
        foodType: FoodType(
          name: 'Grains & Pasta',
          imagePath: 'assets/images/grains.png',
          infor: 'Gạo, mì, ngũ cốc nguyên hạt.',
        ),
      ),

      // 9. Condiments & Spices
      Item(
        imagePath: 'assets/images/pepper_spice.png',
        name: 'Black Pepper',
        price: 1.5,
        foodType: FoodType(
          name: 'Condiments & Spices',
          imagePath: 'assets/images/spices.png',
          infor: 'Gia vị, sốt, muối, tiêu...',
        ),
      ),
      Item(
        imagePath: 'assets/images/soy_sauce.png',
        name: 'Soy Sauce',
        price: 2.3,
        foodType: FoodType(
          name: 'Condiments & Spices',
          imagePath: 'assets/images/spices.png',
          infor: 'Gia vị, sốt, muối, tiêu...',
        ),
      ),
      Item(
        imagePath: 'assets/images/mustard.png',
        name: 'Mustard',
        price: 2.0,
        foodType: FoodType(
          name: 'Condiments & Spices',
          imagePath: 'assets/images/spices.png',
          infor: 'Gia vị, sốt, muối, tiêu...',
        ),
      ),

      // 10. Frozen Foods
      Item(
        imagePath: 'assets/images/pizza.png',
        name: 'Frozen Pizza',
        price: 5.0,
        foodType: FoodType(
          name: 'Frozen Foods',
          imagePath: 'assets/images/frozen.png',
          infor: 'Thức ăn đông lạnh tiện lợi.',
        ),
      ),
      Item(
        imagePath: 'assets/images/icecream.png',
        name: 'Ice Cream',
        price: 3.5,
        foodType: FoodType(
          name: 'Frozen Foods',
          imagePath: 'assets/images/frozen.png',
          infor: 'Thức ăn đông lạnh tiện lợi.',
        ),
      ),
      Item(
        imagePath: 'assets/images/peas.png',
        name: 'Peas & Corn',
        price: 2.2,
        foodType: FoodType(
          name: 'Frozen Foods',
          imagePath: 'assets/images/frozen.png',
          infor: 'Thức ăn đông lạnh tiện lợi.',
        ),
      ),
    ];

    try {
      List<Item> _mockItemsForFoodType = []; 
      for(Item temp in itemList) {
        if(temp.foodType.name == selectedFoodType.name) {
          _mockItemsForFoodType.add(temp);
        }
      }

      emit(ItemLoadedState(mockItemsForFoodType: _mockItemsForFoodType, selectedFoodType: selectedFoodType));
    }
    catch(e) {
      emit(ItemErrorState());
    }
    
  }
}