import '../model/item.dart';

class ProductDetailsState {
  item product;

    ProductDetailsState({
      required this.product
  });

  ProductDetailsState copyWith({
    item? product,
    String? imagePath,
    String? name,
    double? price,
    String? unit,
    bool? isLike,
    int? count,
    String? detail,
  }) {
    final item newProduct = product ??
        item(
          imagePath: imagePath ?? this.product.imagePath,
          name: name ?? this.product.name,
          price: price ?? this.product.price,
          unit: unit ?? this.product.unit,
          isLike: isLike ?? this.product.isLike,
          count: count ?? this.product.count,
          detail: detail ?? this.product.detail,
        );

    return ProductDetailsState(product: newProduct);
  }
}