import 'package:get/get.dart';

import 'details_movie_controller.dart';
import 'details_movie_interactor.dart';
import 'details_movie_worker.dart';

class DetailsMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsMovieWorker>(() => DetailsMovieWorker());
    Get.lazyPut<DetailsMovieInteractor>(() => DetailsMovieInteractor());
    Get.lazyPut<DetailsMovieController>(() => DetailsMovieController());
  }
}
