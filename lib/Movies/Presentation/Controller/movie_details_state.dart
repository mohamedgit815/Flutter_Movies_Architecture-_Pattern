import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/Core/Utils/enums.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/recommendation_entities.dart';

class MovieDetailsState extends Equatable {

  final MovieDetailsEntities? detailsEntities;
  final RequestsState movieDetailsState;
  final String movieDetailsMessage;

  final List<RecommendationEntities>? recommendationEntities;
  final RequestsState recommendationState;
  final String recommendationMessage;


  const MovieDetailsState({
     this.detailsEntities ,
     this.movieDetailsState = RequestsState.loading ,
     this.movieDetailsMessage = '' ,

    this.recommendationEntities = const [],
    this.recommendationState = RequestsState.loading ,
    this.recommendationMessage = ''
  });


  MovieDetailsState copyWith({
    MovieDetailsEntities? detailsEntities ,
    RequestsState? movieDetailsState ,
    String? movieDetailsMessage ,

    List<RecommendationEntities>? recommendationEntities ,
    RequestsState? recommendationState ,
    String? recommendationMessage ,
      }) {
    return MovieDetailsState(
        detailsEntities: detailsEntities ?? this.detailsEntities ,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState ,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage ,

        recommendationEntities: recommendationEntities ?? this.recommendationEntities ,
        recommendationState: recommendationState ?? this.recommendationState ,
        recommendationMessage: recommendationMessage ?? this.recommendationMessage
    );
  }


  @override
  List<Object?> get props => [
    detailsEntities , movieDetailsState , movieDetailsMessage ,
    recommendationEntities , recommendationState , recommendationMessage ,
  ];

}