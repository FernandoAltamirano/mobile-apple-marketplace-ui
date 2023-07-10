import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselNewsModule extends StatelessWidget {
  const CarouselNewsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 140,
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(CurrentTheme.borderRadius),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(CurrentTheme.borderRadius)),
                child: Image.asset(
                  "assets/images/banner.png",
                  fit: BoxFit.cover,
                )),
          ),
        );
      }).toList(),
    );
  }
}
