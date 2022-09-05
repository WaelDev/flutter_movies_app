import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/tvs/domain/entities/episode.dart';

import '../../../../core/utils/exceptions.dart';
import '../../../../core/utils/failures.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/entities/tv_details.dart';
import '../../domain/entities/tv.dart';
import '../../domain/repositories/tvs_repository.dart';
import '../datasources/tvs_remote_data_source.dart';

class TvsRepositoryImpl implements TvsRepository {
  final TvsRemoteDataSource remoteDataSource;

  TvsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Tv>>> getOnTheAirTvs() async {
    try {
      final result = await remoteDataSource.getOnTheAirTvs();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTvs() async {
    try {
      final result = await remoteDataSource.getPopularTvs();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTvs() async {
    try {
      final result = await remoteDataSource.getTopRatedTvs();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(int tvId) async {
    try {
      final result = await remoteDataSource.getTvDetails(tvId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendation>>> getTvRecommendation(
      int tvId) async {
    try {
      final result = await remoteDataSource.getTvRecommendation(tvId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Episode>>> getTvEpisodes(
      {required int tvId, required int season}) async {
    try {
      final result =
          await remoteDataSource.getTvEpisodes(tvId: tvId, season: season);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
