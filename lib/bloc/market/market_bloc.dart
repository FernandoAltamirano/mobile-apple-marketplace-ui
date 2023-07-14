import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:apple_store_ui/models/models.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(const MarketState()) {
    on<MarketInitialEvent>((event, emit) => emit(state.copyWith(
        products: event.products, getAllProductsLoading: false)));

    on<SetGetAllProductsLoadingEvent>((event, emit) =>
        emit(state.copyWith(getAllProductsLoading: event.loading)));

    on<SetSelectedProductEvent>(
        (event, emit) => emit(state.copyWith(selectedProduct: event.product)));

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
      emit(state.copyWith(favorites: newFavorites));
    });

    on<AddToCartEvent>((event, emit) {
      List<dynamic> newCart = [...state.cart];
      final selectedProduct = newCart.where((p) => p['id'] == event.id);
      if (selectedProduct.isEmpty) {
        newCart.add({
          'id': event.id,
          'memorySize': event.selectedMemorySize == ''
              ? (state.selectedProduct!.memorySize.isNotEmpty
                  ? state.selectedProduct!.memorySize[0]
                  : '')
              : event.selectedMemorySize,
          'color': event.selectedColor == ''
              ? (state.selectedProduct!.colors.isNotEmpty
                  ? state.selectedProduct!.colors[0]
                  : '')
              : event.selectedColor,
          'quantity': 1,
          'price': event.price
        });
      } else {
        final index = newCart.indexWhere((p) => p['id'] == event.id);
        newCart[index]['quantity']++;
      }
      emit(state.copyWith(cart: newCart));
    });

    on<SetQuantityEvent>((event, emit) {
      List<dynamic> newCart = [...state.cart];
      final index = newCart.indexWhere((p) => p['id'] == event.id);
      if (event.quantity > 0) {
        newCart[index]['quantity']++;
      } else {
        newCart[index]['quantity']--;
      }
      emit(state.copyWith(cart: newCart));
    });
    on<RemoveFromCartEvent>((event, emit) {
      List<dynamic> newCart = [...state.cart];
      final index = newCart.indexWhere((p) => p['id'] == event.id);
      newCart.removeAt(index);
      emit(state.copyWith(cart: newCart));
    });
  }
}
