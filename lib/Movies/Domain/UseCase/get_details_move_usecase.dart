import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/Core/Error/failure.dart';
import 'package:flutter_movies_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Repository/base_movie_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MovieDetailsEntities, MovieDetailsParameters> {

  final BaseMovieRepository baseMovieRepository;

  GetMoviesDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetailsEntities>> call(MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }

}

class MovieDetailsParameters extends Equatable {

  final int movieID;

  const MovieDetailsParameters({required this.movieID});

  @override
  List<Object?> get props => [];

}