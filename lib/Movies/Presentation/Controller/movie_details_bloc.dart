import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/Core/Utils/enums.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_details_move_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_recommendation_usecase.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_details_event.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_details_state.dart';


class MovieDetailsBloc extends Bloc<MovieDetailsEvent , MovieDetailsState> {
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMoviesDetailsUseCase , this.getRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }


  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final _result = await getMoviesDetailsUseCase(MovieDetailsParameters(movieID: event.id));

    _result.fold(
            (l) => emit(state.copyWith(movieDetailsState: RequestsState.error , movieDetailsMessage: l.message))
        ,
            (r) => emit(state.copyWith(movieDetailsState: RequestsState.loaded , detailsEntities: r)));
  }



  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final _result = await getRecommendationUseCase(RecommendationParameters(id: event.id));

    _result.fold(
            (l) => emit(state.copyWith(recommendationState: RequestsState.error , recommendationMessage: l.message))
        ,
            (r) => emit(state.copyWith(recommendationState: RequestsState.loaded , recommendationEntities: r)));
  }
}