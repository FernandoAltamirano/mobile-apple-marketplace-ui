import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter/material.dart';

class PromotionBadge extends StatelessWidget {
  const PromotionBadge({Key? key, required this.value}) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: CurrentTheme.blue, borderRadius: BorderRadius.circular(20)),
      child: Text(
        "Cashback $value%",
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
