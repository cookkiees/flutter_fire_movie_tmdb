import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'discover_movie_interactor.dart';

class DiscoverMovieController extends GetxController {
  final interactor = Get.find<DiscoverMovieInteractor>();

  @override
  void onInit() {
    getSavedDiscoverMovie();
    getDiscoverMovie();
    super.onInit();
  }

  var isLoadingDiscoverMovie = false.obs;
  final discoverMovie = <Results>[].obs;

  getDiscoverMovie() async {
    isLoadingDiscoverMovie.value = true;
    try {
      var results = await interactor.handleGetDiscoverMovie();
      if (results != null) {
        discoverMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('discoverMovie', jsonEncode(discoverList));
      } else {
        await getDiscoverMovie();
      }
    } catch (e) {
      debugPrint("Error Get Discover Movie: $e");
    } finally {
      isLoadingDiscoverMovie.value = false;
    }
  }

  void clearSavedDiscoverMovie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('discoverMovie');
  }

  void getSavedDiscoverMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDiscoverMovie = prefs.getString('discoverMovie');

    if (savedDiscoverMovie != null) {
      final listData = jsonDecode(savedDiscoverMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      discoverMovie.assignAll(data);
    }
  }
}
