part of 'market_bloc.dart';

@immutable
class MarketState {
  final List<Product> products;
  final List<dynamic> cart;
  final bool getAllProductsLoading;
  final Product? selectedProduct;
  final List<String> favorites;
  const MarketState(
      {this.products = const [],
      this.cart = const [],
      this.selectedProduct,
      this.favorites = const [],
      this.getAllProductsLoading = false});

  copyWith({
    List<Product>? products,
    List<dynamic>? cart,
    bool? getAllProductsLoading,
    Product? selectedProduct,
    List<String>? favorites,
  }) =>
      MarketState(
          products: products ?? this.products,
          cart: cart ?? this.cart,
          getAllProductsLoading:
              getAllProductsLoading ?? this.getAllProductsLoading,
          selectedProduct: selectedProduct ?? this.selectedProduct,
          favorites: favorites ?? this.favorites);
}
