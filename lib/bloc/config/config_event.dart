part of 'config_bloc.dart';

@immutable
abstract class ConfigEvent {}

class SetScreenEvent extends ConfigEvent {
  final String currentScreen;
  SetScreenEvent({required this.currentScreen});
}

class SetCategoryEvent extends ConfigEvent {
  final String selectedCategory;
  SetCategoryEvent({required this.selectedCategory});
}

class SetScrollOffsetCategoriesEvent extends ConfigEvent {
  final double offset;
  SetScrollOffsetCategoriesEvent({required this.offset});
}
