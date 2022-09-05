import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final String overview;
  final String stillPath;

  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.overview,
    required this.stillPath,
  });

  @override
  List<Object?> get props => [id, name, airDate, overview, stillPath];
}
