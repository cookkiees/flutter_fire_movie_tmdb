import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/text_theme.dart';
import '../controller/responsive_layout_controller.dart';
import '../responsive_layout.dart';

class ResponsiveHeaderWidget extends GetView<ResponsiveLayoutController> {
  const ResponsiveHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          height: kToolbarHeight,
          color: Colors.transparent,
          padding: ResponsiveLayout.isTablet(context)
              ? null
              : constraints.maxWidth <= 1000
                  ? const EdgeInsets.symmetric(horizontal: 24)
                  : const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            mainAxisAlignment: ResponsiveLayout.isTablet(context)
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveLayout.isTablet(context)
                  ? IconButton(
                      splashRadius: 18,
                      onPressed: () => controller.toggleDrawer(context),
                      icon: const Icon(
                        Icons.menu_outlined,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      '${constraints.maxWidth} 🔥 ',
                      style: MyTextTheme.defaultStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
              ResponsiveLayout.isTablet(context)
                  ? Obx(
                      () => Text(
                        controller.titles[controller.tabIndex.value]
                            .toUpperCase(),
                        style: MyTextTheme.defaultStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    )
                  : Obx(
                      () => Row(
                        children: List.generate(4, (index) {
                          final titles = [
                            "Home",
                            "Discover",
                            "Search",
                            "About",
                          ];
                          final isSelected = controller.tabIndex.value == index;

                          return InkWell(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.pushNamed(
                                      context, AppRoutes.initial);
                                  break;
                                case 1:
                                  Navigator.pushNamed(
                                      context, AppRoutes.discover);
                                  break;
                                case 2:
                                  Navigator.pushNamed(
                                      context, AppRoutes.movieCompanies);
                                  break;
                                case 3:
                                  Navigator.pushNamed(
                                      context, AppRoutes.movieRelease);
                                  break;
                                case 4:
                                  Navigator.pushNamed(
                                      context, AppRoutes.tvShows);
                                  break;
                                case 5:
                                  Navigator.pushNamed(context, AppRoutes.about);
                                  break;

                                default:
                                  break;
                              }
                              controller.changeTabIndex(index);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                titles[index],
                                style: GoogleFonts.urbanist(
                                  color: isSelected
                                      ? Colors.purpleAccent
                                      : Colors.white,
                                  fontWeight:
                                      isSelected ? FontWeight.bold : null,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
