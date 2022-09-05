import 'package:dartz/dartz.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/failures.dart';
import '../entities/recommendation.dart';
import '../repositories/movies_repository.dart';

class GetRecommandationUseCase
    implements BaseUseCase<List<Recommendation>, int> {
  final MoviesRepository repository;

  GetRecommandationUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(int movieId) async {
    return await repository.getRecommendation(movieId);
  }
}
