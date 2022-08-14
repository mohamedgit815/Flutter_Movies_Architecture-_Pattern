import 'package:flutter_movies_app/Movies/Domain/Entities/genres_entities.dart';


class GenresModel extends GenresEntities {
  const GenresModel({required String name, required int id}) : super(name: name, id: id);

  factory GenresModel.fromApp(Map<String,dynamic>map) {
    return GenresModel(name: map['name'], id: map['id']);
  }
}