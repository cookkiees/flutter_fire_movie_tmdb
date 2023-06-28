import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'upcoming_movie_interactor.dart';

class UpComingMovieController extends GetxController {
  final interactor = Get.find<UpComingMovieInteractor>();

  @override
  void onInit() {
    getSavedUpComingMovie();
    getUpComingMovie();
    super.onInit();
  }

  var isLoadingUpComingMovie = false.obs;
  final upComingMovie = <Results>[].obs;

  getUpComingMovie() async {
    isLoadingUpComingMovie.value = true;

    try {
      var upComing = await interactor.handleGetUpComingMovie();
      if (upComing != null) {
        upComingMovie.assignAll(upComing);

        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            upComing.map((element) => element.toJson()).toList();
        await prefs.setString('UpComingMovie', jsonEncode(discoverList));
      } else {
        getSavedUpComingMovie();
      }
    } catch (e) {
      debugPrint("Error Get Up Coming Movie  Page: $e");
    } finally {
      isLoadingUpComingMovie.value = false;
    }
  }

  void clearSavedUpComingMoviePage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('UpComingMovie');
  }

  void getSavedUpComingMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUpComingMovie = prefs.getString('UpComingMovie');

    if (savedUpComingMovie != null) {
      final dataList = jsonDecode(savedUpComingMovie) as List<dynamic>;
      final data = dataList.map((item) => Results.fromJson(item)).toList();
      upComingMovie.assignAll(data);
    }
  }
}
