import 'package:dartz/dartz.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/failures.dart';
import '../entities/recommendation.dart';
import '../repositories/tvs_repository.dart';

class GetTvRecommandationUseCase
    implements BaseUseCase<List<TvRecommendation>, int> {
  final TvsRepository repository;

  GetTvRecommandationUseCase({required this.repository});

  @override
  Future<Either<Failure, List<TvRecommendation>>> call(int tvId) async {
    return await repository.getTvRecommendation(tvId);
  }
}
