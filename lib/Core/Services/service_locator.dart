import 'package:flutter_movies_app/Movies/Data/DataSource/movie_remote_data_source.dart';
import 'package:flutter_movies_app/Movies/Data/Repository/movie_repository.dart';
import 'package:flutter_movies_app/Movies/Domain/Repository/base_movie_repository.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_details_move_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_now_playing_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_popular_movies_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_recommendation_usecase.dart';
import 'package:flutter_movies_app/Movies/Domain/UseCase/get_top_rated_movies_usecase.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_bloc.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_details_bloc.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/prov_state.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MovieBloc( sl() , sl() , sl() ));
    sl.registerFactory(() => MovieDetailsBloc( sl() , sl() ));



    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));


    /// DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}