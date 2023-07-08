import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fire_movie/app/modules/movie/details_movie/controllers/details_movie_controller.dart';
import 'package:flutter_fire_movie/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../components/custom_movie_detail_card_widget.dart';
import '../../../theme/utils/my_strings.dart';
import '../genre_movie/controllers/genre_movie_controllers.dart';
import 'controllers/discover_movie_controller.dart';

class DiscoverMovieViews extends GetView<DiscoverMovieController> {
  const DiscoverMovieViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final genre = Get.find<GenreMovieController>();
    final details = Get.put(DetailsMovieController());

    return LayoutBuilder(
      builder: ((context, constraints) {
        return Obx(
          () => controller.isLoadingDiscoverMovie.value
              ? const CupertinoActivityIndicator()
              : CarouselSlider.builder(
                  disableGesture: false,
                  carouselController: CarouselController(),
                  itemCount: controller.discoverMovie.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    var movie = controller.discoverMovie[index];
                    return CustomMovieDetailsCardWidget(
                      onTap: () {
                        if (controller.discoverMovie.isNotEmpty) {
                          Get.toNamed(
                            '${AppRoutes.details}/${controller.discoverMovie[index].id}',
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
                      future: genre.getFirstGenreFromMovie(
                        movie.genreIds!,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    initialPage: 4,
                    aspectRatio: 1,
                    autoPlay: false,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: false,
                    pageSnapping: true,
                    onPageChanged: (index, reason) {
                      // Handle page change event
                    },
                  ),
                ),
        );
      }),
    );
  }
}
