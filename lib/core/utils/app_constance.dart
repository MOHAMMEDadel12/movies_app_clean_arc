class AppConstance {

  static const String apikey = "c045e68535431509f22662632f710296";
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apikey";
  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apikey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apikey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String imageName){
    return "$baseImageUrl$imageName";
  }


}