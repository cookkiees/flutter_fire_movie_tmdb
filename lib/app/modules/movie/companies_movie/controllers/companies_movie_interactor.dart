import 'package:get/get.dart';

import '../../../../data/model/companies_details_response_model.dart';
import '../../../../data/model/discover_movie_response_model.dart';
import 'companies_movie_worker.dart';

class CompaniesMovieInteractor {
  CompaniesMovieWorker worker = Get.find<CompaniesMovieWorker>();
  Future<List<Results>?> handleGetLucasFilmMovie(companiesIds, page) async {
    var lucasFilmMovie =
        await worker.prosesGetCompaniesMovie(companiesIds, page);
    var discoverMovieResponseModel =
        DiscoverMovieResponseModel.fromJson(lucasFilmMovie).results;
    return discoverMovieResponseModel;
  }

  Future<List<Results>?> handleGetDisneyMovie(companiesIds, page) async {
    var disneyMovie = await worker.prosesGetCompaniesMovie(companiesIds, page);
    var discoverMovieResponseModel =
        DiscoverMovieResponseModel.fromJson(disneyMovie).results;
    return discoverMovieResponseModel;
  }

  Future<CompaniesDetailsResponseModel?> handleGetCompaniesDetails(
      companiesIds) async {
    var comapanies = await worker.prosesGetCompaniesDetails(companiesIds);
    var discoverMovieResponseModel =
        CompaniesDetailsResponseModel.fromJson(comapanies);
    return discoverMovieResponseModel;
  }
}
