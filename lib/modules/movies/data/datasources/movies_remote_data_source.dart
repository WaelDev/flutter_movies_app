import 'package:dio/dio.dart';
import '../models/movie_details_model.dart';
import '../../domain/entities/movie_details.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/exceptions.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetails> getMovieDetails(int movieId);
  Future<List<RecommendationModel>> getRecommendation(int movieId);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(AppConstants.nowPlayingPath);
    if (response.statusCode == 200) {
      final movies = List<MovieModel>.from((response.data['results'] as List)
          .map<MovieModel>((e) => MovieModel.fromJson(e)));
      return movies;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      final movies = List<MovieModel>.from((response.data['results'] as List)
          .map<MovieModel>((e) => MovieModel.fromJson(e)));
      return movies;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      final movies = List<MovieModel>.from((response.data['results'] as List)
          .map<MovieModel>((e) => MovieModel.fromJson(e)));
      return movies;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await Dio().get(AppConstants.movieDetailsUrl(movieId));
    if (response.statusCode == 200) {
      final movieDetails = MovieDetailsModel.fromJson(response.data);
      return movieDetails;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(int movieId) async {
    final response = await Dio().get(AppConstants.recommendationUrl(movieId));
    if (response.statusCode == 200) {
      final recommendations = List<RecommendationModel>.from(
          (response.data['results'] as List)
              .map((e) => RecommendationModel.fromJson(e)));
      return recommendations;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}
