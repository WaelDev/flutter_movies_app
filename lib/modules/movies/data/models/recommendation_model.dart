import '../../domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required int id,
    String? posterPath,
  }) : super(
          id: id,
          posterPath: posterPath,
        );

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      // TODO: check this
      posterPath: json['poster_path'] ?? '/3myU9OTSvAXxFVYBDUDs9zDFF4P.jpg',
    );
  }
}
