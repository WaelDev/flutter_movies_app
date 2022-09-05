import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/enum.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_events.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc({
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
  }) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        nowPlayingMoviesMessage: failure.message,
        nowPlayingMoviesState: RequestState.error,
      ));
    }, (movies) {
      emit(state.copyWith(
        nowPlayingMovies: movies,
        nowPlayingMoviesState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        popularMoviesMessage: failure.message,
        popularMoviesState: RequestState.error,
      ));
    }, (movies) {
      emit(state.copyWith(
        popularMovies: movies,
        popularMoviesState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        topRatedMoviesMessage: failure.message,
        topRatedMoviesState: RequestState.error,
      ));
    }, (movies) {
      emit(state.copyWith(
        topRatedMovies: movies,
        topRatedMoviesState: RequestState.loaded,
      ));
    });
  }
}
