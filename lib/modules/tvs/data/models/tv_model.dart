import '../../domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    required int id,
    required String title,
    required String backdropPath,
    required List<int> genreIds,
    required String overview,
    required double voteAverage,
    required String releaseDate,
    required String posterPath,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          genreIds: genreIds,
          overview: overview,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          posterPath: posterPath,
        );

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json['id'],
      title: json['name'],
      backdropPath: json['backdrop_path'] ?? '/3myU9OTSvAXxFVYBDUDs9zDFF4P.jpg',
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['first_air_date'],
      posterPath: json['poster_path'],
    );
  }
}
