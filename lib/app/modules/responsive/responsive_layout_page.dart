import 'package:flutter/material.dart';
import 'package:flutter_fire_movie/app/modules/discover/discover_page.dart';

import 'package:get/get.dart';

import '../../theme/text_theme.dart';
import '../home/home_page.dart';
import 'controller/responsive_layout_controller.dart';
import 'responsive_layout.dart';
import 'widgets/responsive_header_widget.dart';
import 'widgets/responsive_drawer_menu_widget.dart';

class ResponsiveLayoutPage extends GetView<ResponsiveLayoutController> {
  const ResponsiveLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: ResponsiveLayout.isPhone(context)
            ? AppBar(
                backgroundColor: Colors.purple,
                title: Obx(
                  () => Text(
                    controller.titles[controller.tabIndex.value].toUpperCase(),
                    style: MyTextTheme.defaultStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ))
            : SizedBox.fromSize(),
      ),
      drawer: const ResponsiveDrawerMenuWidget(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              if (controller.tabIndex.value == 0) {
                return const ResponsiveLayout(
                  phone: HomePage(),
                  tablet: HomePage(),
                  largeTablet: HomePage(),
                  computer: HomePage(),
                );
              } else if (controller.tabIndex.value == 1) {
                return const ResponsiveLayout(
                  phone: DiscoverPage(),
                  tablet: DiscoverPage(),
                  largeTablet: DiscoverPage(),
                  computer: DiscoverPage(),
                );
              } else if (controller.tabIndex.value == 2) {
                return ResponsiveLayout(
                  phone: Container(),
                  tablet: Container(),
                  largeTablet: Container(),
                  computer: Container(),
                );
              } else {
                return ResponsiveLayout(
                  phone: Container(),
                  tablet: Container(),
                  largeTablet: Container(),
                  computer: Container(),
                );
              }
            }),
            ResponsiveLayout.isPhone(context)
                ? const SizedBox.shrink()
                : const ResponsiveHeaderWidget(),
          ],
        ),
      ),
    );
  }
}
