import 'package:dartz/dartz.dart';
import 'package:flutter_movies_app/Core/Error/exception.dart';
import 'package:flutter_movies_app/Core/Error/failure.dart';
import 'package:flutter_movies_app/Movies/Data/DataSource/movie_remote_data_source.dart';
import 'package:flutter_movies_app/Movies/Data/Models/movie_details_model.dart';
import 'package:flutter_movies_app/Movies/Data/Models/movie_model.dart';
import 'package:flutter_movies_app/Movies/Data/Models/recommendation_model.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/recommendation_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Repository/base_movie_repository.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_details_move_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_recommendation_usecase.dart';


class MovieRepository extends BaseMovieRepository {

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;


  MovieRepository(this.baseMovieRemoteDataSource);


  @override
  Future<Either<Failure , List<MovieEntities>>> getNowPlaying() async {
    final List<MovieModel> _result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try{
      return Right(_result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



  @override
  Future<Either<Failure , List<MovieEntities>>> getPopularMovies() async {
    final List<MovieModel> _result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(_result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



  @override
  Future<Either<Failure , List<MovieEntities>>> getTopRatedMovies() async {
    final List<MovieModel> _result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try{
      return Right(_result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



  @override
  Future<Either<Failure , MovieDetailsEntities>> getMovieDetails(MovieDetailsParameters parameters) async {
    final MovieDetailsModel _result = await baseMovieRemoteDataSource.getMovieDetails(parameters);

    try{
      return Right(_result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



  @override
  Future<Either<Failure , List<RecommendationEntities>>> getRecommendation(RecommendationParameters parameters) async {
    final List<RecommendationModel> _result = await baseMovieRemoteDataSource.getRecommendation(parameters);

    try{
      return Right(_result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}