import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arc/core/error/exceptions.dart';
import 'package:movies_app_clean_arc/core/error/faliure.dart';
import 'package:movies_app_clean_arc/tvs/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app_clean_arc/tvs/domin/entities/movie.dart';
import 'package:movies_app_clean_arc/tvs/domin/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
     return Right(result);
    } on ServerException catch (failure) {
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies()  async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }  }
}
