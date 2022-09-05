import 'package:dartz/dartz.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/failures.dart';
import '../entities/movies.dart';
import '../repositories/movies_repository.dart';

class GetPopularMoviesUseCase
    implements BaseUseCase<List<Movie>, NoParameters> {
  final MoviesRepository repository;

  GetPopularMoviesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await repository.getPopularMovies();
  }
}
