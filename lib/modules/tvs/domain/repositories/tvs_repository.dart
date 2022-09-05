import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/tvs/domain/entities/episode.dart';

import '../../../../core/utils/failures.dart';
import '../entities/recommendation.dart';
import '../entities/tv.dart';
import '../entities/tv_details.dart';

abstract class TvsRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAirTvs();

  Future<Either<Failure, List<Tv>>> getPopularTvs();

  Future<Either<Failure, List<Tv>>> getTopRatedTvs();

  Future<Either<Failure, TvDetails>> getTvDetails(int tvId);

  Future<Either<Failure, List<TvRecommendation>>> getTvRecommendation(int tvId);

  Future<Either<Failure, List<Episode>>> getTvEpisodes(
      {required int tvId, required int season});
}
