import 'package:get/get.dart';

class ApiService extends GetConnect {
  final String url = 'https://api.themoviedb.org/3';
  final headers = {
    "accept": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYTBhNDc4YWZkMDJhNDczYjA2MTRmNGIyOGRiMDBmZSIsInN1YiI6IjY0OGQ1MzA1MjYzNDYyMDBlYjc1YjE5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZadDugRcp9l_dVG0IOzwK8ThVjkAfzQsskpN88XtGAQ"
  };
// Discpver Movie
  Future<Response> fetchDataDiscoverMovie() =>
      get("$url/discover/movie", headers: headers);

// Genre Movie
  Future<Response> fetchDataGenre(genreIds) =>
      get("$url/genre/movie/list", headers: headers);

// Movie by Genre
  Future<Response> fetchDataGenreMovie(genreIds, page) =>
      get("$url/discover/movie?with_genres=$genreIds&page=$page",
          headers: headers);

// Just Release Movie
  Future<Response> fetchDataJustReleaseMovie(int page) =>
      get("$url/discover/movie?page=$page", headers: headers);

// Up Coming Movie
  Future<Response> fetchDataUpComingMovie() =>
      get("$url/discover/movie?year=2024", headers: headers);

// Details Movie
  Future<Response> fetchDataDetailsMovie(movieIds) =>
      get("$url/discover/movie/$movieIds", headers: headers);

// Popular Movie
  Future<Response> fetchDataPopularMovie() =>
      get("$url/discover/movie?sort_by=revenue.desc", headers: headers);

//  Movie by Country
  Future<Response> fetchDataCountryMovie(String country) => get(
      "$url/discover/movie?sort_by=popularity.desc&with_origin_country=$country",
      headers: headers);

// Movie by Companies
  Future<Response> fetchDataCompaniesMovie(companiesIds, page) =>
      get("$url/discover/movie?with_companies=$companiesIds&page=$page",
          headers: headers);

// Companies Details
  Future<Response> fetchDataCompaniesDetails(companiesIds) =>
      get("$url/company/$companiesIds", headers: headers);
}
