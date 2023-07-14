import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

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
          height: 340,
          child: BlocBuilder<MarketBloc, MarketState>(
            builder: (context, state) {
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children: state.getAllProductsLoading
                      ? [...List.generate(5, (index) => const SkeletonItem())]
                      : [
                          ...state.products.map((e) => ProductCard(product: e))
                        ]);
            },
          ),
        )
      ],
    );
  }
}

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 200,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SkeletonParagraph(
              style: SkeletonParagraphStyle(
                  lines: 3,
                  spacing: 6,
                  lineStyle: SkeletonLineStyle(
                    randomLength: true,
                    width: 30,
                    height: 10,
                    borderRadius: BorderRadius.circular(8),
                    minLength: MediaQuery.of(context).size.width / 5,
                    maxLength: MediaQuery.of(context).size.width / 3,
                  )))
        ],
      ),
    );
  }
}
