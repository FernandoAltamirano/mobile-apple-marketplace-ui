part of 'config_bloc.dart';

@immutable
abstract class ConfigState {
  final String currentScreen;
  final String selectedCategory;
  final double scrollOffsetCategories;

  ConfigState(
      {this.currentScreen = "Home",
      this.selectedCategory = "All",
      this.scrollOffsetCategories = 0});
}

class ConfigInitialState extends ConfigState {
  final String currentScreen;
  final String selectedCategory;
  final double scrollOffsetCategories;
  ConfigInitialState(
      {this.currentScreen = "Home",
      this.selectedCategory = "All",
      this.scrollOffsetCategories = 0})
      : super(
            currentScreen: currentScreen,
            selectedCategory: selectedCategory,
            scrollOffsetCategories: scrollOffsetCategories);
}

class ConfigScreenState extends ConfigState {
  final String currentScreen;
  ConfigScreenState(this.currentScreen) : super(currentScreen: currentScreen);
}

class ConfigCategoryState extends ConfigState {
  final String selectedCategory;
  ConfigCategoryState(this.selectedCategory)
      : super(selectedCategory: selectedCategory);
}
