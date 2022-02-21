import 'dart:convert';

import 'package:flutter/foundation.dart';


class TrendingVideo {
    final String posterPath;
    final String title;
    final bool video;
    final double voteAverage;
    final String overview;
    final DateTime releaseDate;
    final bool adult;
    final String backdropPath;
    final int id;
    final List<int> genreIds;
    final int voteCount;
    final String originalLanguage;
    final String originalTitle;
    final double popularity;
    final String mediaType;
    final String originalName;
    final List<String> originCountry;
    final String name;
    final DateTime firstAirDate;
  TrendingVideo({
    required this.posterPath,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.genreIds,
    required this.voteCount,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.mediaType,
    required this.originalName,
    required this.originCountry,
    required this.name,
    required this.firstAirDate,
  });

  TrendingVideo copyWith({
    String? posterPath,
    String? title,
    bool? video,
    double? voteAverage,
    String? overview,
    DateTime? releaseDate,
    bool? adult,
    String? backdropPath,
    int? id,
    List<int>? genreIds,
    int? voteCount,
    String? originalLanguage,
    String? originalTitle,
    double? popularity,
    String? mediaType,
    String? originalName,
    List<String>? originCountry,
    String? name,
    DateTime? firstAirDate,
  }) {
    return TrendingVideo(
      posterPath: posterPath ?? this.posterPath,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      id: id ?? this.id,
      genreIds: genreIds ?? this.genreIds,
      voteCount: voteCount ?? this.voteCount,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      popularity: popularity ?? this.popularity,
      mediaType: mediaType ?? this.mediaType,
      originalName: originalName ?? this.originalName,
      originCountry: originCountry ?? this.originCountry,
      name: name ?? this.name,
      firstAirDate: firstAirDate ?? this.firstAirDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'posterPath': posterPath,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'overview': overview,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'adult': adult,
      'backdropPath': backdropPath,
      'id': id,
      'genreIds': genreIds,
      'voteCount': voteCount,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'popularity': popularity,
      'mediaType': mediaType,
      'originalName': originalName,
      'originCountry': originCountry,
      'name': name,
      'firstAirDate': firstAirDate.millisecondsSinceEpoch,
    };
  }

  factory TrendingVideo.fromMap(Map<String, dynamic> map) {
    return TrendingVideo(
      posterPath: map['poster_path'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      overview: map['overview'] ?? '',
      releaseDate: DateTime.fromMillisecondsSinceEpoch(map['release_date']),
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      id: map['id']?.toInt() ?? 0,
      genreIds: List<int>.from(map['genreIds']),
      voteCount: map['voteCount']?.toInt() ?? 0,
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      mediaType: map['media_type'] ?? '',
      originalName: map['original_name'] ?? '',
      originCountry: List<String>.from(map['origin_country']),
      name: map['name'] ?? '',
      firstAirDate: DateTime.parse(map['first_air_date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrendingVideo.fromJson(String source) => TrendingVideo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrendingVideo(posterPath: $posterPath, title: $title, video: $video, voteAverage: $voteAverage, overview: $overview, releaseDate: $releaseDate, adult: $adult, backdropPath: $backdropPath, id: $id, genreIds: $genreIds, voteCount: $voteCount, originalLanguage: $originalLanguage, originalTitle: $originalTitle, popularity: $popularity, mediaType: $mediaType, originalName: $originalName, originCountry: $originCountry, name: $name, firstAirDate: $firstAirDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TrendingVideo &&
      other.posterPath == posterPath &&
      other.title == title &&
      other.video == video &&
      other.voteAverage == voteAverage &&
      other.overview == overview &&
      other.releaseDate == releaseDate &&
      other.adult == adult &&
      other.backdropPath == backdropPath &&
      other.id == id &&
      listEquals(other.genreIds, genreIds) &&
      other.voteCount == voteCount &&
      other.originalLanguage == originalLanguage &&
      other.originalTitle == originalTitle &&
      other.popularity == popularity &&
      other.mediaType == mediaType &&
      other.originalName == originalName &&
      listEquals(other.originCountry, originCountry) &&
      other.name == name &&
      other.firstAirDate == firstAirDate;
  }

  @override
  int get hashCode {
    return posterPath.hashCode ^
      title.hashCode ^
      video.hashCode ^
      voteAverage.hashCode ^
      overview.hashCode ^
      releaseDate.hashCode ^
      adult.hashCode ^
      backdropPath.hashCode ^
      id.hashCode ^
      genreIds.hashCode ^
      voteCount.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      popularity.hashCode ^
      mediaType.hashCode ^
      originalName.hashCode ^
      originCountry.hashCode ^
      name.hashCode ^
      firstAirDate.hashCode;
  }
}
