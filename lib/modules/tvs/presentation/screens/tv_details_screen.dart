import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/modules/tvs/presentation/components/season_drop_down_component.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/string.dart';
import '../bloc/tv_details/tv_details_bloc.dart';
import '../bloc/tv_details/tv_details_event.dart';
import '../bloc/tv_details/tv_details_state.dart';
import '../components/tv_detail_component.dart';

class TvDetailsScreen extends StatelessWidget {
  final int tvId;
  const TvDetailsScreen({Key? key, required this.tvId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvDetailsBloc>()
        ..add(GetTvDetailsEvent(tvId: tvId))
        ..add(GetTvRecommendationEvent(tvId: tvId))
        ..add(GetTvEpisodesEvent(
            tvId: tvId, season: 1)), // TODO: fetch for any season
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 500,
                  child: TvDetailsComponent(),
                ),
                const SizedBox(height: 20),
                _buildTabBar(),
                const SizedBox(height: 10),
                // TODO: make it Responsive
                BlocBuilder<TvDetailsBloc, TvDetailsState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: state.tvEpisodes.length * 150 + 65,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildEpisodesTab(context, state),
                          _buildRecommendationTab(context, state),
                        ],
                      ),
                    );
                  },
                ),
                // TvRecommendationComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      indicatorWeight: 4,
      indicatorColor: Colors.orange,
      labelColor: Colors.red,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.orange, width: 4.0),
        insets: EdgeInsets.fromLTRB(0, 0, 0, 60),
      ),
      tabs: [
        Tab(
          child: Text(
            'Episodes'.toUpperCase(),
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              color: Colors.grey,
            ),
          ),
        ),
        Tab(
          child: Text(
            AppString.moreLikeThis.toUpperCase(),
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationTab(BuildContext context, TvDetailsState state) {
    return GridView.builder(
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
      itemCount: state.tvRecommendation.length,
      itemBuilder: (contex, index) => FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => TvDetailsScreen(
                        tvId: state.tvRecommendation[index].id)));
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: CachedNetworkImage(
              imageUrl: AppConstants.imageUrl(
                  state.tvRecommendation[index].posterPath!),
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 180.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEpisodesTab(BuildContext context, TvDetailsState state) {
    if (state.tvEpisodesState == RequestState.loaded) {
      return CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
              child: SeasonDropDownComponent(
                  numberOfSeason: state.tvDetails!.numberOfSeasons)),
          SliverToBoxAdapter(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl: AppConstants.imageUrl(
                                  state.tvEpisodes[index].stillPath),
                              placeholder: (context, url) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 70.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              height: 70.0,
                              width: 120.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${index + 1}. ${state.tvEpisodes[index].name}',
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    )),
                                const SizedBox(height: 3),
                                Text(state.tvEpisodes[index].airDate,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(state.tvEpisodes[index].overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, int _) {
                return const SizedBox(height: 20);
              },
              itemCount: state.tvEpisodes.length,
            ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
