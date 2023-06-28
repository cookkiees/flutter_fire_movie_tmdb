import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'just_release_movie_interactor.dart';

class JustReleaseMovieController extends GetxController {
  final interactor = Get.find<JustReleaseMovieInteractor>();

  @override
  void onInit() {
    getSavedJustReleaseMovie();
    getJustReleaseMovie(2);
    super.onInit();
  }

  var isLoadingJustReleaseMovie = false.obs;
  final justReleaseMovie = <Results>[].obs;

  getJustReleaseMovie(int page) async {
    isLoadingJustReleaseMovie.value = true;

    try {
      var results = await interactor.handleGetJustReleaseMovie(page);
      if (results != null) {
        justReleaseMovie.assignAll(results);

        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('justReleaseMovie', jsonEncode(discoverList));
      } else {
        getSavedJustReleaseMovie();
      }
    } catch (e) {
      debugPrint("Error Get Just Release Movie  Page: $e");
    } finally {
      isLoadingJustReleaseMovie.value = false;
    }
  }

  void clearSavedJustReleaseMoviePage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('justReleaseMovie');
  }

  void getSavedJustReleaseMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedjustReleaseMovie = prefs.getString('justReleaseMovie');

    if (savedjustReleaseMovie != null) {
      final listData = jsonDecode(savedjustReleaseMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      justReleaseMovie.assignAll(data);
    }
  }
}
