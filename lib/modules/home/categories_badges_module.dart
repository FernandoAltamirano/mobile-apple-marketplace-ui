import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apple_store_ui/bloc/config/config_bloc.dart';
import 'package:apple_store_ui/theme/current_theme.dart';

const categories = [
  {"title": "All"},
  {
    "title": "iPhone",
    "image": "assets/images/iphone.png",
  },
  {
    "title": "iPad",
    "image": "assets/images/ipad.png",
  },
  {
    "title": "Mac",
    "image": "assets/images/mac.png",
  },
  {
    "title": "Watch",
    "image": "assets/images/watch.png",
  },
  {
    "title": "Accessories",
    "image": "assets/images/accessories.png",
  }
];

class CategoriesBadgesModule extends StatefulWidget {
  CategoriesBadgesModule({Key? key}) : super(key: key);

  @override
  State<CategoriesBadgesModule> createState() => _CategoriesBadgesModuleState();
}

class _CategoriesBadgesModuleState extends State<CategoriesBadgesModule> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(
          BlocProvider.of<ConfigBloc>(context).state.scrollOffsetCategories);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return ListView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            children: [
              ...categories.map(
                (e) => GestureDetector(
                  onTap: () {
                    BlocProvider.of<ConfigBloc>(context).add(SetCategoryEvent(
                        selectedCategory: e["title"] as String));
                    BlocProvider.of<ConfigBloc>(context).add(
                        SetScrollOffsetCategoriesEvent(
                            offset: scrollController.offset));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: state.selectedCategory == e["title"]
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(
                            color: CurrentTheme.gray.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.only(
                        left: 2, top: 2, bottom: 2, right: 10),
                    child: Row(children: [
                      Container(
                        width: 40,
                        height: 60,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: CurrentTheme.grayBgColor),
                        child: e.containsKey("image")
                            ? Image.asset(
                                e["image"] as String,
                                width: 30,
                                height: 30,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(4),
                                child:
                                    SvgPicture.asset("assets/images/all.svg"),
                              ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(e["title"] as String,
                          style: const TextStyle(
                              color: CurrentTheme.gray,
                              fontWeight: FontWeight.w500))
                    ]),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
