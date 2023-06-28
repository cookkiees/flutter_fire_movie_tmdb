import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/model/discover_movie_response_model.dart';
import 'popular_movie_interactor.dart';

class PopularMovieController extends GetxController {
  final interactor = Get.find<PopularMovieInteractor>();

  @override
  void onInit() {
    getSavedPopularMovie();
    getPopularMovie();
    super.onInit();
  }

  var selectedMovieIndex = 0.obs;

  void setSelectedMovieIndex(int index) {
    selectedMovieIndex.value = index;
  }

  var isLoadingPopularMovie = false.obs;
  final popularMovie = <Results>[].obs;
  getPopularMovie() async {
    isLoadingPopularMovie.value = true;

    try {
      var results = await interactor.handleGetPopularMovie();

      if (results != null) {
        popularMovie.assignAll(results);

        final prefs = await SharedPreferences.getInstance();
        final popularList = results.map((element) => element.toJson()).toList();
        await prefs.setString('popularMovie', jsonEncode(popularList));
      } else {
        getSavedPopularMovie();
      }
    } catch (e) {
      debugPrint("Error Get Popular Movie: $e");
    } finally {
      isLoadingPopularMovie.value = false;
    }
  }

  void clearSavedPopularMovie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('popularMovie');
  }

  void getSavedPopularMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPopularMovie = prefs.getString('popularMovie');

    if (savedPopularMovie != null) {
      final listData = jsonDecode(savedPopularMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      popularMovie.assignAll(data);
    }
  }
}
