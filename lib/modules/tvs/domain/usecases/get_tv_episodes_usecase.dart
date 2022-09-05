import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures.dart';
import '../entities/episode.dart';
import '../repositories/tvs_repository.dart';

class GetTvEpisodesUseCase {
  final TvsRepository repository;

  GetTvEpisodesUseCase({required this.repository});

  Future<Either<Failure, List<Episode>>> call(
      {required int tvId, required int season}) async {
    return await repository.getTvEpisodes(tvId: tvId, season: season);
  }
}
