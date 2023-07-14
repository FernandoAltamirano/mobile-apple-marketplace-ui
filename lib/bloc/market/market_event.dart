part of 'market_bloc.dart';

@immutable
abstract class MarketEvent {}

class MarketInitialEvent extends MarketEvent {
  final List<Product> products;
  MarketInitialEvent({this.products = const []});
}

class SetGetAllProductsLoadingEvent extends MarketEvent {
  final bool loading;
  SetGetAllProductsLoadingEvent({this.loading = false});
}

class SetSelectedProductEvent extends MarketEvent {
  final Product product;
  SetSelectedProductEvent({required this.product});
}

class SetFavoritesEvent extends MarketEvent {
  final String id;
  SetFavoritesEvent(this.id);
}

class AddToCartEvent extends MarketEvent {
  final String id;
  final String selectedMemorySize;
  final String selectedColor;
  final double price;
  AddToCartEvent(
      {required this.id,
      required this.selectedMemorySize,
      required this.price,
      required this.selectedColor});
}

class SetQuantityEvent extends MarketEvent {
  final String id;
  final int quantity;
  SetQuantityEvent({required this.id, required this.quantity});
}

class RemoveFromCartEvent extends MarketEvent {
  final String id;
  RemoveFromCartEvent({required this.id});
}
