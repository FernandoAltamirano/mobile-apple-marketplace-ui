import 'package:flutter/material.dart';
import 'package:apple_store_ui/models/product_model.dart';
import 'package:apple_store_ui/theme/current_theme.dart';

class RatingRowModule extends StatelessWidget {
  const RatingRowModule({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Color(0xffFEC841),
          size: 25,
        ),
        Text(
          product.rating.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
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
          "${product.stock} stock",
          style: TextStyle(
              fontWeight: FontWeight.w600,
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
          "${(product.rating * 101).toStringAsFixed(0)} reviewers",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CurrentTheme.grayTextColor.withOpacity(0.8)),
        ),
      ],
    );
  }
}
