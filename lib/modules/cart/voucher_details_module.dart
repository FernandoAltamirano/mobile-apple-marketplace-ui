import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/utils/subtotal.dart';
import 'package:flutter/material.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherDetailsModule extends StatelessWidget {
  const VoucherDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Use a coupon for a special price",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: CurrentTheme.grayTextColor),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(100)),
          child: TextField(
            onChanged: (value) => {print(value)},
            //change color text
            style: const TextStyle(color: Color.fromRGBO(98, 111, 119, 1)),
            decoration: const InputDecoration(
                hintText: "Insert coupon code",
                hintStyle: TextStyle(color: CurrentTheme.grayTextColor),
                border: InputBorder.none),
          ),
        ),
        BlocBuilder<MarketBloc, MarketState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sub total",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: CurrentTheme.grayTextColor),
                    ),
                    Text(
                      "\$ ${subtotal(state.cart).toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery cost",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: CurrentTheme.grayTextColor),
                    ),
                    Text(
                      "\$ 20.40",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Voucher discount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: CurrentTheme.grayTextColor),
                    ),
                    Text(
                      "- \$ 35.00",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 214, 33, 33)),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: Color.fromRGBO(98, 111, 119, 0.2),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: CurrentTheme.grayTextColor),
                    ),
                    Text(
                      "\$ 1885.40",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
