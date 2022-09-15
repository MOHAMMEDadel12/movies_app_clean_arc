import 'package:movies_app_clean_arc/tvs/domin/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      title: json["title"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"],);
  }
}
