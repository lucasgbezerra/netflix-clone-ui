import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:netflix_clone_ui/models/popular_tvshow.dart';

class PopularTvshows {
  final int page;
  final List<PopularTvshow> results;
  final int totalPages;
  final int totalResults;
  PopularTvshows({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  PopularTvshows copyWith({
    int? page,
    List<PopularTvshow>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return PopularTvshows(
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

  factory PopularTvshows.fromMap(Map<String, dynamic> map) {
    return PopularTvshows(
      page: map['page']?.toInt() ?? 0,
      results: List<PopularTvshow>.from(map['results']?.map((x) => PopularTvshow.fromMap(x))),
      totalPages: map['totalPages']?.toInt() ?? 0,
      totalResults: map['totalResults']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PopularTvshows.fromJson(String source) => PopularTvshows.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PopularTvshows(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PopularTvshows &&
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
