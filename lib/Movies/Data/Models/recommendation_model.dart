import 'package:flutter_movies_app/Movies/Domain/Entities/recommendation_entities.dart';

class RecommendationModel extends RecommendationEntities {
  const RecommendationModel({required String backdropPath, required int id}) : super(backdropPath: backdropPath, id: id);


  factory RecommendationModel.fromApp(Map<String,dynamic>map){
    return RecommendationModel(
        backdropPath: map['backdrop_path'] ,
        id: map['id']
    );
  }


}