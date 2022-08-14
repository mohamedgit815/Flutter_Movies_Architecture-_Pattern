import 'package:equatable/equatable.dart';

class MovieEntities extends Equatable {

  final int id;
  final String title , backdropPath , overview ;
  final double voteAverage;
  final List<int> genreIds;


  const MovieEntities({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genreIds
});


  @override
  List<Object?> get props => [ id , title , backdropPath , overview , voteAverage , genreIds ];


}