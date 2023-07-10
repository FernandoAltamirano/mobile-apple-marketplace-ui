import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(ConfigInitialState()) {
    on<SetScreenEvent>((event, emit) => emit(ConfigInitialState(
        currentScreen: event.currentScreen,
        scrollOffsetCategories: state.scrollOffsetCategories,
        selectedCategory: state.selectedCategory)));
    on<SetCategoryEvent>((event, emit) => emit(ConfigInitialState(
        currentScreen: state.currentScreen,
        scrollOffsetCategories: state.scrollOffsetCategories,
        selectedCategory: event.selectedCategory)));
    on<SetScrollOffsetCategoriesEvent>((event, emit) => {
          print(event.offset),
          emit(ConfigInitialState(
              currentScreen: state.currentScreen,
              selectedCategory: state.selectedCategory,
              scrollOffsetCategories: event.offset))
        });
  }
}
