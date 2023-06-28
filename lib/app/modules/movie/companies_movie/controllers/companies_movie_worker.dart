import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/services/api_service.dart';

class CompaniesMovieWorker {
  ApiService apiService = Get.find<ApiService>();

  Future<dynamic> prosesGetCompaniesMovie(companiesIds, page) async =>
      await apiService.fetchDataCompaniesMovie(companiesIds, page).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
  Future<dynamic> prosesGetCompaniesDetails(companiesIds) async =>
      await apiService.fetchDataCompaniesDetails(companiesIds).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
