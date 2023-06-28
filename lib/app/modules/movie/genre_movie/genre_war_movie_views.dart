import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../components/custom_movie_detail_card_widget.dart';
import '../../../theme/utils/my_strings.dart';
import '../../responsive/responsive_layout.dart';
import 'controllers/genre_movie_controllers.dart';

class GenreWarMovieViews extends GetView<GenreMovieController> {
  const GenreWarMovieViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final genre = Get.find<GenreMovieController>();
    return LayoutBuilder(
      builder: ((context, constraints) {
        var isPhone = ResponsiveLayout.isPhone(context);
        var isTablet = ResponsiveLayout.isTablet(context);
        return Obx(
          () => controller.isLoadingWarMovie.value
              ? const CupertinoActivityIndicator()
              : CarouselSlider.builder(
                  disableGesture: false,
                  carouselController: CarouselController(),
                  itemCount: controller.warMovie.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    var movie = controller.warMovie[index];
                    return CustomMovieDetailsCardWidget(
                      title: "${movie.title}",
                      voteAverage: '${movie.voteAverage}',
                      releaseDate: '${movie.releaseDate}',
                      imageUrl:
                          "${MyString.imageUrlOrigin}${movie.backdropPath ?? movie.posterPath}",
                      overview: "${movie.overview}",
                      future: genre.getFirstGenreFromMovie(
                        movie.genreIds!,
                      ),
                      paddingDetails: isPhone || isTablet
                          ? const EdgeInsets.symmetric(horizontal: 16)
                          : constraints.maxWidth <= 1000
                              ? const EdgeInsets.symmetric(horizontal: 24)
                              : const EdgeInsets.symmetric(horizontal: 100),
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
