import 'package:get/get.dart';

import 'just_release_movie_controller.dart';
import 'just_release_movie_interactor.dart';
import 'just_release_movie_worker.dart';

class JustReleaseMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JustReleaseMovieWorker>(() => JustReleaseMovieWorker());
    Get.lazyPut<JustReleaseMovieInteractor>(() => JustReleaseMovieInteractor());
    Get.lazyPut<JustReleaseMovieController>(() => JustReleaseMovieController());
  }
}
