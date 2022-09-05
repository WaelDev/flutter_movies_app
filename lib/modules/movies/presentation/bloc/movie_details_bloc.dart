import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommandation_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommandationUseCase getRecommandationUseCase;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getRecommandationUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);

    on<GetRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(event.id);
    result.fold((failure) {
      emit(state.copyWith(
        movieDetailsMessage: failure.message,
        moviesDetailsState: RequestState.error,
      ));
    }, (detail) {
      emit(state.copyWith(
        movieDetails: detail,
        moviesDetailsState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getRecommendation(
      GetRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommandationUseCase(event.id);
    result.fold((failure) {
      emit(state.copyWith(
        recommendationMessage: failure.message,
        recommendationState: RequestState.error,
      ));
    }, (recommendation) {
      emit(state.copyWith(
        recommendationState: RequestState.loaded,
        recommendation: recommendation,
      ));
    });
  }
}
