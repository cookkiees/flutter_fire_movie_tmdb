import 'package:get/get.dart';

import 'discover_movie_controller.dart';
import 'discover_movie_interactor.dart';
import 'discover_movie_worker.dart';

class DiscoverMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverMovieWorker>(() => DiscoverMovieWorker());
    Get.lazyPut<DiscoverMovieInteractor>(() => DiscoverMovieInteractor());
    Get.lazyPut<DiscoverMovieController>(() => DiscoverMovieController());
  }
}
