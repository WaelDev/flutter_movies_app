import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/modules/tvs/presentation/bloc/tvs/tvs_bloc.dart';
import 'package:movies_app/modules/tvs/presentation/bloc/tvs/tvs_states.dart';
import '../../../../core/utils/enum.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/string.dart';
import '../screens/see_more_screen.dart';
import '../screens/tv_details_screen.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsState>(
      buildWhen: (previous, current) =>
          previous.topRatedTvsState != current.topRatedTvsState,
      builder: (context, state) {
        print('BlocBuilder topRatedComonent');
        switch (state.topRatedTvsState) {
          case RequestState.loading:
            return const SizedBox(height: 170);
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      16.0,
                      24.0,
                      16.0,
                      8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.topRated,
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeeMoreScreen(
                                  title: 'Top Rated',
                                  tvs: state.topRatedTvs,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  AppString.seeMore,
                                  style: TextStyle(),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 170.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        final movie = state.topRatedTvs[index];
                        return Container(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TvDetailsScreen(tvId: movie.id)),
                              );
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: CachedNetworkImage(
                                width: 120.0,
                                fit: BoxFit.cover,
                                imageUrl:
                                    AppConstants.imageUrl(movie.posterPath),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
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
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          case RequestState.error:
            return Text(state.topRatedTvsMessage);
        }
      },
    );
  }
}
