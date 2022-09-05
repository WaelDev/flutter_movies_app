import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/modules/tvs/domain/entities/episode.dart';

import '../../../domain/entities/recommendation.dart';
import '../../../domain/entities/tv_details.dart';

class TvDetailsState extends Equatable {
  final RequestState tvDetailsState;
  final TvDetails? tvDetails;
  final String tvDetailsMessage;

  final RequestState tvRecommendationState;
  final List<TvRecommendation> tvRecommendation;
  final String tvRecommendationMessage;

  final RequestState tvEpisodesState;
  final List<Episode> tvEpisodes;
  final String tvEpisodesMessage;

  const TvDetailsState({
    this.tvDetailsState = RequestState.loading,
    this.tvDetails,
    this.tvDetailsMessage = '',
    this.tvRecommendationState = RequestState.loading,
    this.tvRecommendation = const [],
    this.tvRecommendationMessage = '',
    this.tvEpisodesState = RequestState.loading,
    this.tvEpisodes = const [],
    this.tvEpisodesMessage = '',
  });

  @override
  List<Object?> get props => [
        tvDetails,
        tvDetailsState,
        tvDetailsMessage,
        tvRecommendationState,
        tvRecommendation,
        tvRecommendationMessage,
        tvEpisodesState,
        tvEpisodes,
        tvEpisodesMessage,
      ];

  TvDetailsState copyWith({
    TvDetails? tvDetails,
    RequestState? tvDetailsState,
    String? tvDetailsMessage,
    RequestState? tvRecommendationState,
    String? tvRecommendationMessage,
    List<TvRecommendation>? tvRecommendation,
    RequestState? tvEpisodesState,
    String? tvEpisodesMessage,
    List<Episode>? tvEpisodes,
  }) {
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      tvRecommendationState:
          tvRecommendationState ?? this.tvRecommendationState,
      tvRecommendationMessage:
          tvRecommendationMessage ?? this.tvRecommendationMessage,
      tvRecommendation: tvRecommendation ?? this.tvRecommendation,
      tvEpisodesState: tvEpisodesState ?? this.tvDetailsState,
      tvEpisodes: tvEpisodes ?? this.tvEpisodes,
      tvEpisodesMessage: tvEpisodesMessage ?? this.tvEpisodesMessage,
    );
  }
}
