import 'package:dartz/dartz.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/failures.dart';
import '../entities/movies.dart';
import '../repositories/movies_repository.dart';

class GetTopRatedMoviesUseCase
    implements BaseUseCase<List<Movie>, NoParameters> {
  final MoviesRepository repository;

  GetTopRatedMoviesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await repository.getTopRelatedMovies();
  }
}
