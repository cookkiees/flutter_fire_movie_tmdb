import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'just_release_movie_worker.dart';

class JustReleaseMovieInteractor {
  JustReleaseMovieWorker worker = Get.find<JustReleaseMovieWorker>();

  Future<List<Results>?> handleGetJustReleaseMovie(int page) async {
    try {
      var discover = await worker.prosesGetJustReleaseMovie(page);
      var discoverMovieResponseModel =
          DiscoverMovieResponseModel.fromJson(discover).results;
      return discoverMovieResponseModel;
    } catch (error) {
      log("Error in handleGetJustReleaseMovie: $error");
      return null;
    }
  }
}
