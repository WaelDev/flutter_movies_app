import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_tv_episodes_usecase.dart';
import '../../../../../core/utils/enum.dart';
import '../../../domain/usecases/get_tv_details_usecase.dart';
import '../../../domain/usecases/get_tv_recommandation_usecase.dart';
import 'tv_details_event.dart';
import 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvRecommandationUseCase getTvRecommandationUseCase;
  final GetTvEpisodesUseCase getTvEpisodesUseCase;

  TvDetailsBloc({
    required this.getTvDetailsUseCase,
    required this.getTvRecommandationUseCase,
    required this.getTvEpisodesUseCase,
  }) : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);

    on<GetTvRecommendationEvent>(_getTvRecommendation);

    on<GetTvEpisodesEvent>(_getTvEpisodes);
  }

  FutureOr<void> _getTvDetails(event, emit) async {
    final result = await getTvDetailsUseCase(event.tvId);
    result.fold((failure) {
      emit(state.copyWith(
        tvDetailsState: RequestState.error,
        tvDetailsMessage: failure.message,
      ));
    }, (result) {
      emit(state.copyWith(
        tvDetailsState: RequestState.loaded,
        tvDetails: result,
      ));
    });
  }

  FutureOr<void> _getTvRecommendation(event, emit) async {
    final result = await getTvRecommandationUseCase(event.tvId);
    result.fold((failure) {
      emit(state.copyWith(
        tvRecommendationState: RequestState.error,
        tvRecommendationMessage: failure.message,
      ));
    }, (result) {
      emit(state.copyWith(
        tvRecommendationState: RequestState.loaded,
        tvRecommendation: result,
      ));
    });
  }

  FutureOr<void> _getTvEpisodes(
      GetTvEpisodesEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getTvEpisodesUseCase(tvId: event.tvId, season: event.season);
    result.fold((failure) {
      emit(state.copyWith(
        tvEpisodesState: RequestState.error,
        tvEpisodesMessage: failure.message,
      ));
    }, (episodes) {
      emit(state.copyWith(
        tvEpisodesState: RequestState.loaded,
        tvEpisodes: episodes,
      ));
    });
  }
}
