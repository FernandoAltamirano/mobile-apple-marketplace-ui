import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/models/product_model.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(251, 251, 251, 255),
                borderRadius: BorderRadius.circular(CurrentTheme.borderRadius)),
            margin: const EdgeInsets.only(right: 20),
            width: MediaQuery.of(context).size.width * 0.4,
            height: 220,
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ConfigBloc>(context)
                    .add(SetScreenEvent(currentScreen: "Details"));
                BlocProvider.of<MarketBloc>(context)
                    .add(SetSelectedProductEvent(product: product));
              },
              child: Stack(
                children: [
                  Center(
                      child: Image(
                    image: NetworkImage(product.images.first),
                    width: 200,
                    height: 150,
                  )),
                  if (product.discountPercentage > 0)
                    Positioned(
                        left: 10,
                        top: 10,
                        child: PromotionBadge(
                          value: product.discountPercentage.toString(),
                        ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(product.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: CurrentTheme.grayTextColor)),
          const SizedBox(
            height: 10,
          ),
          Text("\$ ${product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Color(0xffFEC841),
                size: 25,
              ),
              Text(
                product.rating.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CurrentTheme.grayTextColor.withOpacity(0.8)),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                color: CurrentTheme.grayTextColor.withOpacity(0.8),
                height: 17,
                width: 1,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "666 sold",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CurrentTheme.grayTextColor.withOpacity(0.8)),
              )
            ],
          )
        ],
      ),
    );
  }
}
