import '../model/item.dart';


// class HomeState {
//   final List<String> itemsDiscount;
//   final List<item> itemsExclusive;
//   final List<item> itemsBS;
//   final List<itemExplore> itemsGroceries;
//   final List<item> items;
//   bool  isLoading;

//     HomeState({
//     required this.itemsDiscount,
//     required this.itemsExclusive,
//     required this.itemsBS,
//     required this.itemsGroceries,
//     required this.items,
//     this.isLoading = false
//   });

//   HomeState copyWith({
//     bool? isLoading,
//     List<String>? itemsDiscount,
//     List<item>? itemsExclusive,
//     List<item>? itemsBS,
//     List<itemExplore>? itemsGroceries,
//     List<item>? items,
//   }) {
//     return HomeState({
//       this.itemsDiscount,
//       this.itemsExclusive,
//       this.itemsBS,
//       this.itemsGroceries,
//       this.items,
//       isLoading: isLoading?? this.isLoading,
//     });
//   }

// }

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