import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/core/utils/exceptions.dart';
import 'package:movies_app/modules/tvs/data/models/episode_model.dart';
import 'package:movies_app/modules/tvs/data/models/tv_model.dart';

import '../models/recommendation_model.dart';
import '../models/tv_details_model.dart';

abstract class TvsRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();
  Future<List<TvModel>> getPopularTvs();
  Future<List<TvModel>> getTopRatedTvs();
  Future<TvDetailsModel> getTvDetails(int id);
  Future<List<TvRecommendationModel>> getTvRecommendation(int tvId);
  Future<List<EpisodeModel>> getTvEpisodes(
      {required int tvId, required int season});
}

class TvsRemoteDataSourceImpl implements TvsRemoteDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTvs() async {
    final response = await Dio().get(AppConstants.onTheAirTvsPath);
    if (response.statusCode == 200) {
      final tvs = List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
      return tvs;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<TvModel>> getPopularTvs() async {
    final response = await Dio().get(AppConstants.popularTvsPath);
    if (response.statusCode == 200) {
      final tvs = List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
      return tvs;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvs() async {
    final response = await Dio().get(AppConstants.topRatedTvsPath);
    if (response.statusCode == 200) {
      final tvs = List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
      return tvs;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(int id) async {
    final response = await Dio().get(AppConstants.tvDetailsUrl(id));
    if (response.statusCode == 200) {
      final tvDetails = TvDetailsModel.fromJson(response.data);
      return tvDetails;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<TvRecommendationModel>> getTvRecommendation(int tvId) async {
    final response = await Dio().get(AppConstants.tvRecommendationUrl(tvId));
    if (response.statusCode == 200) {
      final recommendations = List<TvRecommendationModel>.from(
          (response.data['results'] as List).map<TvRecommendationModel>(
              (e) => TvRecommendationModel.fromJson(e)));
      return recommendations;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<EpisodeModel>> getTvEpisodes(
      {required int tvId, required int season}) async {
    final response =
        await Dio().get(AppConstants.tvEpisodesUrl(tvId: tvId, season: season));
    if (response.statusCode == 200) {
      final episodes = List<EpisodeModel>.from(
          (response.data['episodes'] as List)
              .map((e) => EpisodeModel.fromJson(e)));
      return episodes;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}
