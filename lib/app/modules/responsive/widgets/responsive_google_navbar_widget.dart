import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../theme/text_theme.dart';
import '../controller/responsive_layout_controller.dart';

class ResponsiveGoogleNavbarWidget extends GetView<ResponsiveLayoutController> {
  const ResponsiveGoogleNavbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 86,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: Colors.transparent,
        alignment: Alignment.topCenter,
        child: GNav(
          gap: 8,
          haptic: true,
          iconSize: 24,
          tabBorderRadius: 8,
          backgroundColor: Colors.transparent,
          activeColor: Colors.white,
          color: Colors.purple,
          tabBackgroundColor: Colors.purple,
          curve: Curves.bounceIn,
          tabActiveBorder: Border.all(
            color: Colors.purple,
            width: 0.5,
          ),
          tabBorder: Border.all(
            color: Colors.purple,
            width: 1,
          ),
          selectedIndex: controller.tabIndex.value,
          onTabChange: controller.changeTabIndex,
          duration: const Duration(milliseconds: 900),
          mainAxisAlignment: MainAxisAlignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          tabs: [
            GButton(
              iconSize: 18,
              icon: Icons.home,
              text: 'Home',
              textStyle: MyTextTheme.defaultStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            GButton(
              iconSize: 18,
              icon: Icons.explore,
              text: 'Discover',
              textStyle: MyTextTheme.defaultStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
