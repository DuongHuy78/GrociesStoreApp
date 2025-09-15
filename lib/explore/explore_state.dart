import '../model/item.dart';

class ExploreState {
  List<itemExplore> items;
  bool isLoading;

  ExploreState({
    required this.items,
    this.isLoading = false
  });

    ExploreState copyWith({
    List<itemExplore>? items,
    bool? isLoading,
  }) {
    return ExploreState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}