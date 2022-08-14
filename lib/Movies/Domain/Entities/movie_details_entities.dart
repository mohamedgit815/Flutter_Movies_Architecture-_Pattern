import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/genres_entities.dart';

class MovieDetailsEntities extends Equatable {

  final String backdropPath , overview , releaseDate , title ;
  final double voteAverage;
  final int id , runtime ;
  final List<GenresEntities> genres;

  const MovieDetailsEntities({
    required this.backdropPath ,
    required this.overview ,
    required this.releaseDate ,
    required this.title ,
    required this.voteAverage ,
    required  this.id ,
    required this.runtime ,
    required this.genres
  });

  @override
  List<Object?> get props => [genres , backdropPath , overview , releaseDate , title , voteAverage , id , runtime];

}