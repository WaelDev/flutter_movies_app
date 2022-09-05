import 'package:movies_app/modules/tvs/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required int id,
    required String name,
    required String airDate,
    required String overview,
    required String stillPath,
  }) : super(
          id: id,
          name: name,
          airDate: airDate,
          overview: overview,
          stillPath: stillPath,
        );
  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      overview: json['overview'],
      stillPath: json['still_path'] ?? '/3myU9OTSvAXxFVYBDUDs9zDFF4P.jpg',
    );
  }
}
