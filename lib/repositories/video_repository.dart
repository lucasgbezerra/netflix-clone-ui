import 'package:dio/dio.dart';


import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/models/popular_movies.dart';

class VideoRepository {
  final Dio _dio = Dio(dioOptions);

  Future<PopularMovies?> getPopularMovies(int page) async {
    PopularMovies? model;
    try {
      final response = await _dio.get('/movie/popular?&language=en-US&page=$page');
      model = PopularMovies.fromMap(response.data);
    } on DioError catch (error) {
      if (error.response != null) {
        print("An error has occurred. Status code: ${error.response!.statusCode}");
      } else {
        print(serverError);
      }
    }
    return model;
  }

}