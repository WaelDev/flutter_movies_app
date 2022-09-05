import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/failures.dart';
import 'package:movies_app/modules/tvs/domain/entities/tv_details.dart';
import 'package:movies_app/modules/tvs/domain/repositories/tvs_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails, int> {
  final TvsRepository repository;

  GetTvDetailsUseCase({required this.repository});
  @override
  Future<Either<Failure, TvDetails>> call(int parameters) async {
    return await repository.getTvDetails(parameters);
  }
}
