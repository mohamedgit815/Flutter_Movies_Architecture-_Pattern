import 'package:flutter_movies_app/Movies/Data/Models/genres_model.dart';
import 'package:flutter_movies_app/Movies/Domain/Entities/movie_details_entities.dart';

class MovieDetailsModel extends MovieDetailsEntities {
  const MovieDetailsModel({
    required String backdropPath ,
    required String overview ,
    required String releaseDate ,
    required String title ,
    required double voteAverage ,
    required int id ,
    required int runtime ,
    required List<GenresModel> genres
  }) : super(
      backdropPath: backdropPath ,
      overview: overview ,
      releaseDate: releaseDate ,
      title: title ,
      voteAverage: voteAverage ,
      id: id ,
      runtime: runtime ,
      genres: genres
  );

  factory MovieDetailsModel.fromApp(Map<String,dynamic>map){
    return MovieDetailsModel(
        backdropPath: map['backdrop_path'] ,
        overview: map['overview'] ,
        releaseDate: map['release_date'] ,
        title: map['title'] ,
        voteAverage: map['vote_average'].toDouble() ,
        id: map['id'] ,
        runtime: map['runtime'] ,
        genres: List.from(map['genres'].map((e) => GenresModel.fromApp(e)))
    );
  }

}