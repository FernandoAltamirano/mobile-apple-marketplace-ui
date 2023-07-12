import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:apple_store_ui/models/models.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(MarketState()) {
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
  }
}
