import 'dart:convert';

import 'package:netflix_clone_ui/models/episode.dart';

class Season {
  final int id;
  final DateTime airDate;
  final List<Episode> episodes;
  final String name;
  final String overview;
  final int seasonId;
  final String posterPath;
  final int seasonNumber;
  Season({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.seasonId,
    required this.posterPath,
    required this.seasonNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'airDate': airDate.millisecondsSinceEpoch,
      'episodes': episodes.map((x) => x.toMap()).toList(),
      'name': name,
      'overview': overview,
      'seasonId': seasonId,
      'posterPath': posterPath,
      'seasonNumber': seasonNumber,
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      id: map['id'] ?? '',
      airDate: DateTime.parse(map['air_date']),
      episodes: List<Episode>.from(map['episodes']?.map((x) => Episode.fromMap(x))),
      name: map['name'] ?? '',
      overview: map['overview'] ?? '',
      seasonId: map['season_id']?.toInt() ?? 0,
      posterPath: map['poster_path'] ?? '',
      seasonNumber: map['season_number']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Season.fromJson(String source) => Season.fromMap(json.decode(source));

  Season copyWith({
    int? id,
    DateTime? airDate,
    List<Episode>? episodes,
    String? name,
    String? overview,
    int? seasonId,
    String? posterPath,
    int? seasonNumber,
  }) {
    return Season(
      id: id ?? this.id,
      airDate: airDate ?? this.airDate,
      episodes: episodes ?? this.episodes,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      seasonId: seasonId ?? this.seasonId,
      posterPath: posterPath ?? this.posterPath,
      seasonNumber: seasonNumber ?? this.seasonNumber,
    );
  }
}
