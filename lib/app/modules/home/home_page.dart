import 'package:flutter/material.dart';
import '../movie/companies_movie/companies_movie_views.dart';
import '../movie/country_movie/country_movie_indonesian_views.dart';
import '../responsive/responsive_layout.dart';
import '../movie/country_movie/country_movie_korean_views.dart';
import '../movie/discover_movie/discover_movie_views.dart';
import '../movie/just_release_movie/just_release_movie_views.dart';
import '../movie/popular_movie/popular_movie_views.dart';
import '../movie/upcoming_movie/upcoming_movie_views.dart';
import '../responsive/widgets/responsive_footer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
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
            child: const DiscoverMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 100,
          ),
          const SizedBox(
            width: double.infinity,
            child: JustReleaseMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 50,
          ),
          const SizedBox(
            height: 600,
            width: double.infinity,
            child: PopularMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 100,
          ),
          const SizedBox(
            width: double.infinity,
            child: UpComingMovieViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 100,
          ),
          const SizedBox(
            width: double.infinity,
            child: CountryMovieKoreanViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 100,
          ),
          const SizedBox(
            width: double.infinity,
            child: CountryMovieIndonesianViews(),
          ),
          SizedBox(
            height: isPhone || isTablet ? 16 : 50,
          ),
          const SizedBox(
            height: 600,
            width: double.infinity,
            child: CompaniesMovieViews(),
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
