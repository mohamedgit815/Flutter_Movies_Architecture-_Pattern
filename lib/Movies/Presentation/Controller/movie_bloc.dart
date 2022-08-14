import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_movies_app/Core/Utils/enums.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_now_playing_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_popular_movies_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_top_rated_movies_usecase.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_event.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_state.dart';


class MovieBloc extends Bloc<MovieEvents , MovieState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMovesUseCase getTopRatedMovesUseCase;

  MovieBloc( this.getNowPlayingUseCase , this.getPopularMoviesUseCase , this.getTopRatedMovesUseCase )
      : super(const MovieState()) {

    /// GetNowPlayingMoviesEvent
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMoviesEvent);



    /// GetPopularMoviesUseCase
    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);



    /// GetTopRatedMovesUseCase
    on<GetTopRatedEvent>(_getTopRatedEvent);

  }


  /// GetNowPlayingMoviesEvent
  FutureOr<void> _getNowPlayingMoviesEvent(GetNowPlayingMoviesEvent event , Emitter<MovieState> emit) async {
    final _result = await getNowPlayingUseCase(const NoParameter());

    // emit(const MovieState(nowPlayingState: RequestsState.loaded));

    _result.fold(
            (l) => emit(state.copyWith(nowPlayingState: RequestsState.error ,nowPlayingMessage: l.message)) ,
            (r) => emit(state.copyWith(nowPlayingMovies: r,nowPlayingState: RequestsState.loading))
    );
  }



  /// GetPopularMoviesUseCase
  FutureOr<void> _getPopularMoviesEvent(GetPopularMoviesEvent event , Emitter<MovieState> emit) async {
    final _result = await getPopularMoviesUseCase(const NoParameter());

    _result.fold(
            (l) => emit(state.copyWith(popularState: RequestsState.error ,popularMessage: l.message)) ,
            (r) => emit(state.copyWith(popularMovies: r,popularState: RequestsState.loading))
    );
  }



  /// GetTopRatedMovesUseCase
  FutureOr<void> _getTopRatedEvent(GetTopRatedEvent event , Emitter<MovieState> emit) async {
    final _result = await getTopRatedMovesUseCase(const NoParameter());

    _result.fold(
            (l) => emit(state.copyWith(topRatedState: RequestsState.error ,topRatedMessage: l.message)) ,
            (r) => emit(state.copyWith(topRatedMovies: r,topRatedState: RequestsState.loading))
    );
  }


}