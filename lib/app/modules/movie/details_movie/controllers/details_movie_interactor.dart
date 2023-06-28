import 'package:get/get.dart';

import '../../../../data/model/details_movie_response_model.dart';
import 'details_movie_worker.dart';

class DetailsMovieInteractor {
  DetailsMovieWorker worker = Get.find<DetailsMovieWorker>();

  Future<DetailsMovieResponseModel> handleGetDetailsMovie(movieIds) async {
    var details = await worker.prosesGetDetailsMovie(movieIds);
    var detailsMovieResponseModel = DetailsMovieResponseModel.fromJson(details);
    return detailsMovieResponseModel;
  }
}
