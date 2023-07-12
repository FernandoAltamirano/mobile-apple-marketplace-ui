import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({Key? key, required this.title, this.showCounter = false})
      : super(key: key);
  final String title;
  final bool showCounter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitle(title: title),
            if (showCounter) const Counter()
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 380,
          child: BlocBuilder<MarketBloc, MarketState>(
            builder: (context, state) {
              if (state.getAllProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...state.products.map((e) => ProductCard(product: e))
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
