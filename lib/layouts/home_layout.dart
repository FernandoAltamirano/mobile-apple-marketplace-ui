import 'package:apple_store_ui/api/api_client.dart';
import 'package:apple_store_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              RefreshIndicator.adaptive(
                onRefresh: () async => await ApiClient.get(context),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20), child: child),
                ),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.15,
                  child: const CustomBottomNavigationBar())
            ],
          ),
        ),
      ),
    );
  }
}
