// lib/models/walk.dart

enum WalkStatus {
  upcoming,
  inProgress,
  completed,
  cancelled,
}

class Walk {
  final String id;
  final String creatorId;
  final String title;
  final String? description;
  final DateTime startTime;
  final int durationMinutes;
  final double distanceKm;
  final String? routeId;
  final int maxParticipants;
  final List<String> participantIds;
  final bool requiresApproval;
  final WalkStatus status;
  final String? meetingPoint;
  final List<String>? tags;
  final bool isAccessible; // для людей с ограниченными возможностями
  final DateTime createdAt;

  Walk({
    required this.id,
    required this.creatorId,
    required this.title,
    this.description,
    required this.startTime,
    required this.durationMinutes,
    this.distanceKm = 0.0,
    this.routeId,
    this.maxParticipants = 10,
    this.participantIds = const [],
    this.requiresApproval = false,
    this.status = WalkStatus.upcoming,
    this.meetingPoint,
    this.tags,
    this.isAccessible = false,
    required this.createdAt,
  });

  int get availableSpots => maxParticipants - participantIds.length;
  bool get isFull => participantIds.length >= maxParticipants;
  int get participantCount => participantIds.length;

  Walk copyWith({
    String? id,
    String? creatorId,
    String? title,
    String? description,
    DateTime? startTime,
    int? durationMinutes,
    double? distanceKm,
    String? routeId,
    int? maxParticipants,
    List<String>? participantIds,
    bool? requiresApproval,
    WalkStatus? status,
    String? meetingPoint,
    List<String>? tags,
    bool? isAccessible,
    DateTime? createdAt,
  }) {
    return Walk(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      distanceKm: distanceKm ?? this.distanceKm,
      routeId: routeId ?? this.routeId,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      participantIds: participantIds ?? this.participantIds,
      requiresApproval: requiresApproval ?? this.requiresApproval,
      status: status ?? this.status,
      meetingPoint: meetingPoint ?? this.meetingPoint,
      tags: tags ?? this.tags,
      isAccessible: isAccessible ?? this.isAccessible,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'durationMinutes': durationMinutes,
      'distanceKm': distanceKm,
      'routeId': routeId,
      'maxParticipants': maxParticipants,
      'participantIds': participantIds,
      'requiresApproval': requiresApproval,
      'status': status.toString(),
      'meetingPoint': meetingPoint,
      'tags': tags,
      'isAccessible': isAccessible,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Walk.fromJson(Map<String, dynamic> json) {
    return Walk(
      id: json['id'],
      creatorId: json['creatorId'],
      title: json['title'],
      description: json['description'],
      startTime: DateTime.parse(json['startTime']),
      durationMinutes: json['durationMinutes'],
      distanceKm: json['distanceKm'] ?? 0.0,
      routeId: json['routeId'],
      maxParticipants: json['maxParticipants'] ?? 10,
      participantIds: List<String>.from(json['participantIds'] ?? []),
      requiresApproval: json['requiresApproval'] ?? false,
      status: WalkStatus.values.firstWhere(
            (e) => e.toString() == json['status'],
        orElse: () => WalkStatus.upcoming,
      ),
      meetingPoint: json['meetingPoint'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      isAccessible: json['isAccessible'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}