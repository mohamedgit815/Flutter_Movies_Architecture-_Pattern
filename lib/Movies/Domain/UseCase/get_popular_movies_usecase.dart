import 'package:flutter_movies_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movies_app/Core/Error/failure.dart';
import 'package:flutter_movies_app/Movies/Domain/Repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntities>,NoParameter> {

  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure , List<MovieEntities>>> call(NoParameter noParameter) async {
    return await baseMovieRepository.getPopularMovies();
  }
}