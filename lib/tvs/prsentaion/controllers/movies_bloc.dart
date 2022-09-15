import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arc/core/utils/enums.dart';
import 'package:movies_app_clean_arc/tvs/domin/usecses/get_popular_movies_usecase.dart';
import 'package:movies_app_clean_arc/tvs/domin/usecses/get_top_rated_movies_usecase.dart';
import 'package:movies_app_clean_arc/tvs/prsentaion/controllers/movies_event.dart';

import '../../../core/services/services_locator.dart';
import '../../data/datasource/movie_remote_datasource.dart';
import '../../data/repository/movies_repository.dart';
import '../../domin/repository/base_movies_repository.dart';
import '../../domin/usecses/get_now_playing_movies_usecase.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowplayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowplayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold((l) {
      emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovies: r));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase.execute();
    result.fold((l) {
      emit(state.copyWith(
          popularState: RequestState.loaded, popularMessage: l.message));
    }, (r) {
      emit(state.copyWith(popularState: RequestState.loaded, popularMovies: r));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase.execute();
    result.fold((l) {
      emit(state.copyWith(
          topRatedState: RequestState.loaded, topRatedMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          topRatedState: RequestState.loaded, topRatedMovies: r));
    });
  }
}
