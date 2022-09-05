import '../../domain/entities/genre.dart';
import '../../domain/entities/movie_details.dart';
import 'genre_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required String backdropPath,
    required int id,
    required List<Genre> genres,
    required String overview,
    required String releaseDate,
    required int runtime,
    required String title,
    required double voteAverage,
  }) : super(
            backdropPath: backdropPath,
            id: id,
            genres: genres,
            overview: overview,
            releaseDate: releaseDate,
            runtime: runtime,
            title: title,
            voteAverage: voteAverage);

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      // TODO: Check this 'default image'
      backdropPath: json['backdrop_path'] ?? '/3myU9OTSvAXxFVYBDUDs9zDFF4P.jpg',
      id: json['id'],
      genres: List<GenreModel>.from((json['genres'] as List)
          .map<GenreModel>((e) => GenreModel.fromJson(e))),
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
