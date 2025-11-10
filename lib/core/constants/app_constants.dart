class AppConstants {
  static const String appName = 'WALK-E';
  static const String appVersion = '1.0.0';

  static const int pointsPerStep = 1;
  static const int pointsPerMinuteOutside = 2;
  static const int dailyTaskBonus = 50;
  static const int reportProblemBonus = 10;

  static const String activityWalking = 'Walking';
  static const String activityRunning = 'Run';
  static const String activityBicycle = 'Bicycle';
  static const String activityScooter = 'Scooter';

  static const int pointsPerLevel = 1000;
  static const int maxLevel = 100;

  static const List<String> drawingTemplates = [
      'Heart',
      'Star',
      'Smiley face',
      'Unicorn',
      'Cat',
      'Poop'
  ];

  static const double maxDistanceKm = 50.0;
  static const double minDistanceKm = 0.0;

  static const int reminderHours = 1;
}