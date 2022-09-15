import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arc/tvs/domin/entities/movie.dart';

import '../../../core/error/faliure.dart';

abstract class BaseMoviesRepository {

   Future<Either<Failure, List<Movie>>> getNowPlaying();
   Future<Either<Failure, List<Movie>>> getPopularMovies();
   Future<Either<Failure, List<Movie>>> getTopRatedMovies();

}