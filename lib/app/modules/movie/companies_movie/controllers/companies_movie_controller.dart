import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fire_movie/app/data/model/companies_details_response_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import 'companies_movie_interactor.dart';

class CompaniesMovieController extends GetxController {
  final interactor = Get.find<CompaniesMovieInteractor>();

  @override
  void onInit() {
    getSavedComapaniesMovie();
    getLucasFilmMovie(1, 1);
    getDisneyMovie(2, 1);
    getCompaniesDetails(1);
    super.onInit();
  }

  var selectedMovieIndex = 0.obs;

  void setSelectedMovieIndex(int index) {
    selectedMovieIndex.value = index;
  }

  var isLoading = false.obs;
  final lucasFilmMovie = <Results>[].obs;
  getLucasFilmMovie(companiesIds, page) async {
    isLoading.value = true;

    try {
      var results =
          await interactor.handleGetLucasFilmMovie(companiesIds, page);

      if (results != null) {
        lucasFilmMovie.assignAll(results);

        final prefs = await SharedPreferences.getInstance();
        final lucasFilmList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('lucasFilmMovie', jsonEncode(lucasFilmList));
      } else {
        getSavedComapaniesMovie();
      }
    } catch (e) {
      debugPrint("Error Get Lucas Film Movie: $e");
    } finally {
      isLoading.value = false;
    }
  }

  final disneyMovie = <Results>[].obs;
  getDisneyMovie(companiesIds, page) async {
    isLoading.value = true;

    try {
      var results = await interactor.handleGetDisneyMovie(companiesIds, page);

      if (results != null) {
        disneyMovie.assignAll(results);

        final prefs = await SharedPreferences.getInstance();
        final disneyList = results.map((element) => element.toJson()).toList();
        await prefs.setString('disneyMovie', jsonEncode(disneyList));
      } else {
        getSavedComapaniesMovie();
      }
    } catch (e) {
      debugPrint("Error Get Disney Movie: $e");
    } finally {
      isLoading.value = false;
    }
  }

  CompaniesDetailsResponseModel? companiesDetails;
  getCompaniesDetails(companiesIds) async {
    isLoading.value = true;

    try {
      companiesDetails =
          await interactor.handleGetCompaniesDetails(companiesIds);
    } catch (e) {
      debugPrint("Error Get Companies Details : $e");
    } finally {
      isLoading.value = false;
    }
  }

  void clearSavedCompaniesMovie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('lucasFilmMovie');
    await prefs.remove('disneyMovie');
  }

  void getSavedComapaniesMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLucasFilmMovie = prefs.getString('lucasFilmMovie');
    final savedDisneyMovie = prefs.getString('disneyMovie');

    if (savedLucasFilmMovie != null) {
      final listData = jsonDecode(savedLucasFilmMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      lucasFilmMovie.assignAll(data);
    }
    if (savedDisneyMovie != null) {
      final listData = jsonDecode(savedDisneyMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      disneyMovie.assignAll(data);
    }
  }
}
