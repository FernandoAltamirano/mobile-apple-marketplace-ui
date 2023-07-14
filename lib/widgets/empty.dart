import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Empty extends StatelessWidget {
  const Empty({
    super.key,
    required this.text,
    required this.buttonText,
  });
  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
        heightFactor: 4,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/bag-cross.svg",
              width: 50,
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () {
                  BlocProvider.of<ConfigBloc>(context)
                      .add(SetScreenEvent(currentScreen: "Home"));
                },
                child: Text(
                  buttonText,
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      color: CurrentTheme.blue),
                ))
          ],
        ));
  }
}
