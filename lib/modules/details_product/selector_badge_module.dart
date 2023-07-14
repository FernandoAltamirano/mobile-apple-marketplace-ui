import 'package:flutter/material.dart';
import 'package:apple_store_ui/theme/current_theme.dart';

class SelectorBadgesModule extends StatefulWidget {
  const SelectorBadgesModule(
      {Key? key, required this.array, required this.title, required this.onTap})
      : super(key: key);
  final List<String> array;
  final String title;
  final Function(String) onTap;
  @override
  State<SelectorBadgesModule> createState() => _SelectorBadgesModuleState();
}

class _SelectorBadgesModuleState extends State<SelectorBadgesModule> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CurrentTheme.grayTextColor),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ...widget.array.map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = widget.array.indexOf(e);
                      widget.onTap(e);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: widget.array.indexOf(e) == selectedIndex
                            ? CurrentTheme.blue.withOpacity(0.07)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                            CurrentTheme.borderRadius * 200),
                        border: Border.all(
                            color: widget.array.indexOf(e) == selectedIndex
                                ? CurrentTheme.blue
                                : const Color.fromARGB(255, 206, 206, 206))),
                    child: Text(
                      e,
                      style: TextStyle(
                          color: widget.array.indexOf(e) == selectedIndex
                              ? CurrentTheme.blue
                              : CurrentTheme.grayTextColor),
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
