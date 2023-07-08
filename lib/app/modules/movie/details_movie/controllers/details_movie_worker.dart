import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class DetailsMovieWorker {
  ApiService apiService = Get.find<ApiService>();

  prosesGetDetailsMovie(movieIds) async =>
      await apiService.fetchDataDetailsMovie(movieIds).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetSimilarMovie(movieIds) async =>
      await apiService.fetchDataSimilarMovie(movieIds).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
  prosesGetCreditMovie(movieIds) async =>
      await apiService.fetchDataCreditMovie(movieIds).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
  prosesGetRecommendationMovie(movieIds) async =>
      await apiService.fetchDataRecommendationMovie(movieIds).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
