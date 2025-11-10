import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ProfileInfoCard extends StatelessWidget {
  final String name;
  final int ecoPoints;
  final int level;
  final double levelProgress;

  const ProfileInfoCard({super.key,
    required this.name,
    required this.ecoPoints,
    required this.level,
    this.levelProgress = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              AppColors.accent.withOpacity(0.1),
              AppColors.deep.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
                radius: 44,
                backgroundColor: AppColors.accent,
                child: Icon(Icons.person, color: Colors.white, size: 44)
            ),
            SizedBox(height: 12),
            Text(
                name,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Sprouts', ecoPoints.toString(), Icons.eco),
                Container(
                  width: 1,
                  height: 40,
                  color: AppColors.dark.withOpacity(0.2),
                ),
                _buildStatItem('Level', level.toString(), Icons.star),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Progress to the level ${level + 1}',
                        style: TextStyle(fontSize: 12)
                    ),
                    Text(
                        '${(levelProgress * 100).toInt()}%',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accent
                        )
                    ),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: levelProgress,
                  color: AppColors.accent,
                  backgroundColor: AppColors.dark.withOpacity(0.1),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.accent, size: 28),
        SizedBox(height: 6),
        Text(
            value,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.dark
            )
        ),
        SizedBox(height: 4),
        Text(
            label,
            style: TextStyle(
                fontSize: 12,
                color: AppColors.dark.withOpacity(0.7)
            )
        ),
      ],
    );
  }
}