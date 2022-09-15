import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arc/tvs/domin/entities/movie.dart';
import 'package:movies_app_clean_arc/tvs/domin/repository/base_movies_repository.dart';

import '../../../core/error/faliure.dart';

class GetNowPlayingMoviesUseCase{

final  BaseMoviesRepository baseMoviesRepository ;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

Future<Either<Failure, List<Movie>>> execute() async{
    return await baseMoviesRepository.getNowPlaying();
  }


}