import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_on_the_air_tvs_usecase.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:movies_app/modules/tvs/presentation/bloc/tvs/tvs_events.dart';
import 'package:movies_app/modules/tvs/presentation/bloc/tvs/tvs_states.dart';

import '../../../domain/usecases/get_popular_tvs_usecase.dart';

class TvsBloc extends Bloc<TvsEvent, TvsState> {
  final GetOnTheAirTvsUseCase getOnTheAirTvsUseCase;
  final GetPopularTvsUseCase getPopularTvsUseCase;
  final GetTopRatedTvsUsecase getTopRatedTvsUsecase;

  TvsBloc({
    required this.getOnTheAirTvsUseCase,
    required this.getPopularTvsUseCase,
    required this.getTopRatedTvsUsecase,
  }) : super(const TvsState()) {
    on<GetOnTheAirTvsEvent>(_getOnTheAirTvs);

    on<GetPopularTvsEvent>(_getPopularTvs);

    on<GetTopRatedTvsEvent>(_getTopRatedTvs);
  }

  FutureOr<void> _getTopRatedTvs(event, emit) async {
    final result = await getTopRatedTvsUsecase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        topRatedTvsMessage: failure.message,
        topRatedTvsState: RequestState.error,
      ));
    }, (tvs) {
      emit(state.copyWith(
        topRatedTvs: tvs,
        topRatedTvsState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getPopularTvs(event, emit) async {
    final result = await getPopularTvsUseCase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        popularTvsMessage: failure.message,
        popularTvsState: RequestState.error,
      ));
    }, (tvs) {
      emit(state.copyWith(
        popularTvs: tvs,
        popularTvsState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getOnTheAirTvs(event, emit) async {
    final result = await getOnTheAirTvsUseCase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        onTheAirTvsMessage: failure.message,
        onTheAirTvsState: RequestState.error,
      ));
    }, (tvs) {
      emit(state.copyWith(
          onTheAirTvs: tvs, onTheAirTvsState: RequestState.loaded));
    });
  }
}
