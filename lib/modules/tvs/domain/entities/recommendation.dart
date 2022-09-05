import 'package:equatable/equatable.dart';

class TvRecommendation extends Equatable {
  final int id;
  final String? posterPath;

  const TvRecommendation({required this.id, this.posterPath});

  @override
  List<Object?> get props => [id, posterPath];
}
