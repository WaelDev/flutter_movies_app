import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:movies_app/modules/tvs/data/datasources/tvs_remote_data_source.dart';
import 'package:movies_app/modules/tvs/data/repositories/tvs_repository_impl.dart';
import 'package:movies_app/modules/tvs/domain/repositories/tvs_repository.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_on_the_air_tvs_usecase.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_tv_episodes_usecase.dart';
import 'package:movies_app/modules/tvs/domain/usecases/get_tv_recommandation_usecase.dart';
import 'package:movies_app/modules/tvs/presentation/bloc/tv_details/tv_details_bloc.dart';
import 'package:movies_app/modules/tvs/presentation/bloc/tvs/tvs_bloc.dart';

import '../../modules/movies/data/datasources/movies_remote_data_source.dart';
import '../../modules/movies/data/repositories/movies_repository_impl.dart';
import '../../modules/movies/domain/repositories/movies_repository.dart';
import '../../modules/movies/domain/usecases/get_movie_details_usecase.dart';
import '../../modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../modules/movies/domain/usecases/get_recommandation_usecase.dart';
import '../../modules/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../modules/movies/presentation/bloc/movie_details_bloc.dart';
import '../../modules/movies/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;

void setup() {
  //* Movies Module *//
  // Bloc
  sl.registerFactory(
    () => MoviesBloc(
      getNowPlayingMoviesUseCase: sl(),
      getPopularMoviesUseCase: sl(),
      getTopRatedMoviesUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => MovieDetailsBloc(
      getMovieDetailsUseCase: sl(),
      getRecommandationUseCase: sl(),
    ),
  );

  sl.registerFactory(() => HomeCubit());

  // Use Cases
  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetPopularMoviesUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetMovieDetailsUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetRecommandationUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(remoteDataSource: sl()));

  // Data source
  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl());

  //* Tvs Module  *//
  // Bloc
  sl.registerFactory(
    () => TvsBloc(
      getOnTheAirTvsUseCase: sl(),
      getPopularTvsUseCase: sl(),
      getTopRatedTvsUsecase: sl(),
    ),
  );

  sl.registerFactory(
    () => TvDetailsBloc(
      getTvDetailsUseCase: sl(),
      getTvRecommandationUseCase: sl(),
      getTvEpisodesUseCase: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => GetOnTheAirTvsUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetPopularTvsUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetTopRatedTvsUsecase(repository: sl()));

  sl.registerLazySingleton(() => GetTvDetailsUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetTvRecommandationUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetTvEpisodesUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<TvsRepository>(
      () => TvsRepositoryImpl(remoteDataSource: sl()));

  // Data source
  sl.registerLazySingleton<TvsRemoteDataSource>(
      () => TvsRemoteDataSourceImpl());
}
