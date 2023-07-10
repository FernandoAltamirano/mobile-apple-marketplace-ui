import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:apple_store_ui/models/models.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(MarketInitialState()) {
    on<MarketInitialEvent>((event, emit) => emit(MarketInitialState(
        products: event.products,
        cart: state.cart,
        favorites: state.favorites,
        selectedProduct: state.selectedProduct,
        getAllProductsLoading: false)));
    on<SetGetAllProductsLoadingEvent>((event, emit) => emit(MarketInitialState(
        products: state.products,
        cart: state.cart,
        favorites: state.favorites,
        selectedProduct: state.selectedProduct,
        getAllProductsLoading: event.loading)));
    on<SetSelectedProductEvent>((event, emit) => emit(MarketInitialState(
        products: state.products,
        cart: state.cart,
        selectedProduct: event.product,
        favorites: state.favorites,
        getAllProductsLoading: state.getAllProductsLoading)));
    on<SetFavoritesEvent>((event, emit) {
      List<String> newFavorites = [...state.favorites];
      if (newFavorites.isEmpty) {
        newFavorites.add(event.id);
      } else {
        final selectedFavorite = newFavorites.where((fav) => fav == event.id);
        if (selectedFavorite.isEmpty) {
          newFavorites.add(event.id);
        } else {
          newFavorites.remove(event.id);
        }
      }
      emit(MarketInitialState(
          products: state.products,
          cart: state.cart,
          selectedProduct: state.selectedProduct,
          favorites: newFavorites,
          getAllProductsLoading: state.getAllProductsLoading));
    });
  }
}
