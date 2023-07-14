import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configBloc = BlocProvider.of<ConfigBloc>(context);

    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(40)),
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationItem(
                  configBloc: configBloc,
                  name: "Home",
                  icon: state.currentScreen == "Home"
                      ? "assets/icons/home-active.svg"
                      : "assets/icons/home.svg",
                  isActive: state.currentScreen == "Home"),
              NavigationItem(
                  configBloc: configBloc,
                  name: "Receipts",
                  icon: state.currentScreen == "Receipts"
                      ? "assets/icons/receipt-active.svg"
                      : "assets/icons/receipt.svg",
                  isActive: state.currentScreen == "Receipts"),
              NavigationItem(
                  configBloc: configBloc,
                  name: "Favorites",
                  icon: state.currentScreen == "Favorites"
                      ? "assets/icons/heart-active.svg"
                      : "assets/icons/heart.svg",
                  isActive: state.currentScreen == "Favorites"),
              NavigationItem(
                  configBloc: configBloc,
                  name: "Profile",
                  icon: state.currentScreen == "Profile"
                      ? "assets/icons/profile-active.svg"
                      : "assets/icons/profile.svg",
                  isActive: state.currentScreen == "Profile"),
            ],
          );
        },
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  const NavigationItem(
      {super.key,
      required this.icon,
      required this.isActive,
      required this.configBloc,
      required this.name});

  final String icon;
  final bool isActive;
  final ConfigBloc configBloc;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        configBloc.add(SetScreenEvent(currentScreen: name));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(100)),
        child: SvgPicture.asset(
          icon,
          width: 30,
        ),
      ),
    );
  }
}
