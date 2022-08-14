import 'package:dartz/dartz.dart';
import 'package:flutter_movies_app/Core/Error/failure.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/recommendation_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_details_move_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_recommendation_usecase.dart';


abstract class BaseMovieRepository {

  Future<Either<Failure , List<MovieEntities>>> getNowPlaying();

  Future<Either<Failure , List<MovieEntities>>> getPopularMovies();

  Future<Either<Failure , List<MovieEntities>>> getTopRatedMovies();

  Future<Either<Failure , MovieDetailsEntities>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure , List<RecommendationEntities>>> getRecommendation(RecommendationParameters parameters);


}