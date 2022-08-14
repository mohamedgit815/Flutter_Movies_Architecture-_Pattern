class AppConstance {

  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String appKey = 'c3435cfe40aeb079689227d82bf921d3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => "$baseImageUrl$path" ;

}