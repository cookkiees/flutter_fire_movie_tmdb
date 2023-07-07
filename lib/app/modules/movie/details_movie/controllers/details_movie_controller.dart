import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/details_movie_response_model.dart';
import '../../../../data/model/discover_movie_response_model.dart';
import 'details_movie_interactor.dart';

class DetailsMovieController extends GetxController {
  final interactor = Get.find<DetailsMovieInteractor>();

  @override
  void onInit() {
    getDetailsMovie();
    getSimilarMovie();
    super.onInit();
  }

  var isLoadingDetailsMovie = false.obs;
  DetailsMovieResponseModel? detailsMovie;
  Future<void> getDetailsMovie() async {
    isLoadingDetailsMovie(true);
    try {
      detailsMovie =
          await interactor.handleGetDetailsMovie(Get.parameters["id"]);
    } catch (e) {
      debugPrint("Error Get Details Movie: $e");
      rethrow;
    } finally {
      isLoadingDetailsMovie(false);
    }
  }

  var isLoadingSimilarMovie = false.obs;
  List<Results>? similarMovie;

  getSimilarMovie() async {
    isLoadingSimilarMovie.value = true;
    try {
      similarMovie =
          await interactor.handleGetSimilarMovie(Get.parameters["id"]);
    } catch (e) {
      debugPrint("Error Get Similar Movie: $e");
    } finally {
      isLoadingSimilarMovie.value = false;
    }
  }
}
