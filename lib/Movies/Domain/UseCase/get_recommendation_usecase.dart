import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/Core/Error/failure.dart';
import 'package:flutter_movies_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/recommendation_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Repository/base_movie_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<RecommendationEntities> , RecommendationParameters> {

  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<RecommendationEntities>>> call(RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }

}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object?> get props => [id];
}