import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class RewardProgressItem extends StatelessWidget {
  final String title;
  final String description;
  final int currentPoints;
  final int requiredPoints;
  final IconData icon;

  const RewardProgressItem({super.key,
    required this.title,
    required this.description,
    required this.currentPoints,
    required this.requiredPoints,
    this.icon = Icons.card_giftcard,
  });

  double get progress => currentPoints / requiredPoints;
  int get percentComplete => (progress * 100).toInt();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: AppColors.accent, size: 24),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                          )
                      ),
                      SizedBox(height: 4),
                      Text(
                          description,
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.dark.withOpacity(0.7)
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                      '$percentComplete%',
                      style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '$currentPoints / $requiredPoints',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColors.dark.withOpacity(0.7)
                    )
                ),
                Text(
                    'Осталось: ${requiredPoints - currentPoints}',
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600
                    )
                ),
              ],
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress > 1.0 ? 1.0 : progress,
                minHeight: 10,
                color: AppColors.accent,
                backgroundColor: AppColors.dark.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}