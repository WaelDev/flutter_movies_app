import '../../domain/entities/recommendation.dart';

class TvRecommendationModel extends TvRecommendation {
  const TvRecommendationModel({
    required int id,
    String? posterPath,
  }) : super(
          id: id,
          posterPath: posterPath,
        );

  factory TvRecommendationModel.fromJson(Map<String, dynamic> json) {
    return TvRecommendationModel(
      id: json['id'],
      // TODO: check this
      posterPath: json['poster_path'] ?? '/3myU9OTSvAXxFVYBDUDs9zDFF4P.jpg',
    );
  }
}
