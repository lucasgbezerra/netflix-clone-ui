import 'dart:convert';

class Episode {
  final DateTime airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final String stillPath;
  final double voteAverage;
  final int voteCount;
  Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });
  // final List<Crew> crew;
  // final List<Crew> guestStars;

  Map<String, dynamic> toMap() {
    return {
      'airDate': airDate.millisecondsSinceEpoch,
      'episodeNumber': episodeNumber,
      'id': id,
      'name': name,
      'overview': overview,
      'productionCode': productionCode,
      'seasonNumber': seasonNumber,
      'stillPath': stillPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      airDate: DateTime.parse(map['air_date']),
      episodeNumber: map['episode_number']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      overview: map['overview'] ?? '',
      productionCode: map['production_code'] ?? '',
      seasonNumber: map['season_number']?.toInt() ?? 0,
      stillPath: map['still_path'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Episode.fromJson(String source) => Episode.fromMap(json.decode(source));
}
