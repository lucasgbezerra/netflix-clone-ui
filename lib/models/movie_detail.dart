import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:netflix_clone_ui/models/cast.dart';

import 'genre.dart';

class MovieDetail {

  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  // final  List<ProductionCompany> productionCompanies;
  // final List<ProductionCountry> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  // final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String ageRating;
  final List<Cast>? cast;
  final List<Cast>? crew;
  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.ageRating,
    this.cast,
    this.crew,
  });
 

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection,
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'revenue': revenue,
      'runtime': runtime,
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'ageRating': ageRating,
      'cast': cast?.map((x) => x.toMap()).toList(),
      'crew': crew?.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      belongsToCollection: map['belongs_to_collection'] ?? null,
      budget: map['budget']?.toInt() ?? 0,
      genres: List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      homepage: map['homepage'] ?? '',
      id: map['id']?.toInt() ?? 0,
      imdbId: map['imdbId'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      releaseDate: DateTime.parse(map['release_date']),
      revenue: map['revenue']?.toInt() ?? 0,
      runtime: map['runtime']?.toInt() ?? 0,
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      ageRating: map['release_dates'] ?? '',
      cast: map['cast'] != null ? List<Cast>.from(map['cast']?.map((x) => Cast.fromMap(x))) : null,
      crew: map['crew'] != null ? List<Cast>.from(map['crew']?.map((x) => Cast.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) => MovieDetail.fromMap(json.decode(source));

  MovieDetail copyWith({
    bool? adult,
    String? backdropPath,
    dynamic? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
    String? ageRating,
    List<Cast>? cast,
    List<Cast>? crew,
  }) {
    return MovieDetail(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      ageRating: ageRating ?? this.ageRating,
      cast: cast ?? this.cast,
      crew: crew ?? this.crew,
    );
  }
}
