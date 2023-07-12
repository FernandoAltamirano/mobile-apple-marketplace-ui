import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/modules/favorites/favorites_appbar_module.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return Center(
                  heightFactor: 4,
                  child: Column(
                    children: [
                      const Text(
                        "No favorites yet",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<ConfigBloc>(context)
                                .add(SetScreenEvent(currentScreen: "Home"));
                          },
                          child: const Text(
                            "Add favorites",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                color: CurrentTheme.blue),
                          ))
                    ],
                  ));
            }
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  ...state.products
                      .where((element) => state.favorites.contains(element.id))
                      .toList()
                      .map((e) => ProductCard(product: e))
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
