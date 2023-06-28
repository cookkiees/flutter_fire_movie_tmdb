import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/discover_movie_response_model.dart';
import '../../../../data/model/genre_movie_response_model.dart';
import 'genre_movie_interactor.dart';

class GenreMovieController extends GetxController {
  final interactor = Get.find<GenreMovieInteractor>();

  @override
  void onInit() {
    getSavedGenreMovie();
    getWarMovie(1);
    getActionMovie(1);
    getAdventureMovie(1);
    getComedyMovie(1);
    getFantasyMovie(1);
    getScienceFictionMovie(1);
    getAllGenreMovie(28);
    super.onInit();
  }

  var selectedMovieIndex = 0.obs;

  void setSelectedMovieIndex(int index) {
    selectedMovieIndex.value = index;
  }

  var onSelectAllGenre = 0.obs;

  void setonSelectAllGenre(int index) {
    onSelectAllGenre.value = index;
  }

  var isLoadingAllGenreMovie = false.obs;
  List<Results> allGenreMovie = [];

  Future<List<Results>> getAllGenreMovie(dynamic genreIds) async {
    isLoadingAllGenreMovie.value = true;
    try {
      var results = await interactor.handleGetAllGenreMovie(genreIds, 1);
      if (results != null) {
        allGenreMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('allGenreMovie', jsonEncode(discoverList));
        return allGenreMovie;
      } else {
        getSavedGenreMovie();
        return [];
      }
    } catch (e) {
      debugPrint("Error Get AllGenre Movie: $e");
      return [];
    } finally {
      isLoadingAllGenreMovie.value = false;
    }
  }

  var isLoadingWarMovie = false.obs;
  final warMovie = <Results>[].obs;

  Future<void> getWarMovie(page) async {
    isLoadingWarMovie.value = true;
    try {
      var results = await interactor.handleGetWarMovie(page);
      if (results != null) {
        warMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('warMovie', jsonEncode(discoverList));
      } else {
        getSavedGenreMovie();
      }
    } catch (e) {
      debugPrint("Error Get War Movie: $e");
    } finally {
      isLoadingWarMovie.value = false;
    }
  }

  var isLoadingActionMovie = false.obs;
  final actionMovie = <Results>[].obs;

  Future<void> getActionMovie(page) async {
    isLoadingActionMovie.value = true;
    try {
      var results = await interactor.handleGetActionMovie(page);
      if (results != null) {
        actionMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('actionMovie', jsonEncode(discoverList));
      } else {
        getSavedGenreMovie();
      }
    } catch (e) {
      debugPrint("Error Get Action Movie: $e");
    } finally {
      isLoadingActionMovie.value = false;
    }
  }

  var isLoadingAdventureMovie = false.obs;
  final adventureMovie = <Results>[].obs;

  Future<void> getAdventureMovie(page) async {
    isLoadingAdventureMovie.value = true;
    try {
      var results = await interactor.handleGetAdventureMovie(page);
      if (results != null) {
        adventureMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('adventureMovie', jsonEncode(discoverList));
      } else {
        getSavedGenreMovie();
      }
    } catch (e) {
      debugPrint("Error Get Adventure Movie: $e");
    } finally {
      isLoadingAdventureMovie.value = false;
    }
  }

  var isLoadingComedyMovie = false.obs;
  final comedyMovie = <Results>[].obs;

  Future<void> getComedyMovie(page) async {
    isLoadingComedyMovie.value = true;
    try {
      var results = await interactor.handleGetComedyMovie(page);
      if (results != null) {
        comedyMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('comedyMovie', jsonEncode(discoverList));
      } else {
        getSavedGenreMovie();
      }
    } catch (e) {
      debugPrint("Error Get Comedy Movie: $e");
    } finally {
      isLoadingComedyMovie.value = false;
    }
  }

  var isLoadingFantasyMovie = false.obs;
  final fantasyMovie = <Results>[].obs;

  Future<void> getFantasyMovie(page) async {
    isLoadingFantasyMovie.value = true;
    try {
      var results = await interactor.handleGetFantasyMovie(page);
      if (results != null) {
        fantasyMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('fantasyMovie', jsonEncode(discoverList));
      } else {
        getSavedGenreMovie();
      }
    } catch (e) {
      debugPrint("Error Get Fantasy Movie: $e");
    } finally {
      isLoadingFantasyMovie.value = false;
    }
  }

  var isLoadingScienceFictionMovie = false.obs;
  final scienceFictionMovie = <Results>[].obs;
  Future<void> getScienceFictionMovie(page) async {
    isLoadingScienceFictionMovie.value = true;
    try {
      var results = await interactor.handleGetScienceFictionMovie(page);
      if (results != null) {
        scienceFictionMovie.assignAll(results);
        final prefs = await SharedPreferences.getInstance();
        final discoverList =
            results.map((element) => element.toJson()).toList();
        await prefs.setString('scienceFictionMovie', jsonEncode(discoverList));
      } else {
        getSavedGenreMovie();
      }
    } catch (e) {
      debugPrint("Error Get ScienceFiction Movie: $e");
    } finally {
      isLoadingScienceFictionMovie.value = false;
    }
  }

  void clearSavedGenreMovie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('warMovie');
  }

  void getSavedGenreMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedWarMovie = prefs.getString('warMovie');

    if (savedWarMovie != null) {
      final listData = jsonDecode(savedWarMovie) as List<dynamic>;
      final data = listData.map((item) => Results.fromJson(item)).toList();
      warMovie.assignAll(data);
    }
  }

  var isLoadingGenre = false.obs;
  final genres = <Genres>[].obs;

  Future<String> getFirstGenreFromMovie(List<int> genreIds) async {
    List<int> parsedGenreIds = genreIds.cast<int>();
    if (parsedGenreIds.isNotEmpty) {
      int firstGenreId = parsedGenreIds.first;
      if (genres.isEmpty) {
        await getGenreMovie(genreIds);
      }
      Genres? genre = genres.firstWhere((genre) => genre.id == firstGenreId,
          orElse: () => Genres());
      return genre.name!;
    }
    return 'Unknown';
  }

  Future<void> getGenreMovie(List<int> genreIds) async {
    isLoadingGenre.value = true;
    try {
      genres.value = await interactor.handleGetGenre(genreIds);
    } catch (e) {
      debugPrint("Error fetching Genre Movie: $e");
    } finally {
      isLoadingGenre.value = false;
    }
  }
}
