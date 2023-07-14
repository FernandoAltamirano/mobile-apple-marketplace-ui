import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFixedBottomBar extends StatelessWidget {
  const CartFixedBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(10, -6),
              blurRadius: 12,
              spreadRadius: 2)
        ]),
        child: TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: CurrentTheme.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200))),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Go to payment",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              )),
        ));
  }
}
