import 'package:flutter_application_1/foodType/foodType_model.dart';
import 'package:flutter_application_1/foodType/foodType_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodTypeCubit extends Cubit<FoodTypeState> {
  FoodTypeCubit():super(FoodTypeInitialState());

  void loadFoodTypesData() {
    //set trạng thái đang lây dữ liệu
    emit(FoodTypeLoadingState());
    //bắt đầu lấy dữ liệu
    try {
      List<FoodType> foodTypes = 
      [
        FoodType(name: 'Fruits & Vegetables', imagePath: 'assets/images/fruits.png', infor: 'Tươi ngon, giàu vitamin và chất xơ.'),
        FoodType(name: 'Cooking Oil & Ghee',    imagePath: 'assets/images/oil.png',   infor: 'Dầu ăn và bơ giàu năng lượng, tốt cho tim mạch.'),
        FoodType(name: 'Meat & Fish',           imagePath: 'assets/images/meat.png',  infor: 'Nguồn protein chất lượng cao.'),
        FoodType(name: 'Bakery & Snacks',       imagePath: 'assets/images/bakery.png',infor: 'Bánh mì, bánh ngọt và đồ ăn vặt.'),
        FoodType(name: 'Dairy & Eggs',          imagePath: 'assets/images/dairy.png', infor: 'Sữa, phô mai và trứng tươi.'),
        FoodType(name: 'Beverages',             imagePath: 'assets/images/beverages.png', infor: 'Nước giải khát, nước ép, trà, cà phê.'),
        FoodType(name: 'Seafood',               imagePath: 'assets/images/seafood.png',  infor: 'Hải sản tươi sống: cá, tôm, mực...'),
        FoodType(name: 'Grains & Pasta',        imagePath: 'assets/images/grains.png',   infor: 'Gạo, mì, ngũ cốc nguyên hạt.'),
        FoodType(name: 'Condiments & Spices',   imagePath: 'assets/images/spices.png',   infor: 'Gia vị, sốt, muối, tiêu...'),
        FoodType(name: 'Frozen Foods',          imagePath: 'assets/images/frozen.png',   infor: 'Thức ăn đông lạnh tiện lợi.')
      ];
      emit(FoodTypeLoadedState( foodTypes: foodTypes));
    }
    catch(e) {
      emit(FoodTypeErrorState());
    }
  }
}