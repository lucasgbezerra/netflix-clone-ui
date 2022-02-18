import 'package:dio/dio.dart';
import 'api.dart';

const baseUrl = 'https://api.themoviedb.org/3';
const imageBaseUrl = 'https://image.tmdb.org/t/p';
const medImageSize = '/w500';
const minImageSize = '/w220_and_h330_face';
const originalImageSize = '/original';
const serverError = 'Failed to connect to the server. Try again Later';

final dioOptions = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  headers: {'Authorization': 'Bearer $apiKey'}
);