import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(const ConfigState()) {
    on<SetScreenEvent>((event, emit) =>
        emit(state.copyWith(currentScreen: event.currentScreen)));
    on<SetCategoryEvent>((event, emit) =>
        emit(state.copyWith(selectedCategory: event.selectedCategory)));
    on<SetScrollOffsetCategoriesEvent>((event, emit) =>
        emit(state.copyWith(scrollOffsetCategories: event.offset)));
  }
}
