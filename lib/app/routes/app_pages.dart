import 'package:get/get.dart';

import '../modules/movie/companies_movie/controllers/componies_movie_binding.dart';
import '../modules/movie/country_movie/controllers/country_movie_binding.dart';
import '../modules/movie/details_movie/controllers/details_movie_binding.dart';
import '../modules/movie/details_movie/details_movie_page.dart';
import '../modules/movie/discover_movie/controllers/discover_movie_binding.dart';
import '../modules/movie/genre_movie/controllers/genre_movie_binding.dart';
import '../modules/movie/just_release_movie/controllers/just_release_movie_binding.dart';
import '../modules/movie/popular_movie/controllers/popular_movie_binding.dart';
import '../modules/movie/upcoming_movie/controllers/upcoming_movie_binding.dart';
import '../modules/responsive/controller/responsive_layout_binding.dart';
import '../modules/responsive/responsive_layout_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRoutes.initial;
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const ResponsiveLayoutPage(),
      binding: ResponsiveLayoutBinding(),
      bindings: [
        DiscoverMovieBinding(),
        CountryMovieBinding(),
        JustReleaseMovieBinding(),
        PopularMovieBinding(),
        UpComingMovieBinding(),
        GenreMovieBinding(),
        CompaniesMovieBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.discover,
      page: () => const ResponsiveLayoutPage(),
      binding: ResponsiveLayoutBinding(),
      bindings: [
        DiscoverMovieBinding(),
        CountryMovieBinding(),
        JustReleaseMovieBinding(),
        PopularMovieBinding(),
        UpComingMovieBinding(),
        GenreMovieBinding(),
        CompaniesMovieBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const ResponsiveLayoutPage(),
      binding: ResponsiveLayoutBinding(),
    ),
    GetPage(
        name: '${AppRoutes.details}/:id',
        page: () => const DetailsMoviePage(),
        binding: DetailsMovieBinding(),
        bindings: [
          GenreMovieBinding(),
        ]),
  ];
}
