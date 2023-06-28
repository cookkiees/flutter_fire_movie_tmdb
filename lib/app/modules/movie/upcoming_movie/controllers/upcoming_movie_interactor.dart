import 'package:get/get.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'upcoming_movie_worker.dart';

class UpComingMovieInteractor {
  UpComingMovieWorker worker = Get.find<UpComingMovieWorker>();

  Future<List<Results>?> handleGetUpComingMovie() async {
    var upComing = await worker.prosesGetUpComingMovie();
    var discoverMovieResponseModel =
        DiscoverMovieResponseModel.fromJson(upComing).results;
    return discoverMovieResponseModel;
  }
}
