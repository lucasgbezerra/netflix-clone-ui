import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:netflix_clone_ui/models/cast.dart';

import 'genre.dart';

class TvshowDetail {
  final bool adult;
  final String backdropPath;
  // final List<int> episodeRunTime;
  final DateTime releaseDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime lastAirDate;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;
  final String ageRating;
  final List<Cast>? cast;
  final List<Cast>? createdBy;
  // final TEpisodeToAir lastEpisodeToAir;
  // final TEpisodeToAir nextEpisodeToAir;
  // final List<Network> networks;
  // final List<Network> productionCompanies;
  // final List<ProductionCountry> productionCountries;
  // final List<Season> seasons;
  // final List<SpokenLanguage> spokenLanguages;
  TvshowDetail({
    required this.adult,
    required this.backdropPath,
    required this.releaseDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
    required this.ageRating,
    required this.cast,
    required this.createdBy,
  });



  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdropPath': backdropPath,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'inProduction': inProduction,
      'languages': languages,
      'lastAirDate': lastAirDate.millisecondsSinceEpoch,
      'name': name,
      'numberOfEpisodes': numberOfEpisodes,
      'numberOfSeasons': numberOfSeasons,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'status': status,
      'tagline': tagline,
      'type': type,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'ageRating': ageRating,
      'cast': cast,
      'createdBy':createdBy,
    };
  }

  factory TvshowDetail.fromMap(Map<String, dynamic> map) {
    return TvshowDetail(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      releaseDate: DateTime.parse(map['first_air_date']),
      genres: List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      homepage: map['homepage'] ?? '',
      id: map['id']?.toInt() ?? 0,
      inProduction: map['in_production'] ?? false,
      languages: List<String>.from(map['languages']),
      lastAirDate: DateTime.parse(map['last_air_date']),
      name: map['name'] ?? '',
      numberOfEpisodes: map['number_of_episodes']?.toInt() ?? 0,
      numberOfSeasons: map['number_of_seasons']?.toInt() ?? 0,
      originCountry: List<String>.from(map['origin_country']),
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_name'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      type: map['type'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      ageRating: map['content_ratings'] ?? '',
      cast: map['cast'] != null ? List<Cast>.from(map['cast']?.map((x) => Cast.fromMap(x))) : null,
      createdBy: map['created_by'] != null ? List<Cast>.from(map['created_by']?.map((x) => Cast.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TvshowDetail.fromJson(String source) =>
      TvshowDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TvshowDetail(adult: $adult, backdropPath: $backdropPath, releaseDate: $releaseDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, name: $name, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, status: $status, tagline: $tagline, type: $type, voteAverage: $voteAverage, voteCount: $voteCount, ageRating: $ageRating)';
  }

  TvshowDetail copyWith({
    bool? adult,
    String? backdropPath,
    DateTime? releaseDate,
    List<Genre>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    DateTime? lastAirDate,
    String? name,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
    String? ageRating,
    List<Cast>? cast,
    List<Cast>? createdBy,
  }) {
    return TvshowDetail(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      releaseDate: releaseDate ?? this.releaseDate,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      inProduction: inProduction ?? this.inProduction,
      languages: languages ?? this.languages,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      name: name ?? this.name,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      ageRating: ageRating ?? this.ageRating,
      cast: cast ?? this.cast,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
