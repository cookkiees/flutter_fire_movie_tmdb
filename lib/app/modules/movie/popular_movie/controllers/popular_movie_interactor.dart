import 'package:get/get.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'popular_movie_worker.dart';

class PopularMovieInteractor {
  PopularMovieWorker worker = Get.find<PopularMovieWorker>();

  Future<List<Results>?> handleGetPopularMovie() async {
    var popular = await worker.prosesGetPopularMovie();
    var discoverMovieResponseModel =
        DiscoverMovieResponseModel.fromJson(popular).results;
    return discoverMovieResponseModel;
  }
}
