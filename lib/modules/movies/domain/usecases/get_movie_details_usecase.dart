import 'package:dartz/dartz.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/failures.dart';
import '../entities/movie_details.dart';
import '../repositories/movies_repository.dart';

class GetMovieDetailsUseCase implements BaseUseCase<MovieDetails, int> {
  final MoviesRepository repository;

  GetMovieDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, MovieDetails>> call(int movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
