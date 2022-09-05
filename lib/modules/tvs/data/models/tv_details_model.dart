import '../../domain/entities/genre.dart';
import '../../domain/entities/tv_details.dart';
import 'genre_model.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required String backdropPath,
    required int id,
    required List<Genre> genres,
    required String overview,
    required String releaseDate,
    required int episodeRunTime,
    required String title,
    required double voteAverage,
    required int numberOfSeasons,
  }) : super(
          backdropPath: backdropPath,
          id: id,
          genres: genres,
          overview: overview,
          releaseDate: releaseDate,
          episodeRunTime: episodeRunTime,
          title: title,
          voteAverage: voteAverage,
          numberOfSeasons: numberOfSeasons,
        );

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
      // TODO: check this - build a Default Image -
      backdropPath: json['backdrop_path'] ?? '/3myU9OTSvAXxFVYBDUDs9zDFF4P.jpg',
      id: json['id'],
      genres: List<GenreModel>.from((json['genres'] as List)
          .map<GenreModel>((e) => GenreModel.fromJson(e))),
      overview: json['overview'],
      releaseDate: json['first_air_date'],
      episodeRunTime: json['episode_run_time'][0],
      title: json['name'],
      voteAverage: json['vote_average'].toDouble(),
      numberOfSeasons: json['number_of_seasons'],
    );
  }
}
