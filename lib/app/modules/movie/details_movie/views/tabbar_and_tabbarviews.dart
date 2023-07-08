import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../responsive/responsive_layout.dart';
import '../controllers/details_movie_controller.dart';
import 'reviews_movie_views.dart';
import 'universe_movie_views.dart';

class TabBarAndTabBarViews extends GetView<DetailsMovieController> {
  const TabBarAndTabBarViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    var isTablet = ResponsiveLayout.isTablet(context);
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SizedBox(
          height: 400,
          child: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: isPhone || isTablet
                      ? const EdgeInsets.only(left: 16)
                      : constraints.maxWidth <= 1000
                          ? const EdgeInsets.only(left: 24)
                          : const EdgeInsets.only(left: 100),
                  child: SizedBox(
                    width: 310,
                    child: TabBar(
                      controller: controller.tabController,
                      labelPadding: const EdgeInsets.only(right: 42),
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey[300],
                      labelColor: Colors.purple,
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent;
                        }
                        return null;
                      }),
                      tabs: const [
                        Tab(
                          child: Text("Universe"),
                        ),
                        Tab(
                          child: Text("Reviews"),
                        ),
                        Tab(
                          child: Text("News"),
                        ),
                      ],
                      onTap: (index) {
                        controller.setCurrentIndex(index);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: const [
                      UniverseMovieViews(),
                      ReviewsMovieViews(),
                      Center(
                        child: Text('Tab 3 Content'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
