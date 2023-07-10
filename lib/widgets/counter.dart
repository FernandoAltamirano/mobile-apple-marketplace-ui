import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: CurrentTheme.lightBlue,
              borderRadius: BorderRadius.circular(CurrentTheme.borderRadius)),
          child: Center(
              child: Text(
            "10",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CurrentTheme.blue),
          )),
        ),
        const SizedBox(
          width: 20,
          child: Center(
              child: Text(
            ":",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: CurrentTheme.lightBlue,
              borderRadius: BorderRadius.circular(CurrentTheme.borderRadius)),
          child: Center(
              child: Text(
            "10",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CurrentTheme.blue),
          )),
        ),
        const SizedBox(
          width: 20,
          child: Center(
              child: Text(
            ":",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: CurrentTheme.lightBlue,
              borderRadius: BorderRadius.circular(CurrentTheme.borderRadius)),
          child: Center(
              child: Text(
            "10",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CurrentTheme.blue),
          )),
        )
      ],
    );
  }
}
