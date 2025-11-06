enum RewardType {
  discount,
  subscription,
  customization,
  feature,
}

enum RewardCategory {
  food,
  entertainment,
  transport,
  culture,
  customization,
}

class Reward {
  final String id;
  final String title;
  final String description;
  final int costEcoPoints;
  final RewardType type;
  final RewardCategory category;
  final String? partnerName;
  final String? imageUrl;
  final bool isAvailable;
  final DateTime? expiresAt;
  final int? discountPercent;
  final int maxRedemptions;
  final int currentRedemptions;

  Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.costEcoPoints,
    required this.type,
    required this.category,
    this.partnerName,
    this.imageUrl,
    this.isAvailable = true,
    this.expiresAt,
    this.discountPercent,
    this.maxRedemptions = 0,
    this.currentRedemptions = 0,
  });

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);
  bool get isLimited => maxRedemptions > 0;
  bool get isFullyRedeemed => isLimited && currentRedemptions >= maxRedemptions;
  int get remainingRedemptions => isLimited ? maxRedemptions - currentRedemptions : -1;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'costEcoPoints': costEcoPoints,
      'type': type.toString(),
      'category': category.toString(),
      'partnerName': partnerName,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'expiresAt': expiresAt?.toIso8601String(),
      'discountPercent': discountPercent,
      'maxRedemptions': maxRedemptions,
      'currentRedemptions': currentRedemptions,
    };
  }

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      costEcoPoints: json['costEcoPoints'],
      type: RewardType.values.firstWhere(
              (e) => e.toString() == json['type']
      ),
      category: RewardCategory.values.firstWhere(
              (e) => e.toString() == json['category']
      ),
      partnerName: json['partnerName'],
      imageUrl: json['imageUrl'],
      isAvailable: json['isAvailable'] ?? true,
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'])
          : null,
      discountPercent: json['discountPercent'],
      maxRedemptions: json['maxRedemptions'] ?? 0,
      currentRedemptions: json['currentRedemptions'] ?? 0,
    );
  }
}

class UserReward {
  final String id;
  final String userId;
  final String rewardId;
  final DateTime redeemedAt;
  final bool isUsed;
  final DateTime? usedAt;
  final String? code;

  UserReward({
    required this.id,
    required this.userId,
    required this.rewardId,
    required this.redeemedAt,
    this.isUsed = false,
    this.usedAt,
    this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'rewardId': rewardId,
      'redeemedAt': redeemedAt.toIso8601String(),
      'isUsed': isUsed,
      'usedAt': usedAt?.toIso8601String(),
      'code': code,
    };
  }

  factory UserReward.fromJson(Map<String, dynamic> json) {
    return UserReward(
      id: json['id'],
      userId: json['userId'],
      rewardId: json['rewardId'],
      redeemedAt: DateTime.parse(json['redeemedAt']),
      isUsed: json['isUsed'] ?? false,
      usedAt: json['usedAt'] != null
          ? DateTime.parse(json['usedAt'])
          : null,
      code: json['code'],
    );
  }
}