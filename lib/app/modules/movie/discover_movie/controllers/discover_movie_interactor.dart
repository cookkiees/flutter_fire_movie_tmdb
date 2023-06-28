import 'package:get/get.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'discover_movie_worker.dart';

class DiscoverMovieInteractor {
  DiscoverMovieWorker worker = Get.find<DiscoverMovieWorker>();

  Future<List<Results>?> handleGetDiscoverMovie() async {
    var discover = await worker.prosesGetDiscoverMovie();
    var discoverMovieResponseModel =
        DiscoverMovieResponseModel.fromJson(discover).results;
    return discoverMovieResponseModel;
  }
}
