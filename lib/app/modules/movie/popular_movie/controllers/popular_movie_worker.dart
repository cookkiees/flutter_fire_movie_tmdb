import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class PopularMovieWorker {
  ApiService apiService = Get.find<ApiService>();

  prosesGetPopularMovie() async =>
      await apiService.fetchDataPopularMovie().then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
