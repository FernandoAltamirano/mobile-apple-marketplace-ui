import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UbicationSelector extends StatelessWidget {
  const UbicationSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          enableDrag: true,
          context: context,
          builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.4, // Altura inicial del modal
              minChildSize: 0.25, // Altura mínima del modal
              maxChildSize: 1, // Altura máxima del modal
              expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  height: 1000,
                );
              }),
        );
      },
      child: Row(
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
      ),
    );
  }
}
