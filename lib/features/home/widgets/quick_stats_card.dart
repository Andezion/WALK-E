import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class QuickStatsCard extends StatelessWidget {
  const QuickStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            _smallStat('Streak', '5', Icons.local_fire_department),
            _smallStat('Record', '10 km', Icons.timeline),
            _smallStat('Rewards', '3', Icons.emoji_events),
          ],
        ),
      ),
    );
  }

  Widget _smallStat(String title, String value, IconData icon) {
    return Expanded(
      child: Column(
          children: [
            Icon(icon, color: AppColors.accent),
            SizedBox(height: 6),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(title, style: TextStyle(color: AppColors.dark.withOpacity(0.7))),
          ]
      ),
    );
  }
}