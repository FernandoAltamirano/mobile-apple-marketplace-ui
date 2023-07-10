import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:apple_store_ui/bloc/config/config_bloc.dart';

class AppbarModule extends StatelessWidget {
  const AppbarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 42,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(100)),
                child: TextField(
                  onChanged: (value) => {print(value)},
                  //change color text
                  style:
                      const TextStyle(color: Color.fromRGBO(98, 111, 119, 1)),
                  decoration: InputDecoration(
                      hintText: "Search articles...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 5),
                        child: SvgPicture.asset(
                          "assets/icons/search.svg",
                          width: 12,
                          height: 12,
                        ),
                      )),
                ),
              ),
            ),
            const SizedBox(width: 10),
            AppbarButton(
              icon: "assets/icons/bag.svg",
              onTap: () {
                BlocProvider.of<ConfigBloc>(context)
                    .add(SetScreenEvent(currentScreen: "Cart"));
              },
            ),
            const SizedBox(width: 10),
            AppbarButton(
              icon: "assets/icons/notification.svg",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SvgPicture.asset("assets/icons/location.svg"),
            const SizedBox(width: 10),
            const Row(
              children: [
                Text("Ships to"),
                SizedBox(width: 5),
                Text(
                  "Callao, Lima - Perú",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(
              "assets/icons/arrow-down.svg",
              width: 15,
            ),
          ],
        )
      ],
    );
  }
}
