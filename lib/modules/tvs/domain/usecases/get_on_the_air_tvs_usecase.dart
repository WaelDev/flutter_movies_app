import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/failures.dart';
import 'package:movies_app/modules/tvs/domain/entities/tv.dart';
import 'package:movies_app/modules/tvs/domain/repositories/tvs_repository.dart';

class GetOnTheAirTvsUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  final TvsRepository repository;

  GetOnTheAirTvsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await repository.getOnTheAirTvs();
  }
}
