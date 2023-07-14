import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsListModule extends StatelessWidget {
  const ProductsListModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: BlocBuilder<MarketBloc, MarketState>(
        builder: (context, state) {
          if (state.cart.isEmpty) return const Center(child: Text("empty"));
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              ...state.cart.map((p) => ProductRow(
                  id: p['id'],
                  color: p['color'],
                  memorySize: p['memorySize'],
                  quantity: p['quantity']))
            ],
          );
        },
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  const ProductRow({
    super.key,
    required this.id,
    required this.color,
    required this.memorySize,
    required this.quantity,
  });
  final String id;
  final String color;
  final String memorySize;
  final int quantity;

  handleDecrementQuantity(BuildContext context) {
    if (quantity == 1) {
      handleShowDialog(context);
    } else {
      BlocProvider.of<MarketBloc>(context)
          .add(SetQuantityEvent(id: id, quantity: -1));
    }
  }

  Future<dynamic> handleShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Remove product"),
              content: const Text(
                  "Are you sure you want to remove this product from your cart?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<MarketBloc>(context)
                          .add(RemoveFromCartEvent(id: id));
                      Navigator.pop(context);
                    },
                    child: const Text("Remove"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final product = context
        .read<MarketBloc>()
        .state
        .products
        .where((element) => element.id == id)
        .first;

    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 224, 224, 224)))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(CurrentTheme.borderRadius),
                    border: Border.all(
                        color: const Color.fromARGB(255, 206, 206, 206))),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(CurrentTheme.borderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      product.images.first,
                      width: 70,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 86, 86, 86))),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("$color, $memorySize",
                      style: const TextStyle(
                          fontSize: 14, color: CurrentTheme.grayTextColor)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("\$ ${product.price}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Add Note",
                style: TextStyle(
                    color: CurrentTheme.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => handleShowDialog(context),
                    child: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Color.fromARGB(255, 188, 188, 188),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () => handleDecrementQuantity(context),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: CurrentTheme.blue)),
                        child: SvgPicture.asset("assets/icons/minus.svg")),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 220, 220, 220))),
                    ),
                    child: Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<MarketBloc>(context)
                          .add(SetQuantityEvent(id: id, quantity: 1));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: CurrentTheme.blue,
                          border: Border.all(color: CurrentTheme.blue)),
                      child: SvgPicture.asset("assets/icons/add.svg"),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
