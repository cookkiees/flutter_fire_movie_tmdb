import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_movie_card_widget.dart';
import '../../../../routes/app_routes.dart';
import '../../../../theme/text_theme.dart';
import '../../../../theme/utils/my_strings.dart';
import '../../../responsive/responsive_layout.dart';
import '../../genre_movie/controllers/genre_movie_controllers.dart';
import '../controllers/details_movie_controller.dart';

class SimilarMovieViews extends GetView<DetailsMovieController> {
  const SimilarMovieViews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genre = Get.find<GenreMovieController>();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var isPhone = ResponsiveLayout.isPhone(context);
        var isTablet = ResponsiveLayout.isTablet(context);
        return Obx(
          () => controller.isLoadingSimilarMovie.value
              ? const CupertinoActivityIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isPhone || isTablet
                          ? const EdgeInsets.symmetric(horizontal: 16)
                          : constraints.maxWidth <= 1000
                              ? const EdgeInsets.symmetric(horizontal: 24)
                              : const EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        'Similar Movie For You',
                        style: MyTextTheme.defaultStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Stack(
                      children: [
                        SizedBox(
                          height: 370,
                          child: GridView.builder(
                            itemCount: controller.similarMovie?.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: isPhone || isTablet
                                ? const EdgeInsets.only(left: 16)
                                : constraints.maxWidth <= 1000
                                    ? const EdgeInsets.only(left: 24)
                                    : const EdgeInsets.only(left: 100),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 370,
                              mainAxisExtent: 250,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              var movie = controller.similarMovie![index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: CustomMovieCardWidget(
                                  onTap: () {
                                    if (controller.similarMovie!.isNotEmpty) {
                                      Get.toNamed(
                                        '${AppRoutes.details}/${controller.similarMovie?[index].id}',
                                      );
                                    }
                                    controller.refreshData();
                                  },
                                  releaseDate: '${movie.releaseDate}',
                                  title: '${movie.title}',
                                  voteAverage:
                                      movie.voteAverage?.toStringAsFixed(1) ??
                                          '',
                                  imageUrl:
                                      "${MyString.imageUrlOrigin}${movie.posterPath}",
                                  future: genre.getFirstGenreFromMovie(
                                      movie.genreIds ?? []),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            width: isPhone || isTablet ? 24 : 120,
                            height: 400,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: isPhone || isTablet
                                    ? [
                                        Colors.black.withOpacity(0.5),
                                        Colors.transparent,
                                      ]
                                    : [
                                        Colors.black.withOpacity(1),
                                        Colors.black.withOpacity(0.5),
                                        Colors.transparent,
                                      ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Container(
                            width: isPhone || isTablet ? 24 : 120,
                            height: 400,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: isPhone || isTablet
                                    ? [
                                        Colors.black.withOpacity(0.5),
                                        Colors.transparent,
                                      ]
                                    : [
                                        Colors.black.withOpacity(1),
                                        Colors.black.withOpacity(0.5),
                                        Colors.transparent,
                                      ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
