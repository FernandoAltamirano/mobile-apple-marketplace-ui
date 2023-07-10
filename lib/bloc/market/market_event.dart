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
