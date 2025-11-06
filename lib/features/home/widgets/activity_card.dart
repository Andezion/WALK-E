// lib/features/home/widgets/activity_card.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ActivityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            _metricBlock('Шаги', '4 320', Icons.directions_walk),
            VerticalDivider(),
            _metricBlock('На улице', '35 мин', Icons.wb_sunny_outlined),
            VerticalDivider(),
            _metricBlock('Уровень', '8', Icons.star),
          ],
        ),
      ),
    );
  }

  Widget _metricBlock(String title, String value, IconData icon) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.dark),
          SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: AppColors.dark.withOpacity(0.7))),
        ],
      ),
    );
  }
}