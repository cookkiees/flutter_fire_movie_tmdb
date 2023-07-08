import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_shadow_widget.dart';

import 'package:flutter/cupertino.dart';

import '../../../components/custom_movie_card_widget.dart';
import '../../../components/custom_movie_detail_card_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/text_theme.dart';
import '../../../theme/utils/my_strings.dart';
import '../../responsive/responsive_layout.dart';
import '../details_movie/controllers/details_movie_controller.dart';
import '../genre_movie/controllers/genre_movie_controllers.dart';
import 'controllers/companies_movie_controller.dart';

class CompaniesMovieViews extends GetView<CompaniesMovieController> {
  const CompaniesMovieViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genre = Get.find<GenreMovieController>();
    final details = Get.put(DetailsMovieController());

    return LayoutBuilder(
      builder: (context, constraints) {
        var isPhone = ResponsiveLayout.isPhone(context);
        var isTablet = ResponsiveLayout.isTablet(context);
        return Obx(() {
          if (controller.isLoading.value) {
            return const CupertinoActivityIndicator();
          } else {
            var disneyMovie = controller.disneyMovie;
            return SizedBox(
              height: 600,
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: disneyMovie.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var movie = disneyMovie[index];
                      return Obx(
                        () {
                          bool isSelected =
                              controller.selectedMovieIndex.value == index;
                          return isSelected
                              ? Stack(
                                  children: [
                                    CustomMovieDetailsCardWidget(
                                      onTap: () {
                                        if (controller.disneyMovie.isNotEmpty) {
                                          Get.toNamed(
                                            '${AppRoutes.details}/${controller.disneyMovie[index].id}',
                                          );
                                        }
                                        details.refreshData();
                                      },
                                      height: 600,
                                      width: Get.width,
                                      addNewGradientColor: Colors.black,
                                      title: "${movie.title}",
                                      voteAverage: '${movie.voteAverage}',
                                      releaseDate: '${movie.releaseDate}',
                                      imageUrl:
                                          "${MyString.imageUrlOrigin}${movie.backdropPath}",
                                      overview: "${movie.overview}",
                                      future: genre.getFirstGenreFromMovie(
                                          movie.genreIds!),
                                      paddingDetails: isPhone || isTablet
                                          ? const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16)
                                          : constraints.maxWidth <= 1000
                                              ? const EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 25)
                                              : const EdgeInsets.symmetric(
                                                  horizontal: 100,
                                                  vertical: 50),
                                    ),
                                    CustomShadowWidget(
                                      height: double.infinity,
                                      width: isPhone || isTablet ? 24 : 120,
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
                                                Colors.transparent,
                                              ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink();
                        },
                      );
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isPhone
                          ? const SizedBox.shrink()
                          : Flexible(child: Container()),
                      Flexible(
                        flex: isPhone || isTablet
                            ? 3
                            : constraints.maxWidth <= 1000
                                ? 2
                                : 1,
                        child: Container(
                          margin: isPhone
                              ? const EdgeInsets.only(top: 100)
                              : const EdgeInsets.only(bottom: 120),
                          height: 300,
                          child: Stack(
                            children: [
                              ListView.builder(
                                itemCount: disneyMovie.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  var movie = disneyMovie[index];
                                  var isSelected =
                                      controller.selectedMovieIndex;
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Obx(
                                      () => CustomMovieCardWidget(
                                        height: 200,
                                        width: 220,
                                        border: Border.all(
                                          color: isSelected.value == index
                                              ? Colors.purpleAccent
                                              : Colors.transparent,
                                        ),
                                        title: '${movie.title}',
                                        voteAverage: '${movie.voteAverage}',
                                        imageUrl:
                                            "${MyString.imageUrlOrigin}${movie.posterPath}",
                                        onTap: () {
                                          controller
                                              .setSelectedMovieIndex(index);
                                        },
                                        future: genre.getFirstGenreFromMovie(
                                          movie.genreIds!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              CustomShadowWidget(
                                height: 300,
                                width: isPhone || isTablet ? 24 : 80,
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
                              Positioned(
                                right: 0,
                                child: CustomShadowWidget(
                                  height: 300,
                                  width: isPhone || isTablet ? 24 : 80,
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: isPhone || isTablet
                        ? const EdgeInsets.symmetric(horizontal: 16)
                        : constraints.maxWidth <= 1000
                            ? const EdgeInsets.symmetric(horizontal: 24)
                            : const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      'Walt Disney Pictures Movies 🔥 ',
                      style: MyTextTheme.defaultStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
      },
    );
  }
}
