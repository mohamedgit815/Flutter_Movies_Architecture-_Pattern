import 'package:dio/dio.dart';
import 'package:flutter_movies_app/Core/Error/exception.dart';
import 'package:flutter_movies_app/Core/Network/error_message_model.dart';
import 'package:flutter_movies_app/Core/Utils/app_constance.dart';
import 'package:flutter_movies_app/Movies/Data/Models/movie_details_model.dart';
import 'package:flutter_movies_app/Movies/Data/Models/movie_model.dart';
import 'package:flutter_movies_app/Movies/Data/Models/recommendation_model.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_details_move_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {

  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);


  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource {


  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final Response<dynamic> _response = await Dio().getUri(
        Uri.parse('${AppConstance.baseUrl}/movie/now_playing?api_key=${AppConstance.appKey}'));
    //final Map<String,dynamic> _body = _response.data;
    // final List<dynamic> _data = _body['results'];

    if(_response.statusCode == 200) {
      return List<MovieModel>.from((_response.data['results'] as List).map((e) => MovieModel.fromApp(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }



  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final Response<dynamic> _response = await Dio().getUri(
        Uri.parse('${AppConstance.baseUrl}/movie/popular?api_key=${AppConstance.appKey}'));

    if(_response.statusCode == 200) {
      return List<MovieModel>.from((_response.data['results'] as List).map((e) => MovieModel.fromApp(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }



  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final Response<dynamic> _response = await Dio().getUri(
        Uri.parse('${AppConstance.baseUrl}/movie/top_rated?api_key=${AppConstance.appKey}'));
    //final Map<String,dynamic> _body = _response.data;
    // final List<dynamic> _data = _body['results'];

   // print(_response);
    if(_response.statusCode == 200) {
      return List<MovieModel>.from((_response.data['results'] as List).map((e) => MovieModel.fromApp(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }



  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    final Response<dynamic> _response = await Dio().getUri(
        Uri.parse('${AppConstance.baseUrl}/movie/${parameters.movieID}?api_key=${AppConstance.appKey}'));
    if(_response.statusCode == 200) {
      return MovieDetailsModel.fromApp(_response.data);
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }



  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
    final Response<dynamic> _response = await Dio().getUri(
        Uri.parse('${AppConstance.baseUrl}/movie/${parameters.id}/recommendations?api_key=${AppConstance.appKey}'));

    if(_response.statusCode == 200) {
      return List<RecommendationModel>.from((_response.data['results'] as List).map((e) => RecommendationModel.fromApp(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }


}