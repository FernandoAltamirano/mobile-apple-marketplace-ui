import 'package:apple_store_ui/api/api_client.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:flutter/material.dart';
import 'package:apple_store_ui/modules/modules.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final marketBloc = context.read<MarketBloc>();
    if (marketBloc.state.products.isNotEmpty) return;
    ApiClient.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: AppbarModule(),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: CarouselNewsModule(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CategoriesBadgesModule(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
          child: CategoriesModule(),
        ),
      ],
    );
  }
}
