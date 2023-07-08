import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_movie/app/modules/movie/details_movie/views/similar_movie_views.dart';
import 'package:get/get.dart';

import '../../../components/custom_elevated_button_icon_widget.dart';
import '../../../theme/text_theme.dart';
import '../../../theme/utils/my_strings.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/widgets/responsive_footer_widget.dart';
import '../../responsive/widgets/responsive_header_widget.dart';
import 'controllers/details_movie_controller.dart';
import 'views/tabbar_and_tabbarviews.dart';

class DetailsMoviePage extends GetView<DetailsMovieController> {
  const DetailsMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    var isTablet = ResponsiveLayout.isTablet(context);

    return LayoutBuilder(builder: (context, constraints) {
      return Obx(
        () {
          var isLoadingDetails = controller.isLoadingDetailsMovie.value;
          var isLoadingSimilar = controller.isLoadingSimilarMovie.value;
          var isLoadingCredit = controller.isLoadingCreditMovie.value;

          if (isLoadingDetails || isLoadingSimilar || isLoadingCredit) {
            return const CupertinoActivityIndicator();
          } else {
            var movie = controller.detailsMovie;
            var cast = controller.creditMovie;

            return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                  child: SingleChildScrollView(
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
                                placeholder: (context, url) => const Center(
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
                                  ? const EdgeInsets.symmetric(horizontal: 16)
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                            backgroundColor: Colors.purple,
                                          ),
                                          isPhone
                                              ? const SizedBox.shrink()
                                              : const SizedBox(width: 12),
                                          isPhone
                                              ? const SizedBox.shrink()
                                              : CustomElevatedButtonIconWidget(
                                                  onPressed: () {},
                                                  label: 'Watch Trailer',
                                                  icon:
                                                      Icons.play_circle_outline,
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
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ],
                                      ),
                                      isPhone ||
                                              isTablet ||
                                              constraints.maxWidth <= 820
                                          ? const SizedBox.shrink()
                                          : Row(
                                              children: [
                                                CustomElevatedButtonIconWidget(
                                                  onPressed: () {},
                                                  label: 'Download',
                                                  icon: Icons
                                                      .file_download_outlined,
                                                  side: const BorderSide(
                                                      color: Colors.white),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                                const SizedBox(width: 12),
                                                CustomElevatedButtonIconWidget(
                                                  onPressed: () {},
                                                  label: 'Share',
                                                  icon: Icons.share,
                                                  side: const BorderSide(
                                                      color: Colors.white),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                                const SizedBox(width: 12),
                                                CustomElevatedButtonIconWidget(
                                                  onPressed: () {},
                                                  label: 'Liked',
                                                  icon: Icons.thumb_up,
                                                  side: BorderSide.none,
                                                  backgroundColor: Colors.red,
                                                ),
                                              ],
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const ResponsiveHeaderWidget(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    isPhone || isTablet || constraints.maxWidth <= 820
                        ? Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.file_download_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.thumb_up,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 50),
                    Padding(
                      padding: isPhone || isTablet
                          ? const EdgeInsets.symmetric(horizontal: 16)
                          : constraints.maxWidth <= 1000
                              ? const EdgeInsets.symmetric(horizontal: 24)
                              : const EdgeInsets.symmetric(horizontal: 100),
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
                    Obx(
                      () => controller.isLoadingCreditMovie.value
                          ? const CupertinoActivityIndicator()
                          : Padding(
                              padding: isPhone || isTablet
                                  ? const EdgeInsets.symmetric(horizontal: 16)
                                  : constraints.maxWidth <= 1000
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 24)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 100),
                              child: Wrap(
                                spacing: 24.0,
                                runSpacing: 24.0,
                                children: List<Widget>.generate(
                                  (cast?.length ?? 0).clamp(0, 4),
                                  (index) => Builder(
                                    builder: (context) {
                                      final artist = cast?[index];
                                      if (artist != null) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            artist.profilePath != null
                                                ? CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                      "${MyString.imageUrlOrigin}${artist.profilePath}",
                                                    ),
                                                  )
                                                : const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.purple,
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                            const SizedBox(width: 12),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${artist.name}",
                                                  overflow: TextOverflow.clip,
                                                  style:
                                                      MyTextTheme.defaultStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  "${artist.character}",
                                                  overflow: TextOverflow.clip,
                                                  style:
                                                      MyTextTheme.defaultStyle(
                                                    color: Colors.grey[300]!,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const SizedBox(); // Widget kosong jika artist null
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                    ),
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
              )),
            );
          }
        },
      );
    });
  }
}
