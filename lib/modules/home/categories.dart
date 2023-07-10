import 'package:flutter/material.dart';
import 'package:apple_store_ui/widgets/widgets.dart';

class CategoriesModule extends StatelessWidget {
  const CategoriesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryRow(title: "Most sales", showCounter: true),
        CategoryRow(title: "Recommended for you"),
      ],
    );
  }
}
