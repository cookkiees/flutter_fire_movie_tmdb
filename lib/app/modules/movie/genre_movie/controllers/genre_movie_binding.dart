import 'package:get/get.dart';

import 'genre_movie_controllers.dart';
import 'genre_movie_interactor.dart';
import 'genre_movie_worker.dart';

class GenreMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreMovieWorker>(() => GenreMovieWorker());
    Get.lazyPut<GenreMovieInteractor>(() => GenreMovieInteractor());
    Get.lazyPut<GenreMovieController>(() => GenreMovieController());
  }
}
