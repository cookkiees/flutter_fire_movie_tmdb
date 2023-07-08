import 'package:flutter_fire_movie/app/data/model/credit_movie_response_model.dart';
import 'package:get/get.dart';

import '../../../../data/model/details_movie_response_model.dart';
import '../../../../data/model/discover_movie_response_model.dart';
import 'details_movie_worker.dart';

class DetailsMovieInteractor {
  DetailsMovieWorker worker = Get.find<DetailsMovieWorker>();

  Future<DetailsMovieResponseModel> handleGetDetailsMovie(movieIds) async {
    var details = await worker.prosesGetDetailsMovie(movieIds);
    var detailsMovieResponseModel = DetailsMovieResponseModel.fromJson(details);
    return detailsMovieResponseModel;
  }

  Future<List<Results>?> handleGetSimilarMovie(movieIds) async {
    var similar = await worker.prosesGetSimilarMovie(movieIds);
    var similarMovie = DiscoverMovieResponseModel.fromJson(similar).results;
    return similarMovie;
  }

  Future<List<Cast>?> handleGetCreditMovie(movieIds) async {
    var cast = await worker.prosesGetCreditMovie(movieIds);
    var castMovie = CreditMovieResponseModel.fromJson(cast).cast;
    return castMovie;
  }

  Future<List<Results>?> handleGetRecommentdationMovie(movieIds) async {
    var rec = await worker.prosesGetRecommendationMovie(movieIds);
    var recMovie = DiscoverMovieResponseModel.fromJson(rec).results;
    return recMovie;
  }
}
