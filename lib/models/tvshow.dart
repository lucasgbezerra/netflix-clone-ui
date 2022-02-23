import 'dart:convert';

import 'package:flutter/foundation.dart';

class Tvshow {
  final String backdropPath;
  final DateTime firstAirDate;
  final List<int> genreIds;
  final int id;
  final String title;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  Tvshow({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  Tvshow copyWith({
    String? backdropPath,
    DateTime? firstAirDate,
    List<int>? genreIds,
    int? id,
    String? title,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
  }) {
    return Tvshow(
      backdropPath: backdropPath ?? this.backdropPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      title: title ?? this.title,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backdropPath': backdropPath,
      'firstAirDate': firstAirDate.millisecondsSinceEpoch,
      'genreIds': genreIds,
      'id': id,
      'title': title,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory Tvshow.fromMap(Map<String, dynamic> map) {
    return Tvshow(
      backdropPath: map['backdrop_path'] ?? '',
      firstAirDate: DateTime.parse(map['first_air_date']),
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id']?.toInt() ?? 0,
      title: map['name'] ?? '',
      originCountry: List<String>.from(map['origin_country']),
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_name'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tvshow.fromJson(String source) => Tvshow.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tvshow(backdropPath: $backdropPath, firstAirDate: $firstAirDate, genreIds: $genreIds, id: $id, title: $title, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tvshow &&
      other.backdropPath == backdropPath &&
      other.firstAirDate == firstAirDate &&
      listEquals(other.genreIds, genreIds) &&
      other.id == id &&
      other.title == title &&
      listEquals(other.originCountry, originCountry) &&
      other.originalLanguage == originalLanguage &&
      other.originalTitle == originalTitle &&
      other.overview == overview &&
      other.popularity == popularity &&
      other.posterPath == posterPath &&
      other.voteAverage == voteAverage &&
      other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return backdropPath.hashCode ^
      firstAirDate.hashCode ^
      genreIds.hashCode ^
      id.hashCode ^
      title.hashCode ^
      originCountry.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;
  }
}
