import '../model/item.dart';


abstract class HomeState {}

class HomeLoading extends HomeState{
  bool isLoading;

  HomeLoading({
    this.isLoading = false
  });

  HomeLoading copyWith({
    bool? isLoading
  }) {
    return HomeLoading(
      isLoading: isLoading?? this.isLoading
    );
  }
}

class HomeLoaded extends HomeState{
  final List<String> itemsDiscount;
  final List<item> itemsExclusive;
  final List<item> itemsBS;
  final List<itemExplore> itemsGroceries;
  final List<item> items;

  HomeLoaded({
    required this.itemsDiscount,
    required this.itemsExclusive,
    required this.itemsBS,
    required this.itemsGroceries,
    required this.items,
  });

  
}