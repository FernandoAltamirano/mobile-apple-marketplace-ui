import 'package:flutter/material.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/modules/modules.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FavoritesAppbarModule(),
        ),
        const SizedBox(height: 20),
        BlocBuilder<MarketBloc, MarketState>(
          builder: (context, state) {
            if (state.favorites.isEmpty) {
              return const Empty(
                text: "No favorites yet",
                buttonText: "Add favorites",
              );
            }
            return FavoritesListModule(
              products: state.products,
              favoritesList: state.favorites,
            );
          },
        )
      ],
    );
  }
}
