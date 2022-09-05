import 'package:equatable/equatable.dart';

import 'genre.dart';

class TvDetails extends Equatable {
  final String backdropPath;
  final List<Genre> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int episodeRunTime;
  final String title;
  final double voteAverage;
  final int numberOfSeasons;

  const TvDetails({
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.episodeRunTime,
    required this.title,
    required this.voteAverage,
    required this.numberOfSeasons,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        episodeRunTime,
        title,
        voteAverage,
        genres,
        numberOfSeasons,
      ];
}
