import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Movie &&
  //         runtimeType == other.runtimeType &&
  //         backdropPath == other.backdropPath &&
  //         id == other.id &&
  //         title == other.title &&
  //         genreIds == other.genreIds &&
  //         overview == other.overview &&
  //         voteAverage == other.voteAverage;
  //
  // @override
  // int get hashCode =>
  //     backdropPath.hashCode ^
  //     id.hashCode ^
  //     title.hashCode ^
  //     genreIds.hashCode ^
  //     overview.hashCode ^
  //     voteAverage.hashCode;

  @override
  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
    releaseDate ,
      ];
}
