import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:netflix_clone_ui/models/popular_movie.dart';

class PopularMovies {
    PopularMovies({
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,
    });

    final int page;
    final List<PopularMovie> results;
    final int totalPages;
    final int totalResults;


  PopularMovies copyWith({
    int? page,
    List<PopularMovie>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return PopularMovies(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

  factory PopularMovies.fromMap(Map<String, dynamic> map) {
    return PopularMovies(
      page: map['page']?.toInt() ?? 0,
      results: List<PopularMovie>.from(map['results']?.map((x) => PopularMovie.fromMap(x))),
      totalPages: map['totalPages']?.toInt() ?? 0,
      totalResults: map['totalResults']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PopularMovies.fromJson(String source) => PopularMovies.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PopularMovies(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PopularMovies &&
      other.page == page &&
      listEquals(other.results, results) &&
      other.totalPages == totalPages &&
      other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
      results.hashCode ^
      totalPages.hashCode ^
      totalResults.hashCode;
  }
}
