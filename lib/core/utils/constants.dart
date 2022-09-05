class AppConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // Get your Personal Api Key from TMDB
  static const String apiKey = '9a3bfc2dab117fe0b555c41a13ad5c92';

  // Movies url
  static const String nowPlayingPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String imageMoviePath = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String backdropPath) =>
      '$imageMoviePath/$backdropPath';

  static String movieDetailsUrl(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationUrl(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  // Tvs url
  static const String onTheAirTvsPath =
      '$baseUrl/tv/on_the_air?api_key=$apiKey';

  static const String popularTvsPath = '$baseUrl/tv/popular?api_key=$apiKey';

  static const String topRatedTvsPath = '$baseUrl/tv/top_rated?api_key=$apiKey';

  static String tvDetailsUrl(int tvId) => '$baseUrl/tv/$tvId?api_key=$apiKey';

  static String tvRecommendationUrl(int tvId) =>
      '$baseUrl/tv/$tvId/recommendations?api_key=$apiKey';

  static String tvEpisodesUrl({required int tvId, required int season}) =>
      '$baseUrl/tv/$tvId/season/$season?api_key=$apiKey';
}
