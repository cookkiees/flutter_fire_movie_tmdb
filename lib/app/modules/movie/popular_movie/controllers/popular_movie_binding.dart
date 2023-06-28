import 'package:get/get.dart';

import 'popular_movie_controller.dart';
import 'popular_movie_interactor.dart';
import 'popular_movie_worker.dart';

class PopularMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularMovieWorker>(() => PopularMovieWorker());
    Get.lazyPut<PopularMovieInteractor>(() => PopularMovieInteractor());
    Get.lazyPut<PopularMovieController>(() => PopularMovieController());
  }
}
