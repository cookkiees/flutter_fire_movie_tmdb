import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../theme/text_theme.dart';
import '../../../responsive/responsive_layout.dart';
import '../controllers/details_movie_controller.dart';
import 'trailer_movie_views.dart';

class ReviewsMovieViews extends GetView<DetailsMovieController> {
  const ReviewsMovieViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    var isTablet = ResponsiveLayout.isTablet(context);

    return LayoutBuilder(
      builder: ((context, constraints) {
        return Stack(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.videosMovie.length,
              padding: isPhone || isTablet
                  ? const EdgeInsets.only(left: 16)
                  : constraints.maxWidth <= 1000
                      ? const EdgeInsets.only(left: 24)
                      : const EdgeInsets.only(left: 100),
              itemBuilder: (context, index) {
                var videos = controller.videosMovie[index];

                return Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 16, right: 8, bottom: 16),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 300,
                        height: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ResponsiveLayout.isPhone(context)
                              ? CachedNetworkImage(
                                  imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: "${videos.key}"),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  placeholder: (context, url) => const Center(
                                    child: CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) {
                                    debugPrint(error.toString());
                                    return const Icon(Icons.error);
                                  },
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: GestureDetector(
                            onTap: () => Get.to(
                              () => TrailersMovieViews(
                                youtubeKey:
                                    "${controller.videosMovie[index].key}",
                              ),
                            ),
                            child: Container(
                              height: 50,
                              width: 60,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${videos.name}',
                        style: MyTextTheme.defaultStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Positioned(
                        top: 18,
                        child: Text(
                          '${videos.type}',
                          style: MyTextTheme.defaultStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
        );
      }),
    );
  }
}
