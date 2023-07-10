import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppbarButton extends StatelessWidget {
  const AppbarButton({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(100)),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
