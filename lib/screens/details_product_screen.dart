import 'package:apple_store_ui/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apple_store_ui/bloc/market/market_bloc.dart';

class DetailsProductScreen extends StatelessWidget {
  DetailsProductScreen({Key? key}) : super(key: key);
  String selectedMemorySize = '';
  String selectedColor = '';

  handleSetSelectedMemorySize(List<String> array, int index) {
    selectedMemorySize = array[index];
  }

  handleSetSelectedColor(List<String> array, int index) {
    selectedColor = array[index];
  }

  handleAddToCart(String id, double price, BuildContext context) {
    BlocProvider.of<MarketBloc>(context).add(AddToCartEvent(
        price: price,
        id: id,
        selectedMemorySize: selectedMemorySize,
        selectedColor: selectedColor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              RefreshIndicator.adaptive(
                onRefresh: () async {},
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: DetailsAppbarModule(),
                          ),
                          BlocBuilder<MarketBloc, MarketState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  PreviewImagesModule(
                                    images: state.selectedProduct!.images,
                                  ),
                                  const SizedBox(height: 20),
                                  MoreDetailsModule(
                                    product: state.selectedProduct!,
                                    favorites: state.favorites,
                                    handleSetSelectedMemorySize:
                                        handleSetSelectedMemorySize,
                                    handleSetSelectedColor:
                                        handleSetSelectedColor,
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      )),
                ),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  child: FixedBottomBar(
                    onTap: handleAddToCart,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
