// lib/models/user.dart

class User {
  final String id;
  final String name;
  final String email;
  final int ecoPoints;
  final int level;
  final int totalSteps;
  final int totalMinutesOutside;
  final int streakDays;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime lastActiveAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.ecoPoints = 0,
    this.level = 1,
    this.totalSteps = 0,
    this.totalMinutesOutside = 0,
    this.streakDays = 0,
    this.avatarUrl,
    required this.createdAt,
    required this.lastActiveAt,
  });

  // Calculate progress to next level (0.0 to 1.0)
  double get levelProgress {
    final pointsForCurrentLevel = (level - 1) * 1000;
    final pointsForNextLevel = level * 1000;
    final pointsInCurrentLevel = ecoPoints - pointsForCurrentLevel;
    final pointsNeededForLevel = pointsForNextLevel - pointsForCurrentLevel;
    return pointsInCurrentLevel / pointsNeededForLevel;
  }

  // Points needed to reach next level
  int get pointsToNextLevel {
    final pointsForNextLevel = level * 1000;
    return pointsForNextLevel - ecoPoints;
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    int? ecoPoints,
    int? level,
    int? totalSteps,
    int? totalMinutesOutside,
    int? streakDays,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? lastActiveAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      ecoPoints: ecoPoints ?? this.ecoPoints,
      level: level ?? this.level,
      totalSteps: totalSteps ?? this.totalSteps,
      totalMinutesOutside: totalMinutesOutside ?? this.totalMinutesOutside,
      streakDays: streakDays ?? this.streakDays,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'ecoPoints': ecoPoints,
      'level': level,
      'totalSteps': totalSteps,
      'totalMinutesOutside': totalMinutesOutside,
      'streakDays': streakDays,
      'avatarUrl': avatarUrl,
      'createdAt': createdAt.toIso8601String(),
      'lastActiveAt': lastActiveAt.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      ecoPoints: json['ecoPoints'] ?? 0,
      level: json['level'] ?? 1,
      totalSteps: json['totalSteps'] ?? 0,
      totalMinutesOutside: json['totalMinutesOutside'] ?? 0,
      streakDays: json['streakDays'] ?? 0,
      avatarUrl: json['avatarUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      lastActiveAt: DateTime.parse(json['lastActiveAt']),
    );
  }
}