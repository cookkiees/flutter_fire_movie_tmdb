import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_movie/app/modules/responsive/widgets/responsive_header_widget.dart';
import 'package:get/get.dart';

import '../../../components/custom_elevated_button_icon_widget.dart';
import '../../../theme/text_theme.dart';
import '../../../theme/utils/my_strings.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/widgets/responsive_footer_widget.dart';
import 'controllers/details_movie_controller.dart';
import 'views/cast_views.dart';
import 'views/similar_movie_views.dart';
import 'views/tabbar_and_tabbarviews.dart';
import 'widgets/details_header_widget.dart';

class DetailsMoviePage extends GetView<DetailsMovieController> {
  const DetailsMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    var isTablet = ResponsiveLayout.isTablet(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(
          () {
            var isLoadingDetails = controller.isLoadingDetailsMovie.value;
            var isLoadingSimilar = controller.isLoadingSimilarMovie.value;
            var isLoadingCredit = controller.isLoadingCreditMovie.value;
            var isLoadingVideos = controller.isLoadingVideosMovie.value;

            if (isLoadingDetails ||
                isLoadingSimilar ||
                isLoadingCredit ||
                isLoadingVideos) {
              return const CupertinoActivityIndicator();
            } else {
              var movie = controller.detailsMovie;

              return Scaffold(
                backgroundColor: Colors.black,
                body: SafeArea(
                  top: false,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: isPhone || isTablet ? 400 : 600,
                              child: SizedBox(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: Get.width,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${MyString.imageUrlOrigin}${movie!.backdropPath}",
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CupertinoActivityIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width,
                                      height: double.infinity,
                                      padding: isPhone || isTablet
                                          ? const EdgeInsets.symmetric(
                                              horizontal: 16)
                                          : constraints.maxWidth <= 1000
                                              ? const EdgeInsets.symmetric(
                                                  horizontal: 24)
                                              : const EdgeInsets.symmetric(
                                                  horizontal: 100),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(1),
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${movie.title}",
                                            style: MyTextTheme.defaultStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Colors.yellow,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${movie.voteAverage.toString()}  | ${movie.runtime} m • ${movie.releaseDate} • ${movie.genres![0].name} • Movie',
                                                style: MyTextTheme.defaultStyle(
                                                  color: Colors.grey[300]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomElevatedButtonIconWidget(
                                                    onPressed: () {},
                                                    side: BorderSide.none,
                                                    backgroundColor:
                                                        Colors.purple,
                                                  ),
                                                  isPhone
                                                      ? const SizedBox.shrink()
                                                      : const SizedBox(
                                                          width: 12),
                                                  isPhone
                                                      ? const SizedBox.shrink()
                                                      : CustomElevatedButtonIconWidget(
                                                          onPressed: () {},
                                                          label:
                                                              'Watch Trailer',
                                                          icon: Icons
                                                              .play_circle_outline,
                                                          side: BorderSide.none,
                                                          backgroundColor:
                                                              Colors.grey[800]!,
                                                        ),
                                                  const SizedBox(width: 12),
                                                  CustomElevatedButtonIconWidget(
                                                    onPressed: () {},
                                                    label: 'Add Watchlist',
                                                    icon: Icons.turned_in_not,
                                                    side: const BorderSide(
                                                        color: Colors.white),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                  ),
                                                ],
                                              ),
                                              isPhone ||
                                                      isTablet ||
                                                      constraints.maxWidth <=
                                                          820
                                                  ? const SizedBox.shrink()
                                                  : Row(
                                                      children: [
                                                        CustomElevatedButtonIconWidget(
                                                          onPressed: () {},
                                                          label: 'Download',
                                                          icon: Icons
                                                              .file_download_outlined,
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                        ),
                                                        const SizedBox(
                                                            width: 12),
                                                        CustomElevatedButtonIconWidget(
                                                          onPressed: () {},
                                                          label: 'Share',
                                                          icon: Icons.share,
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                        ),
                                                        const SizedBox(
                                                            width: 12),
                                                        CustomElevatedButtonIconWidget(
                                                          onPressed: () {},
                                                          label: 'Liked',
                                                          icon: Icons.thumb_up,
                                                          side: BorderSide.none,
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      ],
                                                    )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Padding(
                              padding: isPhone || isTablet
                                  ? const EdgeInsets.symmetric(horizontal: 16)
                                  : constraints.maxWidth <= 1000
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 24)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 100),
                              child: SizedBox(
                                width: 600,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Story Line",
                                      overflow: TextOverflow.clip,
                                      style: MyTextTheme.defaultStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "${movie.overview}",
                                      overflow: TextOverflow.clip,
                                      style: MyTextTheme.defaultStyle(
                                        color: Colors.grey[300]!,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            const CastViews(),
                            SizedBox(
                              height: isPhone || isTablet ? 16 : 80,
                            ),
                            controller.recommendationMovie.isEmpty
                                ? const SizedBox.shrink()
                                : const TabBarAndTabBarViews(),
                            SizedBox(
                              height: isPhone || isTablet ? 16 : 50,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: controller.similarMovie!.isEmpty
                                  ? const SizedBox.shrink()
                                  : const SimilarMovieViews(),
                            ),
                            const ResponsiveFooterWidget()
                          ],
                        ),
                      ),
                      isPhone || isTablet || constraints.maxWidth <= 820
                          ? const Padding(
                              padding: kIsWeb
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(top: 36.0),
                              child: DetailsHeaderWidget(),
                            )
                          : const ResponsiveHeaderWidget()
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
