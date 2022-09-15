import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_arc/tvs/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app_clean_arc/tvs/data/repository/movies_repository.dart';
import 'package:movies_app_clean_arc/tvs/domin/repository/base_movies_repository.dart';
import 'package:movies_app_clean_arc/tvs/domin/usecses/get_now_playing_movies_usecase.dart';
import 'package:movies_app_clean_arc/tvs/domin/usecses/get_popular_movies_usecase.dart';
import 'package:movies_app_clean_arc/tvs/domin/usecses/get_top_rated_movies_usecase.dart';
import 'package:movies_app_clean_arc/tvs/prsentaion/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    /// Bloc
  //  sl.registerLazySingleton(() => MoviesBloc(sl()));


    sl.registerFactory(() => MoviesBloc(sl() , sl() , sl()));
    /// USECASE
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}
