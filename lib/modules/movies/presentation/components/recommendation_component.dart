import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/string.dart';
import '../bloc/movie_details_bloc.dart';
import '../bloc/movie_details_state.dart';

class RecommendationComponent extends StatelessWidget {
  const RecommendationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
      switch (state.recommendationState) {
        case RequestState.loaded:
          return _buildGrid(state, context);
        case RequestState.loading:
          return const SizedBox();
        case RequestState.error:
          return const SizedBox();
      }
    });
  }

  Widget _buildGrid(MovieDetailsState state, BuildContext context) {
    return FadeInUp(
      from: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              AppString.moreLikeThis.toUpperCase(),
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemCount: state.recommendation.length,
            itemBuilder: (contex, index) => FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MovieDetailScreen(
                              id: state.recommendation[index].id)));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.imageUrl(
                        state.recommendation[index].posterPath!),
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
                        const Icon(Icons.error),
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
