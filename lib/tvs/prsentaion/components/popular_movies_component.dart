import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arc/tvs/prsentaion/controllers/movies_bloc.dart';
import 'package:movies_app_clean_arc/tvs/prsentaion/controllers/movies_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_constance.dart';
import '../../../core/utils/dummy.dart';
import '../../../core/utils/enums.dart';


class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviesBloc , MoviesState>(
      builder: (context, state) {
        switch(state.popularState){

          case RequestState.loading :
            return const SizedBox(
              height:400,
              child: Center(
                child: CircularProgressIndicator(


                ),
              ),
            );
            break;
          case RequestState.loaded:
          // TODO: Handle this case.
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: AppConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
            break;
          case RequestState.error:
          // TODO: Handle this case.
            return Center(child: Text(state.popularMessage));
            break;
        }

      },

    );
  }
}
