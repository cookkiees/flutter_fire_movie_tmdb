import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class UpComingMovieWorker {
  ApiService apiService = Get.find<ApiService>();

  prosesGetUpComingMovie() async =>
      await apiService.fetchDataUpComingMovie().then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
