import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/Core/Utils/enums.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_entities.dart';

class MovieState extends Equatable {

  final List<MovieEntities> nowPlayingMovies;
  final RequestsState nowPlayingState;
  final String nowPlayingMessage;
  final List<MovieEntities> popularMovies;
  final RequestsState popularState;
  final String popularMessage;
  final List<MovieEntities> topRatedMovies;
  final RequestsState topRatedState;
  final String topRatedMessage;

  const MovieState({
    this.nowPlayingMovies = const [] ,
    this.nowPlayingState = RequestsState.loading ,
    this.nowPlayingMessage = '' ,
    this.popularMovies = const [] ,
    this.popularState = RequestsState.loading ,
    this.popularMessage = '' ,
    this.topRatedMovies = const [] ,
    this.topRatedState = RequestsState.loading ,
    this.topRatedMessage = ''
  });


  MovieState copyWith({
    List<MovieEntities>? nowPlayingMovies ,
    RequestsState? nowPlayingState ,
    String? nowPlayingMessage ,

    List<MovieEntities>? popularMovies ,
    RequestsState? popularState ,
    String? popularMessage ,

    List<MovieEntities>? topRatedMovies ,
    RequestsState? topRatedState ,
    String? topRatedMessage
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies ,
      nowPlayingState: nowPlayingState?? this.nowPlayingState ,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage ,

      popularMovies: popularMovies ?? this.popularMovies ,
      popularState: popularState ?? this.popularState ,
      popularMessage: popularMessage ?? this.popularMessage ,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies ,
      topRatedState: topRatedState ?? this.topRatedState ,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage ,
    );
  }




  @override
  List<Object?> get props => [
    nowPlayingMovies ,
    nowPlayingState ,
    nowPlayingMessage ,
    popularMovies ,
    popularState ,
    popularMessage ,
    topRatedMovies ,
    topRatedState ,
    topRatedMessage
  ];


}