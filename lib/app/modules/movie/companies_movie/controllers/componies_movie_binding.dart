import 'package:get/get.dart';

import 'companies_movie_controller.dart';
import 'companies_movie_interactor.dart';
import 'companies_movie_worker.dart';

class CompaniesMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompaniesMovieWorker>(() => CompaniesMovieWorker());
    Get.lazyPut<CompaniesMovieInteractor>(() => CompaniesMovieInteractor());
    Get.lazyPut<CompaniesMovieController>(() => CompaniesMovieController());
  }
}
