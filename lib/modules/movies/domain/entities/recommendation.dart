import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final int id;
  final String? posterPath;

  const Recommendation({required this.id, this.posterPath});

  @override
  List<Object?> get props => [id, posterPath];
}
