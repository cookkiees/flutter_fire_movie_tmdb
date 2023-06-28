import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class DiscoverMovieWorker {
  ApiService apiService = Get.find<ApiService>();

  prosesGetDiscoverMovie() async =>
      await apiService.fetchDataDiscoverMovie().then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
