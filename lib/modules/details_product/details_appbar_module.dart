import 'package:flutter/material.dart';
import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsAppbarModule extends StatelessWidget {
  const DetailsAppbarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppbarButton(
            icon: "assets/icons/arrow-left.svg",
            onTap: () {
              BlocProvider.of<ConfigBloc>(context)
                  .add(SetScreenEvent(currentScreen: "Home"));
            }),
        const Text("Product Details"),
        AppbarButton(
            icon: "assets/icons/more.svg",
            onTap: () {
              BlocProvider.of<ConfigBloc>(context)
                  .add(SetScreenEvent(currentScreen: "Home"));
            })
      ],
    );
  }
}
