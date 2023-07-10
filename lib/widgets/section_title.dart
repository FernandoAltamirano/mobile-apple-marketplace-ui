import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600));
  }
}
