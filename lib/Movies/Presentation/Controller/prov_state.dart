import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_now_playing_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_popular_movies_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_top_rated_movies_usecase.dart';


class ProvState extends ChangeNotifier {
   final List<MovieEntities> nowPlayingMovies = <MovieEntities>[];
   final List<MovieEntities> popularMovies = <MovieEntities>[];
   final List<MovieEntities> topRatedMovies = <MovieEntities>[];

  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMovesUseCase getTopRatedMovesUseCase;

  ProvState(
     this.getNowPlayingUseCase ,
     this.getPopularMoviesUseCase ,
     this.getTopRatedMovesUseCase
      );


  /// GetNowPlayingMoviesEvent
  FutureOr<void> getNowPlayingMoviesEvent() async {
    final _result = await getNowPlayingUseCase(const NoParameter());

    _result.fold(
            (l) => "Null" ,
            (r) => nowPlayingMovies
    );
    notifyListeners();

    // emit(const MovieState(nowPlayingState: RequestsState.loaded));

    // _result.fold(
    //         (l) => emit(state.copyWith(nowPlayingState: RequestsState.error ,nowPlayingMessage: l.message)) ,
    //         (r) => emit(state.copyWith(nowPlayingMovies: r,nowPlayingState: RequestsState.loading))
    // );
  }


}