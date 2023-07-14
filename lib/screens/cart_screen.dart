import 'package:flutter/material.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:apple_store_ui/modules/modules.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CartAppbarModule(),
          SizedBox(height: 20),
          UbicationSelector(),
          ProductsListModule(),
          SizedBox(height: 20),
          VoucherDetailsModule(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
