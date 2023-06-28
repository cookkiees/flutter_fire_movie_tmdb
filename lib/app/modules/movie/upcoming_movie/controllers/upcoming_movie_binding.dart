import 'package:get/get.dart';

import 'upcoming_movie_controller.dart';
import 'upcoming_movie_interactor.dart';
import 'upcoming_movie_worker.dart';

class UpComingMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpComingMovieWorker>(() => UpComingMovieWorker());
    Get.lazyPut<UpComingMovieInteractor>(() => UpComingMovieInteractor());
    Get.lazyPut<UpComingMovieController>(() => UpComingMovieController());
  }
}
