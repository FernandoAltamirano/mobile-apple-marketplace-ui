part of 'config_bloc.dart';

@immutable
class ConfigState {
  final String currentScreen;
  final String selectedCategory;
  final double scrollOffsetCategories;
  const ConfigState(
      {this.currentScreen = "Home",
      this.selectedCategory = "All",
      this.scrollOffsetCategories = 0});

  copyWith({
    String? currentScreen,
    String? selectedCategory,
    double? scrollOffsetCategories,
  }) {
    return ConfigState(
      currentScreen: currentScreen ?? this.currentScreen,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      scrollOffsetCategories:
          scrollOffsetCategories ?? this.scrollOffsetCategories,
    );
  }
}
