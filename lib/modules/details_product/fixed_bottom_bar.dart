import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixedBottomBar extends StatelessWidget {
  const FixedBottomBar({Key? key, required this.onTap}) : super(key: key);
  final Function(String, double, BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(10, -6),
              blurRadius: 12,
              spreadRadius: 2)
        ]),
        child: BlocBuilder<MarketBloc, MarketState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                          color: CurrentTheme.grayTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ ${state.selectedProduct!.price}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    onTap(state.selectedProduct!.id,
                        state.selectedProduct!.price, context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CurrentTheme.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200))),
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                )
              ],
            );
          },
        ));
  }
}
