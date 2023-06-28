import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class GenreMovieWorker {
  ApiService apiService = Get.find<ApiService>();
  prosesGetGenre(genreIds) async =>
      await apiService.fetchDataGenre(genreIds).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetGenreMovie(genreIds, page) async =>
      await apiService.fetchDataGenreMovie(genreIds, page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
