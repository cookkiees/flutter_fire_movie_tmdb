import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class JustReleaseMovieWorker {
  ApiService apiService = Get.find<ApiService>();

  prosesGetJustReleaseMovie(int page) async {
    try {
      var value = await apiService.fetchDataJustReleaseMovie(page);
      if (value.statusCode == 200 || value.statusCode == 201) {
        return value.body;
      } else {
        log("${value.statusCode}");
      }
    } catch (error) {
      log("Error in prosesGetJustReleaseMovie: $error");
    }
  }
}
