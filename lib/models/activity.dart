enum ActivityType {
  walking,
  running,
  bicycle,
  scooter,
}

class Activity {
  final String id;
  final String userId;
  final ActivityType type;
  final int steps;
  final int durationMinutes;
  final double distanceKm;
  final int ecoPointsEarned;
  final DateTime startTime;
  final DateTime endTime;
  final String? routeId;
  final List<LocationPoint>? routePoints;

  Activity({
    required this.id,
    required this.userId,
    required this.type,
    this.steps = 0,
    required this.durationMinutes,
    required this.distanceKm,
    required this.ecoPointsEarned,
    required this.startTime,
    required this.endTime,
    this.routeId,
    this.routePoints,
  });

  String get typeDisplayName {
    switch (type) {
      case ActivityType.walking:
        return 'Walk';
      case ActivityType.running:
        return 'Run';
      case ActivityType.bicycle:
        return 'Bike';
      case ActivityType.scooter:
        return 'Scooter';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type.toString(),
      'steps': steps,
      'durationMinutes': durationMinutes,
      'distanceKm': distanceKm,
      'ecoPointsEarned': ecoPointsEarned,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'routeId': routeId,
      'routePoints': routePoints?.map((p) => p.toJson()).toList(),
    };
  }

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      userId: json['userId'],
      type: ActivityType.values.firstWhere(
              (e) => e.toString() == json['type']
      ),
      steps: json['steps'] ?? 0,
      durationMinutes: json['durationMinutes'],
      distanceKm: json['distanceKm'],
      ecoPointsEarned: json['ecoPointsEarned'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      routeId: json['routeId'],
      routePoints: json['routePoints'] != null
          ? (json['routePoints'] as List)
          .map((p) => LocationPoint.fromJson(p))
          .toList()
          : null,
    );
  }
}

class LocationPoint {
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  LocationPoint({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory LocationPoint.fromJson(Map<String, dynamic> json) {
    return LocationPoint(
      latitude: json['latitude'],
      longitude: json['longitude'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}