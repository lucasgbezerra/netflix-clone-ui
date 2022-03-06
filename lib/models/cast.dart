import 'dart:convert';

class Cast {
    // final bool adult;
    final int gender;
    final int id;
    final String knownForDepartment;
    final String name;
    final String originalName;
    final double popularity;
    final String profilePath;
    final int? castId;
    final String? character;
    final String creditId;
    final int? order;
    final String? department;
    final String? job;
  Cast({
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'id': id,
      'knownForDepartment': knownForDepartment,
      'name': name,
      'originalName': originalName,
      'popularity': popularity,
      'profilePath': profilePath,
      'castId': castId,
      'character': character,
      'creditId': creditId,
      'order': order,
      'department': department,
      'job': job,
    };
  }

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      gender: map['gender']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      knownForDepartment: map['known_for_department'] ?? '',
      name: map['name'] ?? '',
      originalName: map['original_name'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      profilePath: map['profile_path'] ?? '',
      castId: map['castId']?.toInt(),
      character: map['credit_id'],
      creditId: map['creditId'] ?? '',
      order: map['order']?.toInt(),
      department: map['department'],
      job: map['job'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cast.fromJson(String source) => Cast.fromMap(json.decode(source));
}

