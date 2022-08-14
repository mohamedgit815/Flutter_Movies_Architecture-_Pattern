import 'package:flutter_movies_app/Movies/Domain/Entities/movie_entities.dart';

class MovieModel extends MovieEntities {
  const MovieModel({
    required int id ,
    required String title ,
    required String backdropPath ,
    required String overview ,
    required double voteAverage ,
    required List<int> genreIds
  }) : super(
      id: id ,
      title: title ,
      backdropPath: backdropPath ,
      overview: overview ,
      voteAverage: voteAverage ,
      genreIds: genreIds
  );

  factory MovieModel.fromApp(Map<String,dynamic> json) {
    return MovieModel(
        id: json['id'] ,
        title: json['title'] ,
        backdropPath: json['backdrop_path'] ,
        overview: json['overview'] ,
        voteAverage: json['vote_average'] ,
        genreIds: List<int>.from(json['genre_ids'].map((e) => e))
    );
  }
}