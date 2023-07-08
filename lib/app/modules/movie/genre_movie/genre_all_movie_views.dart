import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/custom_movie_card_pageviews_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/utils/my_strings.dart';
import '../../responsive/responsive_layout.dart';
import '../details_movie/controllers/details_movie_controller.dart';
import 'controllers/genre_movie_controllers.dart';

class GenreAllMovieViews extends GetView<GenreMovieController> {
  final PageController _pageController = PageController();
  GenreAllMovieViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = Get.put(DetailsMovieController());

    var isPhone = ResponsiveLayout.isPhone(context);
    var isTablet = ResponsiveLayout.isPhone(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Flexible(
              flex: isPhone || isTablet ? 1 : 1,
              child: Obx(
                () => controller.isLoadingAllGenreMovie.value
                    ? Container(
                        alignment: Alignment.center,
                        child: const CupertinoActivityIndicator())
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                            padding: isPhone || isTablet
                                ? const EdgeInsets.only(left: 16)
                                : constraints.maxWidth <= 1050
                                    ? const EdgeInsets.symmetric(horizontal: 24)
                                    : const EdgeInsets.only(left: 100),
                            child: HeaderPageViewWidget(
                              title: 'Movie On Awards   🥶 ',
                              previousPage: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                              nextPage: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              padding: isPhone || isTablet
                                  ? const EdgeInsets.only(left: 16)
                                  : constraints.maxWidth <= 1050
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 24)
                                      : const EdgeInsets.only(left: 100),
                              child: PageView.builder(
                                controller: _pageController,
                                itemCount: controller.allGenreMovie.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var movie = controller.allGenreMovie[index];
                                  return CustomMovieCardPageViewsWidget(
                                    onTap: () {
                                      if (controller.allGenreMovie.isNotEmpty) {
                                        Get.toNamed(
                                          '${AppRoutes.details}/${controller.allGenreMovie[index].id}',
                                        );
                                      }
                                      details.refreshData();
                                    },
                                    title: "${movie.title}",
                                    voteAverage: '${movie.voteAverage}',
                                    releaseDate: '${movie.releaseDate}',
                                    imageUrl:
                                        "${MyString.imageUrlOrigin}${movie.backdropPath}",
                                    overview: "${movie.overview}",
                                    future: controller.getFirstGenreFromMovie(
                                        movie.genreIds!),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            isPhone || isTablet || constraints.maxWidth <= 1050
                ? const SizedBox.shrink()
                : Obx(
                    () => controller.isLoadingGenre.value
                        ? const CupertinoActivityIndicator()
                        : Flexible(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisExtent: 50,
                                childAspectRatio: 1 / 1.5,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                              ),
                              padding: const EdgeInsets.only(
                                left: 100,
                                right: 100,
                                top: 66,
                              ),
                              itemCount: controller.genres.length,
                              itemBuilder: (BuildContext context, int index) {
                                var genre = controller.genres[index];
                                return Obx(
                                  () => ElevatedButton(
                                    onPressed: () async {
                                      await controller.getAllGenreMovie(
                                          controller.genres[index].id);
                                      controller.onSelectAllGenre.value = index;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          controller.onSelectAllGenre.value ==
                                                  index
                                              ? Colors.purple
                                              : Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: const BorderSide(
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ),
                                    child: Text('${genre.name}'),
                                  ),
                                );
                              },
                            ),
                          ),
                  )
          ],
        );
      },
    );
  }
}
