import 'package:dio/dio.dart';

import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/models/genres.dart';
import 'package:netflix_clone_ui/models/popular_movies.dart';
import 'package:netflix_clone_ui/models/popular_tvshows.dart';

class VideoRepository {
  final Dio _dio = Dio(dioOptions);
  final String filter = 'language=en-US&with_watch_providers=8&watch_region=US';

  Future<PopularMovies?> getPopularMovies(int page) async {
    PopularMovies? model;
    try {
      final response = await _dio.get('/movie/popular?$filter&page=$page');
      model = PopularMovies.fromMap(response.data);
    } on DioError catch (error) {
      if (error.response != null) {
        print(
            "An error has occurred. Status code: ${error.response!.statusCode}");
      } else {
        print(serverError);
      }
    }
    return model;
  }

  Future<PopularTvshows?> getPopularTvShows(int page) async {
    PopularTvshows? model;
    try {
      final response = await _dio.get('/tv/popular?$filter&page=$page');
      model = PopularTvshows.fromMap(response.data);
    } on DioError catch (error) {
      if (error.response != null) {
        print(
            "An error has occurred. Status code: ${error.response!.statusCode}");
      } else {
        print(serverError);
      }
    }
    return model;
  }

  Future<PopularMovies?> getPopularMovieGenre(String genre) async {
    PopularMovies? model;
    try {
      final genres = await getGenre();
      if (genres != null) {
        int id = genres.indexWhere((g) => g.name.toLowerCase() == genre.toLowerCase());
        final response = await _dio.get(
            '/discover/movie?$filter&with_genres=${genres[id]}&sort_by=vote_average.desc&vote_count.gte=10');
        model = PopularMovies.fromMap(response.data);
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print(
            "An error has occurred. Status code: ${error.response!.statusCode}");
      } else {
        print(serverError);
      }
    }
    return model;
  }

  Future<List<Genre>>? getGenre() async {
    List<Genre> list_model = [];

    try {
      final response = await _dio.get('/genre/movie/list?language=en-US');
      for (var genre in response.data['genres']) {
        list_model.add(Genre.fromMap(genre));
      }
      // model = List<Genre>.fromMap(response.data);
    } on DioError catch (error) {
      if (error.response != null) {
        print(
            "An error has occurred. Status code: ${error.response!.statusCode}");
      } else {
        print(serverError);
      }
    }
    return list_model;
  }
}
