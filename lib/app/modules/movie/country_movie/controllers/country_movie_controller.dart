import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'country_movie_interactor.dart';

class CountryMovieController extends GetxController {
  final interactor = Get.find<CountryMovieInteractor>();

  @override
  void onInit() {
    getSavedCountryMovie();
    getIndonesiaMovie('ID');
    getKoreanMovie('KR');
    super.onInit();
  }

  var selectedMovieIndex = 0.obs;

  void setSelectedMovieIndex(int index) {
    selectedMovieIndex.value = index;
  }

  var isLoadingKoreanMovie = false.obs;
  final koreanMovie = <Results>[].obs;
  getKoreanMovie(String country) async {
    isLoadingKoreanMovie.value = true;

    try {
      var results = await interactor.handleGetKoreanMovie(country);

      if (results != null) {
        koreanMovie.assignAll(results);

        final prefs = await SharedPreferences.getInstance();
        final countryList = results.map((element) => element.toJson()).toList();
        await prefs.setString('koreanMovie', jsonEncode(countryList));
      } else {
        getSavedCountryMovie();
      }
    } catch (e) {
      debugPrint("Error Get Country Movie: $e");
    } finally {
      isLoadingKoreanMovie.value = false;
    }
  }

  var isLoadingIndonesiaMovie = false.obs;

  final indonesiaMovie = <Results>[].obs;
  getIndonesiaMovie(country) async {
    isLoadingIndonesiaMovie.value = true;

    try {
      var results = await interactor.handleGetIndonesiaMovie(country);

      if (results != null) {
        indonesiaMovie.assignAll(results);

        final prefs = await SharedPreferences.getInstance();
        final countryList = results.map((element) => element.toJson()).toList();
        await prefs.setString('indonesiaMovie', jsonEncode(countryList));
      } else {
        getSavedCountryMovie();
      }
    } catch (e) {
      debugPrint("Error Get Country Movie: $e");
    } finally {
      isLoadingIndonesiaMovie.value = false;
    }
  }

  void clearSavedCountryMovie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('koreanMovie');
  }

  void getSavedCountryMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedKoreanMovie = prefs.getString('koreanMovie');
    final savedIndonesiaMovie = prefs.getString('indonesiaMovie');

    if (savedKoreanMovie != null) {
      final listData = jsonDecode(savedKoreanMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      koreanMovie.assignAll(data);
    }
    if (savedIndonesiaMovie != null) {
      final listData = jsonDecode(savedIndonesiaMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      indonesiaMovie.assignAll(data);
    }
  }
}
