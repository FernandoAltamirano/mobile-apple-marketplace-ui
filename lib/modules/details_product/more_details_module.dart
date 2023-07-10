import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/models/product_model.dart';
import 'package:apple_store_ui/modules/modules.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MoreDetailsModule extends StatelessWidget {
  const MoreDetailsModule({
    super.key,
    required this.product,
    required this.favorites,
  });
  final Product product;
  final List<String> favorites;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PromotionBadge(
                  value: (product.discountPercentage * 10).toString()),
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<MarketBloc>(context)
                        .add(SetFavoritesEvent(product.id));
                  },
                  child: favorites.contains(product.id)
                      ? SvgPicture.asset("assets/icons/heart-red.svg")
                      : Opacity(
                          opacity: 0.3,
                          child: SvgPicture.asset(
                              "assets/icons/heart-active.svg"))),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            product.name,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: CurrentTheme.grayTextColor),
          ),
          const SizedBox(height: 10),
          Text(
            "\$ ${product.price.toString()}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          RatingRowModule(product: product),
          const SizedBox(height: 20),
          Text(
            product.description,
            style: const TextStyle(
                fontSize: 16, color: CurrentTheme.grayTextColor),
          ),
          const SizedBox(height: 20),
          SelectorBadgesModule(
            title: "Select memory",
            array: product.memorySize,
          ),
          const SizedBox(height: 20),
          SelectorBadgesModule(
            title: "Select color",
            array: product.colors,
          )
        ],
      ),
    );
  }
}
