import '../../domain/entities/movies.dart';

class MovieModel extends Movie {
  const MovieModel({
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

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
