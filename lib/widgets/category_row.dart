import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:flutter/material.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
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
          height: 420,
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
                  ...state.products.map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(251, 251, 251, 255),
                                borderRadius: BorderRadius.circular(
                                    CurrentTheme.borderRadius)),
                            margin: const EdgeInsets.only(right: 20),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 270,
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<ConfigBloc>(context).add(
                                    SetScreenEvent(currentScreen: "Details"));
                                BlocProvider.of<MarketBloc>(context)
                                    .add(SetSelectedProductEvent(product: e));
                              },
                              child: Stack(
                                children: [
                                  Center(
                                      child: Image(
                                    image: NetworkImage(e.images.first),
                                    width: 200,
                                  )),
                                  const Positioned(
                                      left: 10,
                                      top: 10,
                                      child: PromotionBadge(
                                        value: "5",
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(e.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: CurrentTheme.grayTextColor)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("\$ ${e.price}",
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
                                e.rating.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CurrentTheme.grayTextColor
                                        .withOpacity(0.8)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                color:
                                    CurrentTheme.grayTextColor.withOpacity(0.8),
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
                                    color: CurrentTheme.grayTextColor
                                        .withOpacity(0.8)),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
