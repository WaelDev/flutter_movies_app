import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures.dart';
import '../entities/movie_details.dart';
import '../entities/movies.dart';
import '../entities/recommendation.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRelatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(int movieId);
}
