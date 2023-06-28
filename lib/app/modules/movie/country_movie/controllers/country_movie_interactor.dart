import 'package:get/get.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'country_movie_worker.dart';

class CountryMovieInteractor {
  CountryMovieWorker worker = Get.find<CountryMovieWorker>();

  Future<List<Results>?> handleGetKoreanMovie(String country) async {
    var koreanMovie = await worker.prosesGetCountryMovie(country);
    var discoverMovieResponseModel =
        DiscoverMovieResponseModel.fromJson(koreanMovie).results;
    return discoverMovieResponseModel;
  }

  Future<List<Results>?> handleGetIndonesiaMovie(String country) async {
    var indonesiaMovie = await worker.prosesGetCountryMovie(country);
    var discoverMovieResponseModel =
        DiscoverMovieResponseModel.fromJson(indonesiaMovie).results;
    return discoverMovieResponseModel;
  }
}
