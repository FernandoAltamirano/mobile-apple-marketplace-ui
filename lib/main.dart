import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:apple_store_ui/layouts/layouts.dart';
import 'package:apple_store_ui/screens/screens.dart';

void main() async {
  runApp(const BlocProviderContainer());
}

class BlocProviderContainer extends StatelessWidget {
  const BlocProviderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConfigBloc>(
          create: (context) => ConfigBloc(),
        ),
        BlocProvider<MarketBloc>(
          create: (context) => MarketBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        title: 'Apple store UI',
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ConfigBloc, ConfigState>(builder: (context, state) {
          if (state.currentScreen == 'Home') {
            return const HomeLayout(child: HomeScreen());
          }
          if (state.currentScreen == 'Favorites') {
            return const HomeLayout(child: FavoritesScreen());
          }
          if (state.currentScreen == 'Profile') {
            return const HomeLayout(child: ProfileScreen());
          }
          if (state.currentScreen == 'Cart') {
            return const HomeLayout(child: CartScreen());
          }
          if (state.currentScreen == 'Details') {
            return const DetailsLayout(child: DetailsProductScreen());
          }
          return const HomeLayout(child: NotFoundScreen());
        }));
  }
}
