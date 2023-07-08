import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/credit_movie_response_model.dart';
import '../../../../data/model/details_movie_response_model.dart';
import '../../../../data/model/discover_movie_response_model.dart';
import 'details_movie_interactor.dart';

class DetailsMovieController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final interactor = Get.find<DetailsMovieInteractor>();
  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  TabController? tabController;

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    getDetailsMovie();
    getSimilarMovie();
    getCreditMovie();
    getRecommendationMovie();
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  void refreshData() async {
    isLoadingDetailsMovie.value = true;
    isLoadingSimilarMovie.value = true;
    isLoadingCreditMovie.value = true;
    isLoadingRecommendationMovie.value = true;
    getDetailsMovie();
    getSimilarMovie();
    getCreditMovie();
    getRecommendationMovie();
  }

  var id = "";
  var isLoadingDetailsMovie = false.obs;
  DetailsMovieResponseModel? detailsMovie;
  Future<void> getDetailsMovie() async {
    isLoadingDetailsMovie(true);

    try {
      id = Get.parameters["id"]!;
      if (id == "") {
        isLoadingDetailsMovie(false);
        return;
      } else {
        detailsMovie = await interactor.handleGetDetailsMovie(id);
      }
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
      id = Get.parameters["id"]!;
      if (id == "") {
        isLoadingSimilarMovie(false);
        return;
      } else {
        similarMovie = await interactor.handleGetSimilarMovie(id);
      }
    } catch (e) {
      debugPrint("Error Get Similar Movie: $e");
    } finally {
      isLoadingSimilarMovie.value = false;
    }
  }

  var isLoadingCreditMovie = false.obs;
  List<Cast>? creditMovie;

  getCreditMovie() async {
    isLoadingCreditMovie.value = true;

    try {
      id = Get.parameters["id"]!;
      if (id == "") {
        isLoadingCreditMovie(false);
        return;
      } else {
        creditMovie = await interactor.handleGetCreditMovie(id);
      }
    } catch (e) {
      debugPrint("Error Get Credit Movie: $e");
    } finally {
      isLoadingCreditMovie.value = false;
    }
  }

  var isLoadingRecommendationMovie = false.obs;
  final recommendationMovie = <Results>[].obs;

  getRecommendationMovie() async {
    isLoadingRecommendationMovie.value = true;
    try {
      id = Get.parameters["id"]!;
      if (id == "") {
        isLoadingCreditMovie(false);
        return;
      } else {
        var results = await interactor.handleGetRecommentdationMovie(id);

        if (results != null) {
          recommendationMovie.assignAll(results);
        }
      }
    } catch (e) {
      debugPrint("Error Get Recommendation Movie: $e");
    } finally {
      isLoadingRecommendationMovie.value = false;
    }
  }
}
