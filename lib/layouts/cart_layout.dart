import 'package:flutter/material.dart';
import 'package:apple_store_ui/modules/modules.dart';

class CartLayout extends StatelessWidget {
  const CartLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;
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
                      padding: const EdgeInsets.only(top: 20), child: child),
                ),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  child: const CartFixedBottomBar())
            ],
          ),
        ),
      ),
    );
  }
}
