import 'package:equatable/equatable.dart';

import '../../../../core/utils/enum.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState moviesDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final String recommendationMessage;
  final RequestState recommendationState;

  const MovieDetailsState({
    this.movieDetails,
    this.moviesDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationMessage = '',
    this.recommendationState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? moviesDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    String? recommendationMessage,
    RequestState? recommendationState,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        moviesDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationMessage,
        recommendationState,
      ];
}
