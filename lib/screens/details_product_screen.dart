import 'package:apple_store_ui/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: DetailsAppbarModule(),
        ),
        BlocBuilder<MarketBloc, MarketState>(
          builder: (context, state) {
            return Column(
              children: [
                PreviewImagesModule(
                  images: state.selectedProduct!.images,
                ),
                const SizedBox(height: 20),
                MoreDetailsModule(
                  product: state.selectedProduct!,
                  favorites: state.favorites,
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
