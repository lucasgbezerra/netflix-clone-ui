import 'package:dio/dio.dart';

import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/models/cast.dart';
import 'package:netflix_clone_ui/models/genre.dart';
import 'package:netflix_clone_ui/models/movie.dart';
import 'package:netflix_clone_ui/models/movie_detail.dart';
import 'package:netflix_clone_ui/models/season.dart';
import 'package:netflix_clone_ui/models/tvshow.dart';
import 'package:netflix_clone_ui/models/tvshow_detail.dart';

class VideoRepository {
  final Dio _dio = Dio(dioOptions);
  final String filter = 'with_watch_providers=8&watch_region=US&language=en-US';

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
      final genresJson = response.data['genres'] as List;
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
      final responseCredits = await _dio.get('/movie/$id/credits?&language=en-US');
      MovieDetail movie = MovieDetail.fromMap(response.data);
      
      final castJson = responseCredits.data['cast'] as List;
      final crewJson = responseCredits.data['crew'] as List;
      movie = movie.copyWith(cast: castJson.map((map) => Cast.fromMap(map)).toList());
      movie = movie.copyWith(crew: crewJson.map((map) => Cast.fromMap(map)).toList()) ;
      
      return movie;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<TvshowDetail> getTvshowDetail(int id) async {
    try {
      final response = await _dio
          .get('/tv/$id?language=en-US&append_to_response=content_ratings,credits');
      final responseCredits = await _dio.get('/tv/$id/credits?&language=en-US');

      final map = response.data['content_ratings']['results']
          .firstWhere((e) => e['iso_3166_1'] == "US");
      response.data['content_ratings'] = map['rating'];
      
      TvshowDetail tvshow = TvshowDetail.fromMap(response.data);

      final castJson = responseCredits.data['cast'] as List;
      final createdByJson = response.data['created_by'] as List;
      tvshow = tvshow.copyWith(cast: castJson.map((map) => Cast.fromMap(map)).toList());
      tvshow = tvshow.copyWith(createdBy: createdByJson.map((map) => Cast.fromMap(map)).toList()) ;

      return tvshow;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<Season> getTvshowSeason(int idTvshow, int numberOfSeason) async {
    try {
      final response =
          await _dio.get('/tv/$idTvshow/season/$numberOfSeason?language=en-US');

      final season = Season.fromMap(response.data);
      return season;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List<Map<String, dynamic>>> getTvshowSimilar(int idTvshow) async {
    try {
      final response = await _dio.get('/tv/$idTvshow/similar?$filter&page=1');

      List<Map<String, dynamic>> moreLikeThis = [];
      response.data['results'].forEach((e) {
        moreLikeThis.add({'id': e['id'], 'posterPath': e['poster_path']});
      });

      return moreLikeThis;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List<Map<String, dynamic>>> getMovieSimilar(int idMovie) async {
    try {
      final response = await _dio.get('/movie/$idMovie/similar?$filter&page=1');

      List<Map<String, dynamic>> moreLikeThis = [];
      response.data['results'].forEach((e) {
        moreLikeThis.add({'id': e['id'], 'posterPath': e['poster_path']});
      });

      return moreLikeThis;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List<Genre>> getTvshowGenres() async {
    try {
      final response = await _dio.get('/genre/tv/list?language=en-US');

      final genresJson = response.data['genres'] as List;
      List<Genre> genres = genresJson.map((map) => Genre.fromMap(map)).toList();
      return genres;
    } on DioError catch (error) {
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<MovieDetail> getMovieBanner()async{
    try{
      final response = await _dio.get('/discover/movie?$filter&sort_by=popularity.desc');
      final id = response.data['results'][0]['id'];
       return await getMovieDetail(id);
    }on DioError catch (error){
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List> getSearchVideos(String search, int page)async{
    try{
      final response = await _dio.get('/search/multi?query=$search&$filter&page=$page&include_adult=true');
      final videoJson = response.data['results'] as List;
       List videos =
          videoJson.map((map) {
            if(map['media_type'] == 'tv'){
              return Tvshow.fromMap(map);
            }else{
              return Movie.fromMap(map);
            }
          }).toList();
      return videos;
    }on DioError catch (error){
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }

  Future<List> getTrendingVideos({int page = 1})async{
    try{
      final response = await _dio.get('/trending/all/week?$filter&page=$page');
      final videoJson = response.data['results'] as List;
      List videos =
          videoJson.map((map) {
            if(map['media_type'] == 'tv'){
              return Tvshow.fromMap(map);
            }else{
              return Movie.fromMap(map);
            }
          }).toList();
      return videos;
    }on DioError catch (error){
      throw Exception(
          "An error has occurred. Status code: ${error.response!.statusCode}");
    }
  }
}
