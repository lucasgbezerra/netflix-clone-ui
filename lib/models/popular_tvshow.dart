import 'dart:convert';

import 'package:flutter/foundation.dart';

class PopularTvshow {
  final String backdropPath;
  final DateTime firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  PopularTvshow({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  PopularTvshow copyWith({
    String? backdropPath,
    DateTime? firstAirDate,
    List<int>? genreIds,
    int? id,
    String? name,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
  }) {
    return PopularTvshow(
      backdropPath: backdropPath ?? this.backdropPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
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
      'name': name,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'originalName': originalName,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory PopularTvshow.fromMap(Map<String, dynamic> map) {
    return PopularTvshow(
      backdropPath: map['backdropPath'] ?? '',
      firstAirDate: DateTime.fromMillisecondsSinceEpoch(map['firstAirDate']),
      genreIds: List<int>.from(map['genreIds']),
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      originCountry: List<String>.from(map['originCountry']),
      originalLanguage: map['originalLanguage'] ?? '',
      originalName: map['originalName'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['posterPath'] ?? '',
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      voteCount: map['voteCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PopularTvshow.fromJson(String source) => PopularTvshow.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PopularTvshow(backdropPath: $backdropPath, firstAirDate: $firstAirDate, genreIds: $genreIds, id: $id, name: $name, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PopularTvshow &&
      other.backdropPath == backdropPath &&
      other.firstAirDate == firstAirDate &&
      listEquals(other.genreIds, genreIds) &&
      other.id == id &&
      other.name == name &&
      listEquals(other.originCountry, originCountry) &&
      other.originalLanguage == originalLanguage &&
      other.originalName == originalName &&
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
      name.hashCode ^
      originCountry.hashCode ^
      originalLanguage.hashCode ^
      originalName.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;
  }
}
