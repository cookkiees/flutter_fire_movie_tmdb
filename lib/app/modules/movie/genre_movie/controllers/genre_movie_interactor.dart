import 'package:get/get.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import '../../../../data/model/genre_movie_response_model.dart';
import 'genre_movie_worker.dart';

class GenreMovieInteractor {
  GenreMovieWorker worker = Get.find<GenreMovieWorker>();

  Future<List<Genres>> handleGetGenre(List<int> genreIds) async {
    var genre = await worker.prosesGetGenre(genreIds);
    var genreModel = GenreMovieResponseModel.fromJson(genre).genres;
    return genreModel!;
  }

  Future<List<Results>?> handleGetAllGenreMovie(genreIds, page) async {
    var animation = await worker.prosesGetGenreMovie(genreIds, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(animation).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetWarMovie(page) async {
    var war = await worker.prosesGetGenreMovie(10752, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(war).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetActionMovie(page) async {
    var action = await worker.prosesGetGenreMovie(28, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(action).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetAdventureMovie(page) async {
    var adventure = await worker.prosesGetGenreMovie(12, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(adventure).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetComedyMovie(page) async {
    var comedy = await worker.prosesGetGenreMovie(35, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(comedy).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetDocumentaryMovie(page) async {
    var documentary = await worker.prosesGetGenreMovie(99, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(documentary).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetFantasyMovie(page) async {
    var fantasy = await worker.prosesGetGenreMovie(10751, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(fantasy).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetRomanceMovie(page) async {
    var romance = await worker.prosesGetGenreMovie(10749, page);
    var genreModel = DiscoverMovieResponseModel.fromJson(romance).results;
    return genreModel!;
  }

  Future<List<Results>?> handleGetScienceFictionMovie(page) async {
    var scienceFiction = await worker.prosesGetGenreMovie(878, page);
    var genreModel =
        DiscoverMovieResponseModel.fromJson(scienceFiction).results;
    return genreModel!;
  }
}
