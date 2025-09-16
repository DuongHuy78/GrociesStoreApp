import 'package:flutter_application_1/productDetails/productDetails_state.dart';
import '../model/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState>{
  static const int MAXCOUNT = 5;
  static const int MINCOUNT = 1;
  ProductDetailsCubit(item product) : super(ProductDetailsState(product: product));

  void increment() {
    final current = state.product.count;
    if (current < MAXCOUNT) {
      emit(state.copyWith(count: current + 1));
    }
  }

  void decrement() {
    final current = state.product.count;
    if (current > 1) {
      emit(state.copyWith(count: current - 1));
    }
  }

  bool isCountMin(int value) {
    return (value <= MINCOUNT);
  }

  bool isCountMax(int value) {
    return (value >= MAXCOUNT);
  }

  void toggleFavorite() {
    emit(state.copyWith(isLike: !state.product.isLike));
  }

  void updateDetail(String detail) {
    emit(state.copyWith(detail: detail));
  }

  void setProduct(item newProduct) {
    emit(state.copyWith(product: newProduct));
  }
}