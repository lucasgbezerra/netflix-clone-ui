import 'package:dio/dio.dart';

import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/models/genre.dart';
import 'package:netflix_clone_ui/models/movie.dart';
import 'package:netflix_clone_ui/models/movie_detail.dart';
import 'package:netflix_clone_ui/models/season.dart';
import 'package:netflix_clone_ui/models/tvshow.dart';
import 'package:netflix_clone_ui/models/tvshow_detail.dart';

class VideoRepository {
  final Dio _dio = Dio(dioOptions);
  final String filter = 'language=en-US&with_watch_providers=8&watch_region=US';

  Future<List<Movie>> getPopularMovies(int page) async {
    try {
      final response = await _dio.get('/movie/popular?$filter&page=$page');
      final moviesJson = response.data['results'] as List;
      List<Movie> movies = moviesJson.map((map) => Movie.fromMap(map)).toList();
      return movies;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List<Tvshow>> getPopularTvShows(int page) async {
    try {
      final response = await _dio.get('/tv/popular?$filter&page=$page');
      final tvShowsJson = response.data['results'] as List;
      List<Tvshow> tvShows =
          tvShowsJson.map((map) => Tvshow.fromMap(map)).toList();
      return tvShows;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List<Movie>> getPopularMovieByGenre(int idGenre) async {
    try {
      final response = await _dio.get(
          '/discover/movie?$filter&with_genres=$idGenre&sort_by=vote_average.desc&vote_count.gte=10');

      final moviesJson = response.data['results'] as List;
      List<Movie> movies = moviesJson.map((map) => Movie.fromMap(map)).toList();
      return movies;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List<Genre>> getGenres() async {
    try {
      final response = await _dio.get('/genre/movie/list?language=en-US');
      final genresJson = response.data['results'] as List;
      List<Genre> genres = genresJson.map((map) => Genre.fromMap(map)).toList();
      return genres;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    try {
      final response = await _dio.get('/movie/$id&language=en-US');
      final movie = MovieDetail.fromMap(response.data);
      return movie;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<TvshowDetail> getTvshowDetail(int id) async {
    try {
      final response = await _dio
          .get('/tv/$id?language=en-US&append_to_response=content_ratings');
      final map = response.data['content_ratings']['results']
          .firstWhere((e) => e['iso_3166_1'] == "US");
      response.data['content_ratings'] = map['rating'];
      final tvshow = TvshowDetail.fromMap(response.data);
      return tvshow;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<Season> getTvshowSeason(int idTvshow, int numberOfSeason) async {
    try {
      final response = await _dio
          .get('/tv/$idTvshow/season/$numberOfSeason?language=en-US');
     
      final season = Season.fromMap(response.data);
      return season;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }
}
