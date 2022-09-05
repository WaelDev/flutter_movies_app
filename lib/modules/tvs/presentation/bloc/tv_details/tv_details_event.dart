import 'package:equatable/equatable.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int tvId;

  const GetTvDetailsEvent({required this.tvId});

  @override
  List<Object?> get props => [tvId];
}

class GetTvRecommendationEvent extends TvDetailsEvent {
  final int tvId;

  const GetTvRecommendationEvent({required this.tvId});

  @override
  List<Object?> get props => [tvId];
}

class GetTvEpisodesEvent extends TvDetailsEvent {
  final int tvId;
  final int season;

  const GetTvEpisodesEvent({required this.tvId, required this.season});

  @override
  List<Object?> get props => [tvId, season];
}
