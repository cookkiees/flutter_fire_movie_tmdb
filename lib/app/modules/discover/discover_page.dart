import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../movie/genre_movie/genre_action_movie_views.dart';
import '../movie/genre_movie/genre_all_movie_views.dart';
import '../movie/genre_movie/genre_comedy_movie_views.dart';
import '../movie/genre_movie/genre_fantasy_movie_views.dart';
import '../movie/genre_movie/genre_sciencefiction_movie_views.dart';
import '../movie/genre_movie/genre_war_movie_views.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/widgets/responsive_footer_widget.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    var isTablet = ResponsiveLayout.isTablet(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: isPhone || isTablet ? 400 : 600,
            child: const GenreWarMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 100,
          ),
          const SizedBox(
            width: double.infinity,
            child: GenreFantasyMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 50,
          ),
          const SizedBox(
            height: 600,
            width: double.infinity,
            child: GenreScienceFictionMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 100,
          ),
          const SizedBox(
            width: double.infinity,
            child: GenreActionMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 100,
          ),
          const SizedBox(
            width: double.infinity,
            child: GenreComedyMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 50,
          ),
          SizedBox(
            height: isPhone
                ? 500
                : Get.width <= 1050
                    ? 800
                    : 680,
            width: double.infinity,
            child: GenreAllMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? null : 50,
          ),
          isPhone || isTablet
              ? const SizedBox.shrink()
              : const ResponsiveFooterWidget()
        ],
      ),
    );
  }
}
