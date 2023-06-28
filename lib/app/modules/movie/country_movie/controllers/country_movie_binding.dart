import 'package:get/get.dart';

import 'country_movie_controller.dart';
import 'country_movie_interactor.dart';
import 'country_movie_worker.dart';

class CountryMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryMovieWorker>(() => CountryMovieWorker());
    Get.lazyPut<CountryMovieInteractor>(() => CountryMovieInteractor());
    Get.lazyPut<CountryMovieController>(() => CountryMovieController());
  }
}
