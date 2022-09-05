import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';

import '../../../domain/entities/tv.dart';

class TvsState extends Equatable {
  final RequestState onTheAirTvsState;
  final List<Tv> onTheAirTvs;
  final String onTheAirTvsMessage;

  final RequestState popularTvsState;
  final List<Tv> popularTvs;
  final String popularTvsMessage;

  final RequestState topRatedTvsState;
  final List<Tv> topRatedTvs;
  final String topRatedTvsMessage;

  const TvsState({
    this.onTheAirTvsState = RequestState.loading,
    this.onTheAirTvs = const [],
    this.onTheAirTvsMessage = '',
    this.popularTvsState = RequestState.loading,
    this.popularTvs = const [],
    this.popularTvsMessage = '',
    this.topRatedTvsState = RequestState.loading,
    this.topRatedTvs = const [],
    this.topRatedTvsMessage = '',
  });

  TvsState copyWith({
    RequestState? onTheAirTvsState,
    List<Tv>? onTheAirTvs,
    String? onTheAirTvsMessage,
    RequestState? popularTvsState,
    List<Tv>? popularTvs,
    String? popularTvsMessage,
    RequestState? topRatedTvsState,
    List<Tv>? topRatedTvs,
    String? topRatedTvsMessage,
  }) {
    return TvsState(
      onTheAirTvsState: onTheAirTvsState ?? this.onTheAirTvsState,
      onTheAirTvs: onTheAirTvs ?? this.onTheAirTvs,
      onTheAirTvsMessage: onTheAirTvsMessage ?? this.onTheAirTvsMessage,
      popularTvsState: popularTvsState ?? this.popularTvsState,
      popularTvs: popularTvs ?? this.popularTvs,
      popularTvsMessage: popularTvsMessage ?? this.popularTvsMessage,
      topRatedTvsState: topRatedTvsState ?? this.topRatedTvsState,
      topRatedTvs: topRatedTvs ?? this.topRatedTvs,
      topRatedTvsMessage: topRatedTvsMessage ?? this.topRatedTvsMessage,
    );
  }

  @override
  List<Object?> get props => [
        onTheAirTvsState,
        onTheAirTvs,
        onTheAirTvsMessage,
        popularTvsState,
        popularTvs,
        popularTvsMessage,
        topRatedTvsState,
        topRatedTvs,
        topRatedTvsMessage,
      ];
}
