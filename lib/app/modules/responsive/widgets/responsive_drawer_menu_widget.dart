import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/responsive_layout_controller.dart';

class ResponsiveDrawerMenuWidget extends GetView<ResponsiveLayoutController> {
  const ResponsiveDrawerMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black45,
      child: SizedBox(
        width: 250,
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'FLUTTER 🔥 ',
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ...[
                "Home",
                "Discover",
                "About",
              ].asMap().entries.map((entry) {
                final index = entry.key;
                final title = entry.value;
                final isSelected = index == controller.tabIndex.value;

                return ListTile(
                  title: InkWell(
                    onTap: () => controller.changeTabIndex(index),
                    child: Text(
                      title,
                      style: GoogleFonts.urbanist(
                        color: isSelected ? Colors.purpleAccent : Colors.white,
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
