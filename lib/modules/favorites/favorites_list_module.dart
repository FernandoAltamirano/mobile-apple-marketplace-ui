import 'package:flutter/material.dart';
import 'package:apple_store_ui/models/product_model.dart';
import 'package:apple_store_ui/widgets/widgets.dart';

class FavoritesListModule extends StatelessWidget {
  const FavoritesListModule(
      {super.key, required this.products, required this.favoritesList});
  final List<Product> products;
  final List<String> favoritesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          ...products
              .where((element) => favoritesList.contains(element.id))
              .toList()
              .map((e) => ProductCard(product: e))
        ],
      ),
    );
  }
}
