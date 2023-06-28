import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/details_movie_response_model.dart';
import 'details_movie_interactor.dart';

class DetailsMovieController extends GetxController {
  final interactor = Get.find<DetailsMovieInteractor>();

  var isLoadingDetailsMovie = false.obs;
  DetailsMovieResponseModel? detailsMovie;
  Future<DetailsMovieResponseModel> getDetailsMovie(movieIds) async {
    isLoadingDetailsMovie(true);
    try {
      final response = await interactor.handleGetDetailsMovie(movieIds);

      final detailMovie = response;
      return detailMovie;
    } catch (e) {
      debugPrint("Error Get Details Movie: $e");
      rethrow;
    } finally {
      isLoadingDetailsMovie(false);
    }
  }
}
