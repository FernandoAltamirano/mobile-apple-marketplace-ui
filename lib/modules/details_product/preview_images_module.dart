import 'package:apple_store_ui/theme/current_theme.dart';
import 'package:flutter/material.dart';

class PreviewImagesModule extends StatefulWidget {
  const PreviewImagesModule({Key? key, required this.images}) : super(key: key);
  final List<String> images;

  @override
  State<PreviewImagesModule> createState() => _PreviewImagesModuleState();
}

class _PreviewImagesModuleState extends State<PreviewImagesModule> {
  int selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          children: [
            ...widget.images.map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImageIndex = widget.images.indexOf(e);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(CurrentTheme.borderRadius),
                        border: Border.all(
                            color:
                                selectedImageIndex != widget.images.indexOf(e)
                                    ? const Color.fromARGB(255, 206, 206, 206)
                                    : CurrentTheme.blue)),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(CurrentTheme.borderRadius),
                      child: Image.network(
                        e,
                        width: 70,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ))
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width - 40 - 70 - 22,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  widget.images[selectedImageIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ))
      ]),
    );
  }
}
