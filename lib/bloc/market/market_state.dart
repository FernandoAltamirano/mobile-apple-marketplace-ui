part of 'market_bloc.dart';

@immutable
abstract class MarketState {
  final List<Product> products;
  final List<dynamic> cart;
  final List<String> favorites;
  final bool getAllProductsLoading;
  final Product? selectedProduct;
  MarketState(
      {this.products = const [],
      this.cart = const [],
      this.selectedProduct,
      this.favorites = const [],
      this.getAllProductsLoading = false});
}

class MarketInitialState extends MarketState {
  final List<Product> products;
  final List<dynamic> cart;
  final bool getAllProductsLoading;
  final Product? selectedProduct;
  final List<String> favorites;
  MarketInitialState(
      {this.products = const [],
      this.cart = const [],
      this.selectedProduct,
      this.favorites = const [],
      this.getAllProductsLoading = false})
      : super(
            products: products,
            cart: cart,
            favorites: favorites,
            selectedProduct: selectedProduct,
            getAllProductsLoading: getAllProductsLoading);
}
