import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class CountryMovieWorker {
  ApiService apiService = Get.find<ApiService>();

  Future<dynamic> prosesGetCountryMovie(String country) async =>
      await apiService.fetchDataCountryMovie(country).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
