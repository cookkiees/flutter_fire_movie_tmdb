import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveLayoutController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var tabIndex = 0.obs;
  var isDrawerOpen = false.obs;

  void changeTabIndex(i) {
    tabIndex.value = i;
  }

  void toggleDrawer(context) {
    Scaffold.of(context).openDrawer();
  }

  final titles = [
    "Home",
    "Discover",
    "Movie Companies",
    "Movie Release",
    "Tv Shows",
    "About",
  ];
}
